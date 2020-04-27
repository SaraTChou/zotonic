{% extends "admin_base.tpl" %}

{% block title %}{_ Statistics _}{% endblock %}

{% block content %}

<div class="row">

<div class="col-md-2 col-lg-2 col-sm-2 col-xs-4">
  <div class="panel panel-default">
    <div class="panel-heading">Run Queue</div>
    <div class="panel-body">
        {% for id, name in [ ["statistics-run_queue", "Run Queue"] ] %}
            {% include "_stat_info.tpl" id=id name=name %}
        {% endfor %}
    </div>
  </div>
</div>

<div class="col-md-4 col-lg-4 col-sm-4 col-xs-6">
    <div class="panel panel-default">
        <div class="panel-heading">Memory Usage</div>

        <div class="panel-body">
            <div class="progress">
                <div id="usage-process_memory-progress" class="progress-bar" style="background-color: gold"></div>
                <div id="usage-atom_memory-progress" class="progress-bar" style="background-color: dodgerblue"></div>
                <div id="usage-ets_memory-progress" class="progress-bar" style="background-color: lightgreen"></div>
                <div id="usage-binary_memory-progress" class="progress-bar" style="background-color: tomato"></div>
                <div id="usage-code_memory-progress" class="progress-bar" style="background-color: orchid"></div>
            </div>
            <div class="row">
                <div class="col-md-1"><span style="color: gold">&#9607;</span></div>
                <div class="col-md-2">process</div>
                <div id="memory-processes" class="col-md-3 text-right">#</div>

                <div class="col-md-1"><span style="color: dodgerblue">&#9607;</span></div>
                <div class="col-md-2">ets</div>
                <div id="memory-atom" class="col-md-3 text-right">#</div>
            </div>
            
            <div class="row">
                <div class="col-md-1"><span style="color: lightgreen">&#9607;</span></div>
                <div class="col-md-2">atom</div>
                <div id="memory-ets" class="col-md-3 text-right">#</div>

                <div class="col-md-1"><span style="color: tomato">&#9607;</span></div>
                <div class="col-md-2">binary</div>
                <div id="memory-binary" class="col-md-3 text-right">#</div>
            </div>

            <div class="row">
                <div class="col-md-1"><span style="color: orchid">&#9607;</span></div>
                <div class="col-md-2">code</div>
                <div id="memory-code" class="col-md-3 text-right">#</div>

                <div class="col-md-1" style="color: lightgray">&#9607;</div>
                <div class="col-md-2">other</div>
                <div id="memory-other" class="col-md-3 text-right">#</div>
            </div>

            <div class="row">
                <div class="col-md-12 text-right">
                    <span>Total </span><span id="memory-total"></span>
                </div>
                {% javascript %}
                    $("#memory-binary").data("render", to_human);
                    $("#memory-atom").data("render", to_human);
                    $("#memory-code").data("render", to_human);
                    $("#memory-ets").data("render", to_human);
                    $("#memory-processes").data("render", to_human);
                    $("#memory-total").data("render", to_human);
                {% endjavascript %}
            </div>
        </div>

    </div>
</div>

<div class="col-md-4 col-lg-4 col-sm-4 col-xs-6">
    <div class="panel panel-default">

        <div class="panel-heading">System Usage</div>

        <div class="panel-body">

            <div>
                <div class="row">
                    <div class="col-md-6">Atoms: <strong id="usage-atom-value">#</strong>%</div>
                    <div class="col-md-6 text-right">
                        <span id="system-atom_count">#</span>/<span id="system-atom_limit">#</span> 
                    </div>
                </div>
                {% javascript %}
                    $("#system-atom_count").data("render", function(v) { return v; });
                    $("#system-atom_limit").data("render", function(v) { return v; });
                {% endjavascript %}
                <div class="progress">
                    <div id="usage-atom-progress" class="progress-bar progress-bar-success" role="progressbar"
                         style="width: 0%">
                    </div>
                </div>
            </div>

            <div>
                <div class="row">
                    <div class="col-md-6">Ports: <strong id="usage-port-value" id="usage-port-value">#</strong>%</div>
                    <div class="col-md-6 text-right">
                        <span id="system-port_count">#</span>/<span id="system-port_limit">#</span> 
                    </div>
                </div>
                {% javascript %}
                    $("#system-port_count").data("render", function(v) { return v; });
                    $("#system-port_limit").data("render", function(v) { return v; });
                {% endjavascript %}
                <div class="progress">
                    <div id="usage-port-progress" class="progress-bar progress-bar-success" style="width: 0%"> </div>
                </div>
            </div>

            <div>
                <div class="row">
                    <div class="col-md-6">Processes: <strong id="usage-process-value">#</strong>%</div>
                    <div class="col-md-6 text-right">
                        <span id="system-process_count">#</span>/<span id="system-process_limit">#</span> 
                    </div>
                </div>
                {% javascript %}
                    $("#system-process_count").data("render", function(v) { return v; });
                    $("#system-process_limit").data("render", function(v) { return v; });
                {% endjavascript %}
                <div class="progress">
                    <div id="usage-process-progress" class="progress-bar progress-bar-success" role="progressbar" style="width: 0%"></div>
                </div>
            </div>

        </div>
    </div>
</div>

<div class="col-md-4 col-lg-4 col-sm-5">
  <div class="panel panel-default">
    <div class="panel-heading">I/O</div>
    <div class="panel-body">
        {% for id, name in [
                ["io-input", "Input"],
                ["io-output", "Output"]] %}
            {% include "_stat_info.tpl" id=id name=name render="to_human" %}
        {% endfor %}

        {% for id, name in [
                ["network-tcp_port_count", "Open TCP Connections"]] %}
            {% include "_stat_info.tpl" id=id name=name %}
        {% endfor %}
    </div>
  </div>
</div>

<div class="col-md-6 col-lg-6 col-sm-12">
  <div class="panel panel-default">
    <div class="panel-heading">Dispatch</div>
    <div class="panel-body">
        <table class="table">
            <thead>
                <tr>
                    <th>Dispatch</th>
                    <th>Req/min</th>
                    <th>Mean Latency</th>
                    <th>99 percentile</t>
                </tr>
            </thead>
            <tbody id="the-stats">
            </tbody>
        </table>
    </div>
  </div>
</div>


</div>

{% javascript %}
function to_human(value) {
    if(value < 512) // .5 kb
        return value + "<small>B</small>";

    if(value < 524288) // .5 Mb
        return (value/1024).toFixed(1) + "<small>Kb</small>";

    if(value < 536870912) // .5 Gb
        return (value/1024/1024).toFixed(1) + "<small>Mb</small>";

    if(value < 549755813888) // *.5 Tb
        return (value/1024/1024/1024).toFixed(1) + "<small>Gb</small>";

    return (value/1024/1024/1024/1024).toFixed(1) + "<small>Tb</small>";
}
{% endjavascript %}

{% javascript %}
    let collected = {};

    cotonic.broker.publish("model/ui/insert/the-stats", {initialData: "<tr><td>...</td></tr>", inner: true});

    cotonic.broker.subscribe("bridge/origin/$SYS/site/blog/cowmachine/+dispatch/+what", function(msg, args) {
        let c = collected[args.dispatch];
        if(!c) {
            collected[args.dispatch] = c = {};
        }
        switch(args.what) {
        case "duration":
            c["99"] = msg.payload["99"];
            c["mean"] = msg.payload["mean"];
            break;
        case "data_out":
            console.log("DATA OUT", msg.payload);
            c["data_out"] = msg.payload["count"];
            break;
        case "data_in": 
            console.log("DATA IN", msg.payload);
            c["data_in"] = msg.payload["count"];
            break;
        case "1xx":
            c["1xx_count"] = msg.payload["count"];
            c["1xx_one"] = msg.payload["one"];
            break;
        case "2xx":
            c["2xx_count"] = msg.payload["count"];
            c["2xx_one"] = msg.payload["one"];
            break;
        case "3xx":
            c["3xx_count"] = msg.payload["count"];
            c["3xx_one"] = msg.payload["one"];
            break;
        case "4xx":
            c["4xx_count"] = msg.payload["count"];
            c["4xx_one"] = msg.payload["one"];
            break;
        case "5xx":
            c["5xx_count"] = msg.payload["count"];
            c["5xx_one"] = msg.payload["one"];
            break;
        default:
            console.log("what?", args.what);
        }

        render();
    });

    function render() {
         let rows = [];
         let keys = Object.keys(collected);
         keys.sort();
         for(let i=0; i < keys.length; i++) {
             if(!collected[keys[i]].mean)
                   continue;

             rows.push("<tr><td>" +  keys[i] + "</td>" +
                 "<td>" + render_requests(collected[keys[i]]) + "</td>" +

                 "<td>" + render_ms(collected[keys[i]].mean) + "</td>" +
                 "<td>" + render_ms(collected[keys[i]]["99"]) + "</td>" +
             "</tr>");
         }

         cotonic.broker.publish("model/ui/update/the-stats", rows.join("")); 
    }

    function render_requests(found) {
        const _1xx_one = (found["1xx_one"]|0);
        const _2xx_one = (found["2xx_one"]|0);
        const _3xx_one = (found["3xx_one"]|0);
        const _4xx_one = (found["4xx_one"]|0);
        const _5xx_one = (found["5xx_one"]|0);
 
        const summary = _1xx_one + _2xx_one + _3xx_one + _4xx_one + _5xx_one;

        return "<span>" + summary + "</span>";
    }

    function render_one(label, value) {
        if(!value) return "";
        return " <span>" + label + " " + value + "</span>"
    }

    function render_value(val) {
         if(!val) return "-";
         return val;
    }

    function render_ms(val) {
         if(!val) return "-";

         return (val / 1000).toFixed(3) + " ms" 
    }

    cotonic.broker.subscribe("bridge/origin/$SYS/erlang/+entry", function(msg, args) {
        if(args.entry === "usage") {
            update_usage(msg.payload);
            return;
        }

        const datapoints = Object.keys(msg.payload);
        

        for(let i=0; i < datapoints.length; i++) {
            const itemId = "#" + args.entry + "-" + datapoints[i];

            let item = $(itemId);
            if(item.length > 0) {
                // console.log(itemId, msg.payload[datapoints[i]]);
                item.html(item.data('render')(msg.payload[datapoints[i]]));
            } else {
                console.log("No place for", itemId, msg.payload[datapoints[i]]);
            }
        }
    });

    function update_usage(dp) {
        const keys = Object.keys(dp);
        for(let i=0; i < keys.length; i++) {
            const key = keys[i];

            $("#usage-" + key + "-value").html(dp[key]);
            $("#usage-" + key + "-progress").css({width: dp[key].toString() + "%"});
        }
    }
{% endjavascript %}

{% endblock %}
