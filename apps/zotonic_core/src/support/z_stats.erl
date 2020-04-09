%% @author Maas-Maarten Zeeman <mmzeeman@xs4all.nl>
%% @copyright 2013-2015 Maas-Maarten Zeeman
%% Date: 2015-11-16
%% @doc Module for handling request statistics.

%% Copyright 2013-2015 Maas-Maarten Zeeman
%%
%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%%
%%     http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.

-module(z_stats).

-include_lib("zotonic.hrl").

-export([init/0, init_site/1]).

%% Act as a webmachine logger
-export([log_access/1]).


%% @doc Initialize the statistics collection machinery.
%%
init() ->
    create_vm_metrics(),
    setup_system_reporter(),

    ok.

% @doc Setup stats for each site.
init_site(Host) ->
    exometer:re_register([zotonic, Host, depcache, evictions], spiral, []),

    %% Database metrics
    exometer:re_register([zotonic, Host, db, requests], counter, []),
    exometer:re_register([zotonic, Host, db, duration], histogram, []),

    %% Session metrics
    %% [TODO] add mqtt sessions
    %% exometer:re_register([zotonic, Host, session, sessions], gauge, []),
    %% exometer:re_register([zotonic, Host, session, page_processes], counter, []),

    ok.


%% @doc Collect log data from cowmachine and update cowmachine metrics
%%

log_access(MetricsData) ->
    try
        handle_stats(MetricsData)
    after
        z_access_syslog:log_access(MetricsData)
    end.


% @private Register the request.
handle_stats(MetricsData) ->
    Site = get_site(MetricsData),
    DispatchRule = get_dispatch_rule(MetricsData),

    Duration = duration(maps:get(req_start, MetricsData, undefined),
                        maps:get(resp_end, MetricsData, undefined)),

    DataIn = maps:get(req_body_length, MetricsData),
    DataOut = maps:get(resp_body_length, MetricsData),

    Reason = maps:get(reason, MetricsData),
    Status = maps:get(resp_status, MetricsData),

    StatusCategory = http_status_category(Reason, Status),

    PathPrefix = [zotonic, Site, cowmachine, DispatchRule, StatusCategory],

    ok = exometer:update_or_create(PathPrefix ++ [requests], 1, spiral, []),

    if Duration > 0 ->
           ok = exometer:update_or_create(PathPrefix ++ [duration], Duration, histogram, []);
       Duration =< 0 ->
           ok
    end,

    if DataIn > 0 ->
           ok = exometer:update_or_create(PathPrefix ++ [data_in], DataIn, spiral, []);
       DataIn =< 0 ->
           ok
    end,

    if DataOut > 0 ->
           ok = exometer:update_or_create(PathPrefix ++ [data_out], DataOut, spiral, []);
       DataOut =< 0 ->
           ok
    end,

    ok.


%%
%% Helpers
%%

all_http_status_categories() ->
    ['1xx', '2xx', '3xx', '4xx', '5xx', 'xxx'].

% @private return a status category
http_status_category(switch_protocol, _) -> '1xx';
http_status_category(_, X) when X < 300 -> '2xx';
http_status_category(_, X) when X < 400 -> '3xx';
http_status_category(_, X) when X < 500 -> '4xx';
http_status_category(_, X) when X < 600 -> '5xx';
http_status_category(_, _X) -> 'xxx'.


% @private Return the site name from the user-data
get_site(#{user_data := #{site := Site}}) -> Site;
get_site(#{}) -> '$unknown'.

% @private Return the selected dispatch rule
get_dispatch_rule(#{user_data := #{dispatch_rule := DispatchRule}}) -> DispatchRule;
get_dispatch_rule(#{}) -> '$unknown'. 


% @private Return the duration in microseconds.
duration(undefined, _) -> undefined;
duration(_, undefined) -> undefined;
duration(Start, End) ->
    erlang:convert_time_unit(End-Start, native, microsecond).


% @private vm_stats
create_vm_metrics() ->
    ok = exometer:new([erlang, memory],
                      {function, erlang, memory, ['$dp'], value,
                       [total, processes, system, atom, binary, ets]}),

    ok = exometer:new([erlang, system],
                      {function, erlang, system_info, ['$dp'], value,
                       [process_count, port_count]}),

    ok = exometer:new([erlang, statistics],
                      {function, erlang, statistics, ['$dp'], value,
                       [run_queue]}),

    ok = exometer:new([erlang, gc],
                      {function, erlang, statistics, [garbage_collection],
                       match, {total_coll, rec_wrd, '_'}}),

    ok = exometer:new([erlang, io],
                      {function, erlang, statistics, [io], match,
                       {{'_', input}, {'_', output}}}).


% @private Setup mqtt reporter
setup_system_reporter() ->
    add_system_reporter(),

    ok = exometer_report:subscribe(system_reporter,
                                   {select,
                                    [{ {[zotonic | '_'], '_', enabled}, [], ['$_'] }]},
                                   default,
                                   10000),
    
    ok = exometer_report:subscribe(system_reporter,
                                   {select,
                                    [{ {[erlang | '_'], '_', enabled}, [], ['$_'] }]},
                                   default,
                                   10000),

    ok.


% Add the system reporter. It publishes on the default mqtt pool for
% the whole system.
add_system_reporter() -> 
    case exometer_report:add_reporter(
           system_reporter,
           [ {module, z_exometer_mqtt},
             {status, enabled},
             {report_bulk, true},
             {topic_prefix, [<<"$SYS">>]},
             {context, #context{ site = '-mqtt-',
                                 acl = admin }} ]) of
        ok -> ok;
        {error, already_running} -> ok
    end.
