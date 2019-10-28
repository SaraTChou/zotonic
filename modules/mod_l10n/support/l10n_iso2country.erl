%% @author Marc Worrell <marc@worrell.nl>
%% @doc Mapping of iso code to country name in english
%% @copyright 2011 Marc Worrell

-module(l10n_iso2country).

-author("Marc Worrell <marc@worrell.nl>").

-export([
    iso2country/0,
    iso2country/1
]).



iso2country(Iso) ->
    case lists:keyfind(Iso, 1, iso2country()) of
        {_, Name} -> Name;
        false -> undefined
    end.


iso2country() -> [
	{<<"af">>, <<"Afghanistan"/utf8>>},
	{<<"al">>, <<"Albania"/utf8>>},
	{<<"ax">>, <<"Åland Islands"/utf8>>},
	{<<"dz">>, <<"Algeria"/utf8>>},
	{<<"as">>, <<"American Samoa"/utf8>>},
	{<<"ad">>, <<"Andorra"/utf8>>},
	{<<"ao">>, <<"Angola"/utf8>>},
	{<<"ai">>, <<"Anguilla"/utf8>>},
	{<<"aq">>, <<"Antarctica"/utf8>>},
	{<<"ag">>, <<"Antigua and Barbuda"/utf8>>},
	{<<"ar">>, <<"Argentina"/utf8>>},
	{<<"am">>, <<"Armenia"/utf8>>},
	{<<"aw">>, <<"Aruba"/utf8>>},
	{<<"au">>, <<"Australia"/utf8>>},
	{<<"at">>, <<"Austria"/utf8>>},
	{<<"az">>, <<"Azerbaijan"/utf8>>},
	{<<"bs">>, <<"Bahamas"/utf8>>},
	{<<"bh">>, <<"Bahrain"/utf8>>},
	{<<"bd">>, <<"Bangladesh"/utf8>>},
	{<<"bb">>, <<"Barbados"/utf8>>},
	{<<"by">>, <<"Belarus"/utf8>>},
	{<<"be">>, <<"Belgium"/utf8>>},
	{<<"bz">>, <<"Belize"/utf8>>},
	{<<"bj">>, <<"Benin"/utf8>>},
	{<<"bm">>, <<"Bermuda"/utf8>>},
	{<<"bt">>, <<"Bhutan"/utf8>>},
	{<<"bo">>, <<"Bolivia"/utf8>>},
	{<<"bq">>, <<"Bonaire, Sint Eustatius and Saba"/utf8>>},
	{<<"ba">>, <<"Bosnia-Herzegovina"/utf8>>},
	{<<"bw">>, <<"Botswana"/utf8>>},
	{<<"bv">>, <<"Bouvet Island"/utf8>>},
	{<<"br">>, <<"Brazil"/utf8>>},
	{<<"io">>, <<"British Indian Ocean Territory"/utf8>>},
	{<<"bn">>, <<"Brunei Darussalam"/utf8>>},
	{<<"bg">>, <<"Bulgaria"/utf8>>},
	{<<"bf">>, <<"Burkina Faso"/utf8>>},
	{<<"bi">>, <<"Burundi"/utf8>>},
	{<<"kh">>, <<"Cambodia"/utf8>>},
	{<<"cm">>, <<"Cameroon"/utf8>>},
	{<<"ca">>, <<"Canada"/utf8>>},
	{<<"cv">>, <<"Cape Verde"/utf8>>},
	{<<"ky">>, <<"Cayman Islands"/utf8>>},
	{<<"cf">>, <<"Central African Republic"/utf8>>},
	{<<"td">>, <<"Chad"/utf8>>},
	{<<"cl">>, <<"Chile"/utf8>>},
	{<<"cn">>, <<"China"/utf8>>},
	{<<"cx">>, <<"Christmas Island"/utf8>>},
	{<<"cc">>, <<"Cocos (Keeling) Islands"/utf8>>},
	{<<"co">>, <<"Colombia"/utf8>>},
	{<<"km">>, <<"Comoros"/utf8>>},
	{<<"cg">>, <<"Congo"/utf8>>},
	{<<"cd">>, <<"Congo, The Democratic Republic of the"/utf8>>},
	{<<"ck">>, <<"Cook Islands"/utf8>>},
	{<<"cr">>, <<"Costa Rica"/utf8>>},
	{<<"hr">>, <<"Croatia"/utf8>>},
	{<<"cu">>, <<"Cuba"/utf8>>},
	{<<"cw">>, <<"Curaçao"/utf8>>},
	{<<"cy">>, <<"Cyprus"/utf8>>},
	{<<"cz">>, <<"Czech Republic"/utf8>>},
	{<<"dk">>, <<"Denmark"/utf8>>},
	{<<"dj">>, <<"Djibouti"/utf8>>},
	{<<"dm">>, <<"Dominica"/utf8>>},
	{<<"do">>, <<"Dominican Republic"/utf8>>},
	{<<"tp">>, <<"East Timor"/utf8>>},
	{<<"ec">>, <<"Ecuador"/utf8>>},
	{<<"eg">>, <<"Egypt"/utf8>>},
	{<<"sv">>, <<"El Salvador"/utf8>>},
	{<<"gq">>, <<"Equatorial Guinea"/utf8>>},
	{<<"er">>, <<"Eritrea"/utf8>>},
	{<<"ee">>, <<"Estonia"/utf8>>},
	{<<"et">>, <<"Ethiopia"/utf8>>},
	{<<"fk">>, <<"Falkland Islands"/utf8>>},
	{<<"fo">>, <<"Faroe Islands"/utf8>>},
	{<<"fj">>, <<"Fiji"/utf8>>},
	{<<"fi">>, <<"Finland"/utf8>>},
	{<<"fr">>, <<"France"/utf8>>},
	{<<"gf">>, <<"French Guiana"/utf8>>},
	{<<"pf">>, <<"French Polynesia"/utf8>>},
	{<<"tf">>, <<"French Southern Territories"/utf8>>},
	{<<"ga">>, <<"Gabon"/utf8>>},
	{<<"gm">>, <<"Gambia"/utf8>>},
	{<<"ge">>, <<"Georgia"/utf8>>},
	{<<"de">>, <<"Germany"/utf8>>},
	{<<"gh">>, <<"Ghana"/utf8>>},
	{<<"gi">>, <<"Gibraltar"/utf8>>},
	{<<"gr">>, <<"Greece"/utf8>>},
	{<<"gl">>, <<"Greenland"/utf8>>},
	{<<"gd">>, <<"Grenada"/utf8>>},
	{<<"gp">>, <<"Guadeloupe"/utf8>>},
	{<<"gu">>, <<"Guam"/utf8>>},
	{<<"gt">>, <<"Guatemala"/utf8>>},
	{<<"gg">>, <<"Guernsey"/utf8>>},
	{<<"gn">>, <<"Guinea"/utf8>>},
	{<<"gw">>, <<"Guinea Bissau"/utf8>>},
	{<<"gy">>, <<"Guyana"/utf8>>},
	{<<"ht">>, <<"Haiti"/utf8>>},
	{<<"hm">>, <<"Heard and McDonald Islands"/utf8>>},
	{<<"va">>, <<"Holy See (Vatican City State)"/utf8>>},
	{<<"hn">>, <<"Honduras"/utf8>>},
	{<<"hk">>, <<"Hong Kong"/utf8>>},
	{<<"hu">>, <<"Hungary"/utf8>>},
	{<<"is">>, <<"Iceland"/utf8>>},
	{<<"in">>, <<"India"/utf8>>},
	{<<"id">>, <<"Indonesia"/utf8>>},
	{<<"ir">>, <<"Iran"/utf8>>},
	{<<"iq">>, <<"Iraq"/utf8>>},
	{<<"ie">>, <<"Ireland"/utf8>>},
	{<<"il">>, <<"Israel"/utf8>>},
	{<<"im">>, <<"Isle of Man"/utf8>>},
	{<<"it">>, <<"Italy"/utf8>>},
	{<<"ci">>, <<"Ivory Coast (Cote D'Ivoire)"/utf8>>},
	{<<"jm">>, <<"Jamaica"/utf8>>},
	{<<"jp">>, <<"Japan"/utf8>>},
	{<<"je">>, <<"Jersey"/utf8>>},
	{<<"jo">>, <<"Jordan"/utf8>>},
	{<<"kz">>, <<"Kazakhstan"/utf8>>},
	{<<"ke">>, <<"Kenya"/utf8>>},
	{<<"ki">>, <<"Kiribati"/utf8>>},
	{<<"kw">>, <<"Kuwait"/utf8>>},
	{<<"kg">>, <<"Kyrgyzstan"/utf8>>},
	{<<"la">>, <<"Laos"/utf8>>},
	{<<"lv">>, <<"Latvia"/utf8>>},
	{<<"lb">>, <<"Lebanon"/utf8>>},
	{<<"ls">>, <<"Lesotho"/utf8>>},
	{<<"lr">>, <<"Liberia"/utf8>>},
	{<<"ly">>, <<"Libya"/utf8>>},
	{<<"li">>, <<"Liechtenstein"/utf8>>},
	{<<"lt">>, <<"Lithuania"/utf8>>},
	{<<"lu">>, <<"Luxembourg"/utf8>>},
	{<<"mo">>, <<"Macao"/utf8>>},
	{<<"mk">>, <<"Macedonia"/utf8>>},
	{<<"mg">>, <<"Madagascar"/utf8>>},
	{<<"mw">>, <<"Malawi"/utf8>>},
	{<<"my">>, <<"Malaysia"/utf8>>},
	{<<"mv">>, <<"Maldives"/utf8>>},
	{<<"ml">>, <<"Mali"/utf8>>},
	{<<"mt">>, <<"Malta"/utf8>>},
	{<<"mh">>, <<"Marshall Islands"/utf8>>},
	{<<"mq">>, <<"Martinique"/utf8>>},
	{<<"mr">>, <<"Mauritania"/utf8>>},
	{<<"mu">>, <<"Mauritius"/utf8>>},
	{<<"yt">>, <<"Mayotte"/utf8>>},
	{<<"mx">>, <<"Mexico"/utf8>>},
	{<<"fm">>, <<"Micronesia"/utf8>>},
	{<<"md">>, <<"Moldova"/utf8>>},
	{<<"mc">>, <<"Monaco"/utf8>>},
	{<<"mn">>, <<"Mongolia"/utf8>>},
	{<<"me">>, <<"Montenegro"/utf8>>},
	{<<"ms">>, <<"Montserrat"/utf8>>},
	{<<"ma">>, <<"Morocco"/utf8>>},
	{<<"mz">>, <<"Mozambique"/utf8>>},
	{<<"mm">>, <<"Myanmar"/utf8>>},
	{<<"na">>, <<"Namibia"/utf8>>},
	{<<"nr">>, <<"Nauru"/utf8>>},
	{<<"np">>, <<"Nepal"/utf8>>},
	{<<"nl">>, <<"Netherlands"/utf8>>},
	{<<"nc">>, <<"New Caledonia"/utf8>>},
	{<<"nz">>, <<"New Zealand"/utf8>>},
	{<<"ni">>, <<"Nicaragua"/utf8>>},
	{<<"ne">>, <<"Niger"/utf8>>},
	{<<"ng">>, <<"Nigeria"/utf8>>},
	{<<"nu">>, <<"Niue"/utf8>>},
	{<<"nf">>, <<"Norfolk Island"/utf8>>},
	{<<"kp">>, <<"North Korea"/utf8>>},
	{<<"mp">>, <<"Northern Mariana Islands"/utf8>>},
	{<<"no">>, <<"Norway"/utf8>>},
	{<<"om">>, <<"Oman"/utf8>>},
	{<<"pk">>, <<"Pakistan"/utf8>>},
	{<<"pw">>, <<"Palau"/utf8>>},
	{<<"pa">>, <<"Panama"/utf8>>},
	{<<"pg">>, <<"Papua New Guinea"/utf8>>},
	{<<"py">>, <<"Paraguay"/utf8>>},
	{<<"pe">>, <<"Peru"/utf8>>},
	{<<"ph">>, <<"Philippines"/utf8>>},
	{<<"pn">>, <<"Pitcairn Island"/utf8>>},
	{<<"pl">>, <<"Poland"/utf8>>},
	{<<"ps">>, <<"Palestinian Territory, Occupied"/utf8>>},
	{<<"pt">>, <<"Portugal"/utf8>>},
	{<<"pr">>, <<"Puerto Rico"/utf8>>},
	{<<"qa">>, <<"Qatar"/utf8>>},
	{<<"re">>, <<"Reunion"/utf8>>},
	{<<"ro">>, <<"Romania"/utf8>>},
	{<<"ru">>, <<"Russian Federation"/utf8>>},
	{<<"rw">>, <<"Rwanda"/utf8>>},
	{<<"gs">>, <<"South Georgia and the South Sandwich Islands"/utf8>>},
	{<<"bl">>, <<"Saint Barthélemy"/utf8>>},
	{<<"sh">>, <<"Saint Helena"/utf8>>},
	{<<"kn">>, <<"Saint Kitts and Nevis Anguilla"/utf8>>},
	{<<"lc">>, <<"Saint Lucia"/utf8>>},
	{<<"mf">>, <<"Saint Martin (French)"/utf8>>},
	{<<"sx">>, <<"Sint Maarten (Dutch)"/utf8>>},
	{<<"pm">>, <<"Saint Pierre and Miquelon"/utf8>>},
	{<<"st">>, <<"Sao Tome and Principe"/utf8>>},
	{<<"vc">>, <<"Saint Vincent and Grenadines"/utf8>>},
	{<<"ws">>, <<"Samoa"/utf8>>},
	{<<"sm">>, <<"San Marino"/utf8>>},
	{<<"sa">>, <<"Saudi Arabia"/utf8>>},
	{<<"sn">>, <<"Senegal"/utf8>>},
	{<<"rs">>, <<"Serbia"/utf8>>},
	{<<"sc">>, <<"Seychelles"/utf8>>},
	{<<"sl">>, <<"Sierra Leone"/utf8>>},
	{<<"sg">>, <<"Singapore"/utf8>>},
	{<<"sk">>, <<"Slovakia"/utf8>>},
	{<<"si">>, <<"Slovenia"/utf8>>},
	{<<"sb">>, <<"Solomon Islands"/utf8>>},
	{<<"so">>, <<"Somalia"/utf8>>},
	{<<"za">>, <<"South Africa"/utf8>>},
	{<<"kr">>, <<"South Korea"/utf8>>},
	{<<"ss">>, <<"South Sudan"/utf8>>},
	{<<"es">>, <<"Spain"/utf8>>},
	{<<"lk">>, <<"Sri Lanka"/utf8>>},
	{<<"sd">>, <<"Sudan"/utf8>>},
	{<<"sr">>, <<"Suriname"/utf8>>},
	{<<"sj">>, <<"Svalbard and Jan Mayen Islands"/utf8>>},
	{<<"sz">>, <<"Swaziland"/utf8>>},
	{<<"se">>, <<"Sweden"/utf8>>},
	{<<"ch">>, <<"Switzerland"/utf8>>},
	{<<"sy">>, <<"Syria"/utf8>>},
	{<<"tj">>, <<"Tajikistan"/utf8>>},
	{<<"tw">>, <<"Taiwan"/utf8>>},
	{<<"tz">>, <<"Tanzania"/utf8>>},
	{<<"th">>, <<"Thailand"/utf8>>},
	{<<"tg">>, <<"Togo"/utf8>>},
	{<<"tk">>, <<"Tokelau"/utf8>>},
	{<<"to">>, <<"Tonga"/utf8>>},
	{<<"tt">>, <<"Trinidad and Tobago"/utf8>>},
	{<<"tn">>, <<"Tunisia"/utf8>>},
	{<<"tr">>, <<"Turkey"/utf8>>},
	{<<"tm">>, <<"Turkmenistan"/utf8>>},
	{<<"tc">>, <<"Turks and Caicos Islands"/utf8>>},
	{<<"tv">>, <<"Tuvalu"/utf8>>},
	{<<"ug">>, <<"Uganda"/utf8>>},
	{<<"ua">>, <<"Ukraine"/utf8>>},
	{<<"ae">>, <<"United Arab Emirates"/utf8>>},
	{<<"gb">>, <<"United Kingdom"/utf8>>},
	{<<"us">>, <<"United States"/utf8>>},
	{<<"um">>, <<"United States Minor Outlying Islands"/utf8>>},
	{<<"uy">>, <<"Uruguay"/utf8>>},
	{<<"uz">>, <<"Uzbekistan"/utf8>>},
	{<<"vu">>, <<"Vanuatu"/utf8>>},
	{<<"ve">>, <<"Venezuela"/utf8>>},
	{<<"vn">>, <<"Vietnam"/utf8>>},
	{<<"vg">>, <<"Virgin Islands (British)"/utf8>>},
	{<<"vi">>, <<"Virgin Islands (USA)"/utf8>>},
	{<<"wf">>, <<"Wallis and Futuna Islands"/utf8>>},
	{<<"eh">>, <<"Western Sahara"/utf8>>},
	{<<"ye">>, <<"Yemen"/utf8>>},
	{<<"zm">>, <<"Zambia"/utf8>>},
	{<<"zw">>, <<"Zimbabwe"/utf8>>}
].
