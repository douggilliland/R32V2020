//tealium universal tag - utag.loader ut4.42.201906261618, Copyright 2019 Tealium.com Inc. All Rights Reserved. 

var utag_condload=false;try{(function(){function ul(src,a,b){a=document;b=a.createElement('script');b.language='javascript';b.type='text/javascript';b.src=src;a.getElementsByTagName('head')[0].appendChild(b)};if((""+document.cookie).match("utag_env_digikey_main=(\/\/tags\.tiqcdn\.com\/utag\/digikey\/[^\S;]*)")){if(RegExp.$1.indexOf("/prod/") === -1) {var s = RegExp.$1;while(s.indexOf("%") != -1) {s = decodeURIComponent(s);}s = s.replace(/\.\./g,"");ul(s);utag_condload=true;__tealium_default_path='//tags.tiqcdn.com/utag/digikey/main/prod/';}}})();}catch(e){};try{ try{
// Type your JavaScript code here...
// Remove old cookie-tracking

var domain = location.hostname.match(/\.digikey\..*/)[0];
document.cookie = "udo-data=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;domain="+domain+";";
document.cookie = "wt-tracking=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;domain="+domain+";";

window.utag_data = window.utag_data || {};
utag_data.do_not_track = "";
if (navigator.doNotTrack == "yes" || navigator.doNotTrack == "1" || navigator.msDoNotTrack == "1") {
    utag_data.do_not_track = "yes";
}

window.utag_cfg_ovrd = window.utag_cfg_ovrd || {};

if (location.hostname.indexOf("digikey.com.cn") > -1  || location.hostname.indexOf("digikey.cn") > -1) {
    if (location.hostname.indexOf("digikeytest")> -1) {
        utag_cfg_ovrd.path =  "//tags.tiqcdn.cn/utag/digikey/main/qa/";
    } else {
        utag_cfg_ovrd.path =  "//tags.tiqcdn.cn/utag/digikey/main/prod/";        
    }
} else {
    if (location.hostname.indexOf("digikeytest") > -1)  {
        utag_cfg_ovrd.path =  "//tags.tiqcdn.com/utag/digikey/main/qa/";
    } else {
        utag_cfg_ovrd.path =  "//tags.tiqcdn.com/utag/digikey/main/prod/";
    }
}



} catch(e){ utag.DB(e) }  }catch(e){};
if (typeof utag == "undefined" && !utag_condload) {
  var utag = {
    id:"digikey.main",
    o:{},
    sender: {},
    send: {},
    rpt: {
      ts: {
        a: new Date()
      }
    },
    dbi: [],
    db_log : [],
    loader: {
      q: [],
      lc: 0,
      f: {},
      p: 0,
      ol: 0,
      wq: [],
      lq: [],
      bq: {},
      bk: {},
      rf: 0,
      ri: 0,
      rp: 0,
      rq: [],
      ready_q : [], 
      sendq :{"pending":0},
      run_ready_q : function(){
        for(var i=0;i<utag.loader.ready_q.length;i++){
          utag.DB("READY_Q:"+i);
          try{utag.loader.ready_q[i]()}catch(e){utag.DB(e)};
        }
      },
      lh: function(a, b, c) {
        a = "" + location.hostname;
        b = a.split(".");
        c = (/\.co\.|\.com\.|\.org\.|\.edu\.|\.net\.|\.asn\./.test(a)) ? 3 : 2;
        return b.splice(b.length - c, c).join(".");
      },
      WQ: function(a, b, c, d, g) {
        utag.DB('WQ:' + utag.loader.wq.length);
        try {
          // this picks up a utag_data items added after utag.js was loaded
          // Gotcha: Data layer set after utag.js will not overwrite something already set via an extension.  Only "new" values are copied from utag_data
          // for case where utag_data is set after utag.js is loaded
          if(utag.udoname && utag.udoname.indexOf(".")<0){
            utag.ut.merge(utag.data,window[utag.udoname],0);
          }

          // TBD: utag.handler.RE('view',utag.data,"bwq");
          // process load rules again if this flag is set
          if(utag.cfg.load_rules_at_wait){
            utag.handler.LR(utag.data);
          }
        } catch (e) {utag.DB(e)};
	
	d=0;
        g=[]; 
        for (a = 0; a < utag.loader.wq.length; a++) {
          b = utag.loader.wq[a];
	  b.load = utag.loader.cfg[b.id].load;
          if (b.load == 4){
            //LOAD the bundled tag set to wait here
            this.f[b.id]=0;
            utag.loader.LOAD(b.id)
          }else if (b.load > 0) {
            g.push(b);
            //utag.loader.AS(b); // moved: defer loading until flags cleared
	    d++;
          }else{
            // clear flag for those set to wait that were not actually loaded
            this.f[b.id]=1;
          }
        }
        for (a = 0; a < g.length; a++) {
          utag.loader.AS(g[a]);
        }

	if(d==0){
	  utag.loader.END();
	}
      },
      AS: function(a, b, c, d) {
        utag.send[a.id] = a;
        if (typeof a.src == 'undefined') {
          a.src = utag.cfg.path + ((typeof a.name != 'undefined') ? a.name : 'ut' + 'ag.' + a.id + '.js')
        }
        a.src += (a.src.indexOf('?') > 0 ? '&' : '?') + 'utv=' + (a.v?utag.cfg.template+a.v:utag.cfg.v);
        utag.rpt['l_' + a.id] = a.src;
        b = document;
        this.f[a.id]=0;
        if (a.load == 2) {
          utag.DB("Attach sync: "+a.src);
          a.uid=a.id;
          b.write('<script id="utag_' + a.id + '" src="' + a.src + '"></scr' + 'ipt>')
          if(typeof a.cb!='undefined')a.cb();
        } else if(a.load==1 || a.load==3) {
          if (b.createElement) {
            c = 'utag_digikey.main_'+a.id;
            if (!b.getElementById(c)) {
	      d = {
	        src:a.src,
		id:c,
                uid:a.id,
		loc:a.loc
              }
              if(a.load == 3){d.type="iframe"};
	      if(typeof a.cb!='undefined')d.cb=a.cb;
              utag.ut.loader(d);
            }
          }
        }
      },
      GV: function(a, b, c) {
        b = {};
        for (c in a) {
          if (a.hasOwnProperty(c) && typeof a[c] != "function") b[c] = a[c];
        }
        return b
      },
      OU: function(a, b, c, d, f){
        try {
          if (typeof utag.data['cp.OPTOUTMULTI'] != 'undefined') {
            c = utag.loader.cfg;
            a = utag.ut.decode(utag.data['cp.OPTOUTMULTI']).split('|');
            for (d = 0; d < a.length; d++) {
              b = a[d].split(':');
              if (b[1] * 1 !== 0) {
                if (b[0].indexOf('c') == 0) {
                  for (f in utag.loader.GV(c)) {
                    if (c[f].tcat == b[0].substring(1)) c[f].load = 0
                  }
                } else if (b[0] * 1 == 0) {
                  utag.cfg.nocookie = true
                } else {
                  for (f in utag.loader.GV(c)) {
                    if (c[f].tid == b[0]) c[f].load = 0
                  }
                }
              }
            }
          }
        } catch (e) {utag.DB(e)}
      },
      RDdom: function(o){
        var d = document || {}, l = location || {};
        o["dom.referrer"] = d.referrer;
        o["dom.title"] = "" + d.title;
        o["dom.domain"] = "" + l.hostname;
        o["dom.query_string"] = ("" + l.search).substring(1);
        o["dom.hash"] = ("" + l.hash).substring(1);
        o["dom.url"] = "" + d.URL;
        o["dom.pathname"] = "" + l.pathname;
        o["dom.viewport_height"] = window.innerHeight || (d.documentElement?d.documentElement.clientHeight:960);
        o["dom.viewport_width"] = window.innerWidth || (d.documentElement?d.documentElement.clientWidth:960);
      },
      RDcp: function(o, b, c, d){
        b = utag.loader.RC();
        for (d in b) {
          if (d.match(/utag_(.*)/)) {
            for (c in utag.loader.GV(b[d])) {
              o["cp.utag_" + RegExp.$1 + "_" + c] = b[d][c];
            }
          }
        }
        for (c in utag.loader.GV((utag.cl && !utag.cl['_all_']) ? utag.cl : b)) {
          if (c.indexOf("utag_") < 0 && typeof b[c] != "undefined") o["cp." + c] = b[c];
        }
        //o["_t_visitor_id"]=o["cp.utag_main_v_id"];
        //o["_t_session_id"]=o["cp.utag_main_ses_id"];
      },
      RDqp: function(o, a, b, c){
        a = location.search + (location.hash+'').replace("#","&");
        if(utag.cfg.lowerqp){a=a.toLowerCase()};
        if (a.length > 1) {
          b = a.substring(1).split('&');
          for (a = 0; a < b.length; a++) {
            c = b[a].split("=");
            if(c.length>1){
              o["qp." + c[0]] = utag.ut.decode(c[1])
            }
          }
        }
      },
      RDmeta: function(o, a, b, h){
        a = document.getElementsByTagName("meta");
        for (b = 0; b < a.length; b++) {
          try{
            h = a[b].name || a[b].getAttribute("property") || ""; 
          }catch(e){h="";utag.DB(e)};
          if (utag.cfg.lowermeta){h=h.toLowerCase()};
          if (h != ""){o["meta." + h] = a[b].content}
        }
      },
      RDva: function(o){
        // Read visitor attributes in local storage
        var readAttr = function(o, l ){
          var a = "", b;
          a = localStorage.getItem(l);
          if(!a || a=="{}")return;
          b = utag.ut.flatten({va : JSON.parse(a)});
          utag.ut.merge(o,b,1);
        }
        try{
          readAttr(o, "tealium_va" );
          readAttr(o, "tealium_va_" + o["ut.account"] + "_" + o["ut.profile"] );
        }catch(e){ utag.DB(e) }
      },
      RDut: function(o, a){
        // Add built-in data types to the data layer for use in mappings, extensions and RDva function.
        var t = {};
        var d = new Date();
        var m = ( utag.ut.typeOf(d.toISOString) == "function" );
        o["ut.domain"] = utag.cfg.domain;
        o["ut.version"] = utag.cfg.v;
        // i.e. "view" or "link"
        t["tealium_event"] = o["ut.event"] = a || "view";
        t["tealium_visitor_id"] = o["ut.visitor_id"]=o["cp.utag_main_v_id"];
        t["tealium_session_id"] = o["ut.session_id"]=o["cp.utag_main_ses_id"];
        try{
          t["tealium_datasource"] = "";
          t["tealium_account"] = o["ut.account"] = utag.cfg.utid.split("/")[0];
          t["tealium_profile"] = o["ut.profile"] = utag.cfg.utid.split("/")[1];
          t["tealium_environment"] = o["ut.env"] = utag.cfg.path.split("/")[6];
        }catch(e){ utag.DB(e) }

        t["tealium_random"] = Math.random().toFixed(16).substring(2);
        t["tealium_library_name"] = "ut"+"ag.js";
        t["tealium_library_version"] = ( utag.cfg.template + "0" ).substring(2);
        t["tealium_timestamp_epoch"] = Math.floor( d.getTime() / 1000 );
        t["tealium_timestamp_utc"] = ( m ? d.toISOString() : "");
        // Adjust date to local time
        d.setHours( d.getHours() - ( d.getTimezoneOffset() / 60 ) );
        t["tealium_timestamp_local"] = ( m ? d.toISOString().replace( "Z","" ) : "" );

        // Any existing data elements with "tealium_" will not be overwritten
        utag.ut.merge( o, t, 0 );
      },
      RDses: function( o, a, c ) {
        a = (new Date()).getTime();
        c = ( a + parseInt( utag.cfg.session_timeout ) ) + "";

        // cp.utag_main_ses_id will not be in the data layer when it has expired or this is first page view of all time
	if ( !o["cp.utag_main_ses_id"] ) {
          o["cp.utag_main_ses_id"] = a + "";
          o["cp.utag_main__ss"] = "1";
          o["cp.utag_main__sn"] = ( 1 + parseInt( o["cp.utag_main__sn"] || 0 ) ) + "";
        } else {
          o["cp.utag_main__ss"] = "0";
        }
        
        o["cp.utag_main__pn"] = o["cp.utag_main__pn"] || "1";
        o["cp.utag_main__st"] = c;

        utag.loader.SC( "utag_main", { "_sn": ( o["cp.utag_main__sn"] || 1 ), "_ss": o["cp.utag_main__ss"], "_st": c, "ses_id": ( o["cp.utag_main_ses_id"] || a ) + ";exp-session", "_pn": o["cp.utag_main__pn"] + ";exp-session" } );
      },
      RDpv: function( o ) {
        if ( typeof utag.pagevars == "function" ) {
          utag.DB("Read page variables");
          utag.pagevars(o);
        }
      },
      RD: function( o, a ) {
        utag.DB("utag.loader.RD");
        utag.DB(o);

        utag.loader.RDcp(o);

        if ( !utag.loader.rd_flag ) {
          utag.loader.rd_flag = 1;
          o["cp.utag_main_v_id"] = o["cp.utag_main_v_id"] || utag.ut.vi((new Date()).getTime());
          o["cp.utag_main__pn"] = ( 1 + parseInt( o["cp.utag_main__pn"] || 0 ) ) + "";
          // the _st value is not-yet-set for first page view so we'll need wait to write in _pn value (which is exp-session)
          // The SC function expires (removes) cookie values that expired with the session
          utag.loader.SC( "utag_main", { "v_id": o["cp.utag_main_v_id"] } );
          utag.loader.RDses(o);
        }

        // first utag.track call for noview should not clear session start (_ss) value
        if(a && !utag.cfg.noview)utag.loader.RDses(o);
        utag.loader.RDqp(o);
        utag.loader.RDmeta(o);
        utag.loader.RDdom(o);
        utag.loader.RDut(o, a || "view");
        utag.loader.RDpv(o);
        utag.loader.RDva(o);
      },
      RC: function(a, x, b, c, d, e, f, g, h, i, j, k, l, m, n, o, v, ck, cv, r, s, t) {
        o = {};
        b = ("" + document.cookie != "") ? (document.cookie).split("; ") : [];
        r = /^(.*?)=(.*)$/;
        s = /^(.*);exp-(.*)$/;
        t = (new Date()).getTime();
        for (c = 0; c < b.length; c++) {
          if (b[c].match(r)) {
            ck = RegExp.$1;
            cv = RegExp.$2;
          }
          e = utag.ut.decode(cv);
          if (typeof ck!="undefined"){
            if (ck.indexOf("ulog") == 0 || ck.indexOf("utag_") == 0) {
              e = cv.split("$");
              g = [];
              j = {};
              for (f = 0; f < e.length; f++) {
                try{
                  g = e[f].split(":");
                  if (g.length > 2) {
                    g[1] = g.slice(1).join(":");
                  }
                  v = "";
                  if (("" + g[1]).indexOf("~") == 0) {
                    h = g[1].substring(1).split("|");
                    for (i = 0; i < h.length; i++) h[i] = utag.ut.decode(h[i]);
                    v = h
                  } else v = utag.ut.decode(g[1]);
                  j[g[0]] = v;
                }catch(er){utag.DB(er)};
              }
              o[ck] = {};
              for (f in utag.loader.GV(j)) {
                if (j[f] instanceof Array) {
                  n = [];
                  for (m = 0; m < j[f].length; m++) {
                    if (j[f][m].match(s)){
                      k = (RegExp.$2 == "session") ? (typeof j._st != "undefined" ? j._st : t - 1) : parseInt(RegExp.$2);
                      if (k > t) n[m] = (x == 0) ? j[f][m] : RegExp.$1;
                    }
                  }
                  j[f] = n.join("|");
                } else {
                  j[f] = "" + j[f];
                  if (j[f].match(s)) {
                    k = (RegExp.$2 == "session") ? (typeof j._st != "undefined" ? j._st : t - 1) : parseInt(RegExp.$2);
                    j[f] = (k < t) ? null : (x == 0 ? j[f] : RegExp.$1);
                  }
                }
                if (j[f]) o[ck][f] = j[f];
              }
            } else if (utag.cl[ck] || utag.cl['_all_']) {
              o[ck] = e
            }
          }
        }
        return (a) ? (o[a] ? o[a] : {}) : o;
      },
      SC: function(a, b, c, d, e, f, g, h, i, j, k, x, v) {
        if (!a) return 0;
        if (a=="utag_main" && utag.cfg.nocookie) return 0;
        v = "";
        var date = new Date();
        var exp = new Date();
        exp.setTime(date.getTime()+(365*24*60*60*1000));
        x = exp.toGMTString();
        if (c && c == "da") {
          x = "Thu, 31 Dec 2009 00:00:00 GMT";
        } else if (a.indexOf("utag_") != 0 && a.indexOf("ulog") != 0) {
          if (typeof b != "object") {
            v = b
          }
        } else {
          d = utag.loader.RC(a, 0);
          for (e in utag.loader.GV(b)) {
            f = "" + b[e];
            if (f.match(/^(.*);exp-(\d+)(\w)$/)) {
              g = date.getTime() + parseInt(RegExp.$2) * ((RegExp.$3 == "h") ? 3600000 : 86400000);
              if (RegExp.$3 == "u") g = parseInt(RegExp.$2);
              f = RegExp.$1 + ";exp-" + g;
            }
            if (c == "i") {
              if (d[e] == null) d[e] = f;
            } else if (c == "d") delete d[e];
            else if (c == "a") d[e] = (d[e] != null) ? (f - 0) + (d[e] - 0) : f;
            else if (c == "ap" || c == "au") {
              if (d[e] == null) d[e] = f;
              else {
                if (d[e].indexOf("|") > 0) {
                  d[e] = d[e].split("|")
                }
                g = (d[e] instanceof Array) ? d[e] : [d[e]];
                g.push(f);
                if (c == "au") {
                  h = {};
                  k = {};
                  for (i = 0; i < g.length; i++) {
                    if (g[i].match(/^(.*);exp-(.*)$/)) {
                      j = RegExp.$1;
                    }
                    if (typeof k[j] == "undefined") {
                      k[j] = 1;
                      h[g[i]] = 1;
                    }
                  }
                  g = [];
                  for (i in utag.loader.GV(h)) {
                    g.push(i);
                  }
                }
                d[e] = g
              }
            } else d[e] = f;
          }
          h = new Array();
          for (g in utag.loader.GV(d)) {
            if (d[g] instanceof Array) {
              for (c = 0; c < d[g].length; c++) {
                d[g][c] = encodeURIComponent(d[g][c])
              }
              h.push(g + ":~" + d[g].join("|"))
            } else h.push((g + ":").replace(/[\,\$\;\?]/g,"") + encodeURIComponent(d[g]))
          }
          if (h.length == 0) {
            h.push("");
            x = ""
          }
          v = (h.join("$"));
        }
        document.cookie = a + "=" + v + ";path=/;domain=" + utag.cfg.domain + ";expires=" + x;
        return 1
      },
      LOAD: function(a, b, c, d) {
        //utag.DB('utag.loader.LOAD:' + a);
        if(!utag.loader.cfg){
           return
        }
	if(this.ol==0){
          if(utag.loader.cfg[a].block && utag.loader.cfg[a].cbf){
            this.f[a] = 1;
	    delete utag.loader.bq[a];
          }
	  for(b in utag.loader.GV(utag.loader.bq)){
            if(utag.loader.cfg[a].load==4 && utag.loader.cfg[a].wait==0){
              utag.loader.bk[a]=1;
              utag.DB("blocked: "+ a);
            }
	    utag.DB("blocking: " + b);
	    return;
	  }
	  utag.loader.INIT();
	  return;
	}
        utag.DB('utag.loader.LOAD:' + a);

        if (this.f[a] == 0) {
          this.f[a] = 1;
      	
	  if(utag.cfg.noview!=true){
	    if(utag.loader.cfg[a].send){
              utag.DB("SENDING: "+a);
              try{
                if (utag.loader.sendq.pending > 0 && utag.loader.sendq[a]) {
                  utag.DB("utag.loader.LOAD:sendq: "+a);
                  while( d = utag.loader.sendq[a].shift() ) {
                    utag.DB(d);
                    utag.sender[a].send(d.event, utag.handler.C(d.data));
                    utag.loader.sendq.pending--;
                  }
                } else {
                  utag.sender[a].send('view',utag.handler.C(utag.data));
                }
		utag.rpt['s_' + a] = 0;
	      } catch (e) {
                utag.DB(e);
	        utag.rpt['s_' + a] = 1;
	      }
	    }
	  }
	  if(utag.loader.rf==0)return;
          for (b in utag.loader.GV(this.f)) {
            if (this.f[b] == 0 || this.f[b] == 2) return
          }
	  utag.loader.END();
        }
      },
      EV: function(a, b, c, d) {
        if (b == "ready") {
          if(!utag.data){
            try {
              utag.cl = {'_all_': 1};
              utag.loader.initdata();    
              utag.loader.RD(utag.data);
            }catch(e){ utag.DB(e) };
          }
          if ( (document.attachEvent || utag.cfg.dom_complete) ? document.readyState === "complete" : document.readyState !== "loading" ) setTimeout(c, 1);
          else {
            utag.loader.ready_q.push(c);
            var RH;

            if(utag.loader.ready_q.length<=1){
              if (document.addEventListener) {
                RH = function() {
                  document.removeEventListener("DOMContentLoaded", RH, false);
                  utag.loader.run_ready_q()
                };
                if(!utag.cfg.dom_complete)document.addEventListener("DOMContentLoaded", RH, false);
                window.addEventListener("load", utag.loader.run_ready_q, false);
              } else if (document.attachEvent) {
                RH = function() {
                  if (document.readyState === "complete") {
                    document.detachEvent("onreadystatechange", RH);
                    utag.loader.run_ready_q()
                  }
                };
                document.attachEvent("onreadystatechange", RH);
                window.attachEvent("onload", utag.loader.run_ready_q);
              }
            }
          }
        } else {
          if (a.addEventListener) {
            a.addEventListener(b, c, false)
          } else if (a.attachEvent) {
            a.attachEvent(((d == 1) ? "" : "on") + b, c)
          }
        }
      },
      END: function(b, c, d, e, v, w){
        if(this.ended){return};
        this.ended=1;
	utag.DB("loader.END");
        b = utag.data;
        // add the default values for future utag.link/view calls
	if(utag.handler.base && utag.handler.base!='*'){
          e = utag.handler.base.split(",");
          for (d = 0; d < e.length; d++) {
            if (typeof b[e[d]] != "undefined") utag.handler.df[e[d]] = b[e[d]]
          }
        }else if (utag.handler.base=='*'){
           utag.ut.merge(utag.handler.df,b,1);
        }

        utag.rpt['r_0']="t";
	for(var r in utag.loader.GV(utag.cond)){
          utag.rpt['r_'+r]=(utag.cond[r])?"t":"f";
        }

        utag.rpt.ts['s'] = new Date();
	

        v = ".tiqcdn.com";
        w = utag.cfg.path.indexOf(v);
        if(w>0 && b["cp.utag_main__ss"]==1 && !utag.cfg.no_session_count)utag.ut.loader({src:utag.cfg.path.substring(0,w)+v+"/ut"+"ag/tiqapp/ut"+"ag.v.js?a="+utag.cfg.utid+(utag.cfg.nocookie?"&nocookie=1":"&cb="+(new Date).getTime()),id:"tiqapp"})
        
        if(utag.cfg.noview!=true)utag.handler.RE('view',b,"end");
	utag.handler.INIT();
      }
    },
    DB: function(a, b) {
      // return right away if we've already checked the cookie
      if(utag.cfg.utagdb===false){
        return;
      }else if(typeof utag.cfg.utagdb=="undefined"){
        b = document.cookie+'';
        utag.cfg.utagdb=((b.indexOf('utagdb=true') >= 0)?true:false);
      }
      if(utag.cfg.utagdb===true){
        var t;
        if(utag.ut.typeOf(a) == "object"){
          t=utag.handler.C(a)
        }else{
          t=a
        }
        utag.db_log.push(t);
        try{if(!utag.cfg.noconsole)console.log(t)}catch(e){}
      }
    },
    RP: function(a, b, c) {
      if (typeof a != 'undefined' && typeof a.src != 'undefined' && a.src != '') {
        b = [];
        for (c in utag.loader.GV(a)) {
          if (c != 'src') b.push(c + '=' + escape(a[c]))
        }
        this.dbi.push((new Image()).src = a.src + '?utv=' + utag.cfg.v + '&utid=' + utag.cfg.utid + '&' + (b.join('&')))
      }
    },
    view: function(a,c,d) {
      return this.track({event:'view', data:a, cfg:{cb:c,uids:d}})
    },
    link: function(a,c,d) {
      return this.track({event:'link', data:a, cfg:{cb:c,uids:d}})
    },
    track: function(a,b,c,d) {
      if (typeof a == "string") a = { event: a, data: b, cfg: {cb: c} };

      for(d in utag.loader.GV(utag.o)){
        try{
          utag.o[d].handler.trigger(a.event || "view", a.data || a, a.cfg)
        }catch(e){utag.DB(e)};
      }
      if(a.cfg && a.cfg.cb)try{a.cfg.cb()}catch(e){utag.DB(e)};
      return true
    },
    handler: {
      base: "",
      df: {},
      o: {},
      send: {},
      iflag: 0,
      INIT: function(a, b, c) {
        utag.DB('utag.handler.INIT');
        if(utag.initcatch){
          utag.initcatch=0;
          return
        }
        this.iflag = 1;
        a = utag.loader.q.length;
        if (a > 0) {
          utag.DB("Loader queue");
          for (b = 0; b < a; b++) {
            c = utag.loader.q[b];
            utag.handler.trigger(c.a, c.b, c.c)
          }
        }
        //##UTABSOLUTELAST##
      },
      test: function() {
        return 1
      },
      // reset and run load rules
      LR: function(b){
        utag.DB("Load Rules");
        for(var d in utag.loader.GV(utag.cond)){
          utag.cond[d]=false;
        }
        utag.DB(b);
        utag.loader.loadrules(b);
        utag.DB(utag.cond);
        utag.loader.initcfg();
        // use the OPTOUTMULTI cookie value to override load rules
        utag.loader.OU();
	for(var r in utag.loader.GV(utag.cond)){
          utag.rpt['r_'+r]=(utag.cond[r])?"t":"f";
        }
      },
      // The third param "c" is a string that defines the location i.e. "blr" == before load rules
      RE:function(a,b,c,d,e,f,g){
        if(c!="alr" && !this.cfg_extend){
          return 0; 
        }
        utag.DB("RE: "+c);
        if(c=="alr")utag.DB("All Tags EXTENSIONS");
        utag.DB(b);
        if(typeof this.extend != "undefined"){
          g=0;
          for (d = 0; d < this.extend.length; d++) {
            try {
              /* Extension Attributes */
              e=0;
              if(typeof this.cfg_extend!="undefined"){
                f=this.cfg_extend[d];
                if(typeof f.count == "undefined")f.count=0;
                if(f[a]==0 || (f.once==1 && f.count>0) || f[c]==0){
                  e=1
                }else{
                  if(f[c]==1){g=1};
                  f.count++
                }
              }
              if(e!=1){
                this.extend[d](a, b);
                utag.rpt['ex_' + d] = 0
              }
            } catch (er) {
              utag.DB(er);
              utag.rpt['ex_' + d] = 1;
	      utag.ut.error({e:er.message,s:utag.cfg.path+'utag.js',l:d,t:'ge'});
            }
          }
          utag.DB(b);
          return g;
        }
      },
      trigger: function(a, b, c, d, e, f) {
        utag.DB('trigger:'+a+(c && c.uids?":"+c.uids.join(","):""));
        b = b || {};
        utag.DB(b);

        if (!this.iflag) {
          utag.DB("trigger:called before tags loaded");
          for (d in utag.loader.f) {
            if (!(utag.loader.f[d] === 1)) utag.DB('Tag '+d+' did not LOAD')
          }
          utag.loader.q.push({
            a: a,
            b: utag.handler.C(b),
            c: c
          });
          return;
        }

        // update all values for AJAX pages
        utag.ut.merge(b,this.df,0);
        utag.loader.RD( b, a );

        // clearing noview flag after the RD function call
        utag.cfg.noview = false;

        function sendTag(a, b, d){
          try {
            if(typeof utag.sender[d]!="undefined"){
              utag.DB("SENDING: "+d);
              utag.sender[d].send(a, utag.handler.C(b));
	      utag.rpt['s_' + d] = 0;
            }else if (utag.loader.cfg[d].load!=2 && utag.loader.cfg[d].s2s!=1){
              // utag.link calls can load in new tags
              utag.loader.sendq[d] = utag.loader.sendq[d] || [];
              utag.loader.sendq[d].push({"event":a, "data":utag.handler.C(b)});
              utag.loader.sendq.pending++;
              utag.loader.AS({id : d, load : 1}); 
            }
          }catch (e) {utag.DB(e)}
        }
        
        // utag.track( { event : "view", data: {myvar : "myval" }, cfg: { uids : [1,2,10] } } );
        if(c && c.uids){
          this.RE(a,b,"alr");
          for(f=0;f<c.uids.length;f++){
            d=c.uids[f];
            // bypass load rules
            sendTag(a, b, d);
          }
        }else if(utag.cfg.load_rules_ajax){
          this.RE(a,b,"blr");
          // process load rules based on current data layer
          this.LR(b);
          this.RE(a,b,"alr");
          
          for(f = 0; f < utag.loader.cfgsort.length; f++){
            d = utag.loader.cfgsort[f];
            if(utag.loader.cfg[d].load && utag.loader.cfg[d].send){
              sendTag(a, b, d);
            }
          }
        }else{
          // legacy behavior
          this.RE(a,b,"alr");
          for (d in utag.loader.GV(utag.sender)) {
            sendTag(a, b, d);
          }
        }
        this.RE(a,b,"end");
      },
      // "sort-of" copy
      C: function(a, b, c) {
        b = {};
        for (c in utag.loader.GV(a)) {
          if(a[c] instanceof Array){
            b[c] = a[c].slice(0)
          }else{
            // objects are still references to the original (not copies)
            b[c] = a[c]
          }
        }
        return b
      }
    },
    ut:{
      pad: function(a,b,c,d){
        a=""+((a-0).toString(16));d='';if(b>a.length){for(c=0;c<(b-a.length);c++){d+='0'}}return ""+d+a
      },
      vi: function(t,a,b){
        if(!utag.v_id){
          a=this.pad(t,12);b=""+Math.random();a+=this.pad(b.substring(2,b.length),16);try{a+=this.pad((navigator.plugins.length?navigator.plugins.length:0),2);a+=this.pad(navigator.userAgent.length,3);a+=this.pad(document.URL.length,4);a+=this.pad(navigator.appVersion.length,3);a+=this.pad(screen.width+screen.height+parseInt((screen.colorDepth)?screen.colorDepth:screen.pixelDepth),5)}catch(e){utag.DB(e);a+="12345"};utag.v_id=a;
        }
        return utag.v_id
      },
      hasOwn: function(o, a) {
        return o != null && Object.prototype.hasOwnProperty.call(o, a)
      },
      isEmptyObject: function(o, a) {
	for (a in o) {
          if (utag.ut.hasOwn(o,a))return false
        }
        return true
      },
      isEmpty: function(o) {
        var t = utag.ut.typeOf(o);
        if ( t == "number" ){
          return isNaN(o)
        }else if ( t == "boolean" ){
          return false
        }else if ( t == "string" ){
          return o.length === 0
        }else return utag.ut.isEmptyObject(o)
      },
      typeOf: function(e) {
        return ({}).toString.call(e).match(/\s([a-zA-Z]+)/)[1].toLowerCase();
      },
      flatten: function(o){
        // stop when arriving at a string, array, boolean, number (float or integer)
        var a = {}; 
        function r(c, p) {
          if (Object(c) !== c || c instanceof Array) {
            a[p] = c;
          } else {
            if(utag.ut.isEmptyObject(c)){
              //a[p] = {};
            }else{
              for (var d in c) {
                r(c[d], p ? p+"."+d : d);
              }
            }
          }
        }
        r(o, "");

        return a;
      },
      merge: function(a, b, c, d) {
        if(c){
          for(d in utag.loader.GV(b)){
            a[d] = b[d]
          }
        }else{
          for(d in utag.loader.GV(b)){
            if(typeof a[d]=="undefined")a[d] = b[d]
          }
        }
      },
      decode: function(a, b) {
        b = "";
        try{b = decodeURIComponent(a)}catch(e){utag.DB(e)};
        if (b == ""){b = unescape(a)};
        return b
      },
      encode: function(a, b) {
        b = "";
        try{b = encodeURIComponent(a)}catch(e){utag.DB(e)};
        if (b == ""){b = escape(a)};
        return b
      },
      error: function(a, b, c){
        if(typeof utag_err!="undefined"){
          utag_err.push(a)
        }
      },
      loader: function(o, a, b, c, l, m) {
        utag.DB(o);
        a=document;
        if (o.type=="iframe") {
          // if iframe of same ID already exists, just reset the src value (do not create a new iframe)
          m = a.getElementById( o.id );
          if ( m && m.tagName == "IFRAME" ) {
            b = m;
          } else {
            b = a.createElement("iframe");
          }
          o.attrs = o.attrs || {};
          utag.ut.merge( o.attrs, { "height" : "1", "width" : "1", "style" : "display:none" } , 0 );
        }else if (o.type=="img"){
          utag.DB("Attach img: "+o.src);
          b = new Image();
        }else{
          b = a.createElement("script");b.language="javascript";b.type="text/javascript";b.async=1;b.charset="utf-8";
        }
        if(o.id){b.id=o.id};
        for( l in utag.loader.GV(o.attrs) ){
          b.setAttribute( l, o.attrs[l] )
        }
        b.setAttribute("src", o.src);
        if (typeof o.cb=="function") {
          if(b.addEventListener) {
            b.addEventListener("load",function(){o.cb()},false);
          }else {
            // old IE support
            b.onreadystatechange=function(){if(this.readyState=='complete'||this.readyState=='loaded'){this.onreadystatechange=null;o.cb()}};
          }
        }

        if ( o.type != "img" && !m ) {
          l = o.loc || "head";
          c = a.getElementsByTagName(l)[0];
          if (c) {
            utag.DB("Attach to "+l+": "+o.src);
            if (l == "script") {
              c.parentNode.insertBefore(b, c);
            } else {
              c.appendChild(b)
            }
          }
        }
      }
    }
  };
  utag.o['digikey.main']=utag;
  utag.cfg = {
    template : "ut4.42.",
    // Enable load rules ajax feature by default
    load_rules_ajax: true,
    load_rules_at_wait: false,
    lowerqp: false,
    noconsole: false,
    //noview: ##UTNOVIEW##,
    session_timeout: 1800000,
    readywait: 0,
    noload: 0,
    domain: utag.loader.lh(),
    path: "//tags.tiqcdn.com/utag/digikey/main/prod/",
    utid: "digikey/main/201906261618"
  };
  utag.cfg.v = utag.cfg.template + "201906261618";
  try{var _gaq=_gaq || [];var pageTracker=pageTracker || {_trackEvent:function(c,d,e,f,g){g={ga_eventCat:c,ga_eventAction:d,ga_eventLabel:e,ga_eventValue:f};utag.link(g,null,[214]);},_trackPageview:function(c){_gaq.push(['_trackPageview',c?c:null]);}}}catch(e){};utag.cond={101:0,105:0,106:0,114:0,115:0,116:0,117:0,118:0,120:0,121:0,126:0,127:0,131:0,132:0,135:0,136:0,137:0,23:0,27:0,2:0,43:0,63:0,67:0,79:0,80:0,82:0,8:0,90:0,91:0,95:0,97:0,98:0};
utag.pagevars=function(ud){ud = ud || utag.data;try{ud['js_page.window.mobile']=window.mobile}catch(e){utag.DB(e)};};
utag.loader.initdata = function() {   try {       utag.data = (typeof utag_data != 'undefined') ? utag_data : {};       utag.udoname='utag_data';    } catch (e) {       utag.data = {};       utag.DB('idf:'+e);   }};utag.loader.loadrules = function(_pd,_pc) {var d = _pd || utag.data; var c = _pc || utag.cond;for (var l in utag.loader.GV(c)) {switch(l){
case '101':try{c[101]|=(/digikey\.com$/.test(d['dom.domain']))||(/digikey\.bg$/.test(d['dom.domain']))}catch(e){utag.DB(e)}; break;
case '105':try{c[105]|=(d['ref_supplier_id']=='296')||(d['supplier_id']=='296')}catch(e){utag.DB(e)}; break;
case '106':try{c[106]|=(d['dom.pathname'].toString().toLowerCase().indexOf('/bom/view'.toLowerCase())<0)}catch(e){utag.DB(e)}; break;
case '114':try{c[114]|=(typeof d['less_than_max_order_size']!='undefined')}catch(e){utag.DB(e)}; break;
case '115':try{c[115]|=(typeof d['optimizely_project_id']!='undefined')}catch(e){utag.DB(e)}; break;
case '116':try{c[116]|=(typeof d['twitter_pid']!='undefined')}catch(e){utag.DB(e)}; break;
case '117':try{c[117]|=(typeof d['clicktail_project_guid']!='undefined')}catch(e){utag.DB(e)}; break;
case '118':try{c[118]|=(typeof d['do_not_track']!='undefined'&&d['do_not_track']=='')||(d['do_not_track']!='yes')||(typeof d['do_not_track']=='undefined')||(d['region'].toString().toLowerCase()!='EMEA'.toLowerCase())}catch(e){utag.DB(e)}; break;
case '120':try{c[120]|=(typeof d['ti_parts']!='undefined')}catch(e){utag.DB(e)}; break;
case '121':try{c[121]|=(typeof d['bing_id']!='undefined')}catch(e){utag.DB(e)}; break;
case '126':try{c[126]|=(typeof d['ad_word_universal_id']!='undefined')}catch(e){utag.DB(e)}; break;
case '127':try{c[127]|=(typeof d['marin_client_id']!='undefined')}catch(e){utag.DB(e)}; break;
case '131':try{c[131]|=(typeof d['google_tracking_id_staging']!='undefined')}catch(e){utag.DB(e)}; break;
case '132':try{c[132]|=(typeof d['google_tracking_id_sandbox']!='undefined')}catch(e){utag.DB(e)}; break;
case '135':try{c[135]|=(typeof d['Kenshoo_conversion_type']!='undefined')}catch(e){utag.DB(e)}; break;
case '136':try{c[136]|=(d['do_not_track_for_consent']!='yes')}catch(e){utag.DB(e)}; break;
case '137':try{c[137]|=(d['dom.domain'].toString().toLowerCase().indexOf('digikeytest'.toLowerCase())>-1)||(d['dom.domain'].toString().toLowerCase().indexOf('digikeydev'.toLowerCase())>-1)}catch(e){utag.DB(e)}; break;
case '2':try{c[2]|=(d['page_title'].toString().toLowerCase()=='order confirmation'.toLowerCase())||(d['page_title'].toString().toLowerCase()=='shopping cart - submit'.toLowerCase())}catch(e){utag.DB(e)}; break;
case '23':try{c[23]|=(d['dom.domain'].toString().indexOf('.jp')>-1)}catch(e){utag.DB(e)}; break;
case '27':try{c[27]|=(d['dom.domain'].toString().indexOf('.kr')>-1)}catch(e){utag.DB(e)}; break;
case '43':try{c[43]|=(typeof d['qp.wt.z_sm_link']!='undefined'&&d['qp.wt.z_sm_link'].toString().toLowerCase().indexOf('twitter'.toLowerCase())>-1)}catch(e){utag.DB(e)}; break;
case '63':try{c[63]|=(d['dom.pathname'].toString().indexOf('/product-highlight/c/cui/summer-of-power')>-1)}catch(e){utag.DB(e)}; break;
case '67':try{c[67]|=(d['page_title']=='Order Confirmation'&&d['dom.domain'].toString().toLowerCase().indexOf('.cn'.toLowerCase())>-1&&typeof d['order_currency']!='undefined')||(d['page_title']=='Shopping Cart - Submit'&&d['dom.domain'].toString().toLowerCase().indexOf('.cn'.toLowerCase())>-1&&typeof d['order_currency']!='undefined')}catch(e){utag.DB(e)}; break;
case '79':try{c[79]|=(d['dom.domain'].toString().toLowerCase().indexOf('digikey.com.cn'.toLowerCase())>-1)||(d['dom.domain'].toString().toLowerCase().indexOf('digikey.cn'.toLowerCase())>-1)}catch(e){utag.DB(e)}; break;
case '8':try{c[8]|=(d['page_title']!='Order Confirmation'&&d['page_title']!='Shopping Cart - Submit')}catch(e){utag.DB(e)}; break;
case '80':try{c[80]|=(d['dom.domain'].toString().toLowerCase().indexOf('digikey.cn'.toLowerCase())>-1)}catch(e){utag.DB(e)}; break;
case '82':try{c[82]|=(d['dom.pathname'].toString().toLowerCase()=='/en/maker'.toLowerCase())}catch(e){utag.DB(e)}; break;
case '90':try{c[90]|=(d['dom.domain'].toString().indexOf('digikeytest')>-1)||(d['dom.domain'].toString().indexOf('digikeydev')>-1)||(d['dom.domain'].toString().indexOf('digikeytrain')>-1)}catch(e){utag.DB(e)}; break;
case '91':try{c[91]|=(d['dom.domain'].toString().toLowerCase().indexOf('digikeytest'.toLowerCase())<0&&d['dom.domain'].toString().toLowerCase().indexOf('digikeydev'.toLowerCase())<0)}catch(e){utag.DB(e)}; break;
case '95':try{c[95]|=(d['page_site'].toString().toLowerCase().indexOf('digikey.hk'.toLowerCase())<0&&!/digikey\.com$/i.test(d['page_site']))}catch(e){utag.DB(e)}; break;
case '97':try{c[97]|=(d['dom.domain'].toString().toLowerCase().indexOf('.cn'.toLowerCase())<0)}catch(e){utag.DB(e)}; break;
case '98':try{c[98]|=(d['ref_page_event'].toString().toLowerCase()=='add to cart'.toLowerCase())}catch(e){utag.DB(e)}; break;}}};utag.pre=function() {    utag.loader.initdata();utag.pagevars();    try{utag.loader.RD(utag.data)}catch(e){utag.DB(e)};    utag.loader.loadrules();    };utag.loader.GET=function(){utag.cl={'_all_':1};utag.pre();
  utag.handler.extend=[function(a,b){ try{ if(1){
// Manage new tagging for testing
utag.data.domain = location.hostname;

//utag.data.testNewTagging = false;
//if (utag.data.domain.indexOf('digikeytest')>-1 || utag.data.domain.indexOf('digikey.ca')>-1) {
//    utag.data.testNewTagging = true;
//}

if (typeof utag.data['ExtRun'] == 'undefined') {
  utag.data["ExtRun"] = "";
}

utag.dkTrk = function(a) {
  if(!(utag.data['ExtRun'].indexOf(a)>0)) {
    if (typeof utag.data['ExtDln'] == 'undefined') {
        if (utag.data['ExtRun'].length > 0) {
           utag.data["ExtDln"] = "||";
        } else {
           utag.data["ExtDln"] = ""; 
        }
     }

    utag.data["ExtRun"] += (utag.data["ExtDln"] + a);
    utag.data["ExtDln"] = "|"; 
  }
  return utag.data['ExtRun'];
}
  

utag.cfg.domainForCookies = location.hostname.match(/\.digikey\..*/)[0];

utag.displayDigiKeyTags = function(a,c)
{
    var tsttag = {};
    for (var i in c){
        if (!i.match(/^cp.|^meta.|^tealium.|^ut.|^dom.|^js_page.|^qp./i)){
            tsttag[i]=c[i];
        }
    }
    utag.DB(a);
    utag.DB(tsttag);
}

if (a === 'view' && utag.data.do_not_process_cookies !== true) {
    var justCookieValues = [];
    var keyValuePairs = [],aKeyValuePair = [];
    if (typeof b['cp.utm_data_x'] != 'undefined' && b['cp.utm_data_x'] !== "") {
        keyValuePairs = b['cp.utm_data_x'].split(',');
        for (n = 0; n < keyValuePairs.length; n++) {
            aKeyValuePair = keyValuePairs[n].split("=");
            utag.data[aKeyValuePair[0]] = b[aKeyValuePair[0]] = justCookieValues[aKeyValuePair[0]] = decodeURIComponent(aKeyValuePair[1]).replace(/@@/g,',');
//            justCookieValues[aKeyValuePair[0]] = decodeURIComponent(aKeyValuePair[1]);
        }
      utag.dkTrk('398.2');
        b['cp.utm_data_x'] = "";
        utag.displayDigiKeyTags('New Cookie Data',justCookieValues);
    }
    document.cookie = "utm_data_x=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;domain="+utag.cfg.domainForCookies+";"; 



if (a === 'view' && typeof b['cp.utm_data_e'] != 'undefined' && b['cp.utm_data_e'] !== "") {
 utag.DB('Process Analytics Cookie');
  var keyValuePairs = b['cp.utm_data_e'].split(',');
  for (n = 0; n < keyValuePairs.length; n++) {
     var aKeyValuePair = keyValuePairs[n].split("=");
     if (aKeyValuePair[0] !== 'ExtRun') {
         utag.data[aKeyValuePair[0]] = b[aKeyValuePair[0]] = decodeURIComponent(aKeyValuePair[1]);
     }
   }
  b['cp.utm_data_e'] = "";
  document.cookie = "utm_data_e=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;"; 
  utag.dkTrk('398.1');
  utag.DB(b);
}
}



} } catch(e){ utag.DB(e) }  },
function(a,b){ try{utag.runonce = utag.runonce || {};utag.runonce.ext = utag.runonce.ext || {};if(typeof utag.runonce.ext[356]=='undefined'){utag.runonce.ext[356]=1;if(1){
// Standard Helper Fuctions 356

if (typeof utag.data['js_page.LivePersonSection'] == 'undefined') {
    utag.data['js_page.LivePersonSection'] = "";
}


utag.cfg.load_rules_at_wait = true;
utag.cfg.readywait = true;
utag.cfg.lowermeta = true;



utag.dkStdVars = function(data,tag_type,href) {
    if (typeof data.referring_page_event != 'undefined') data.ref_page_event = data.referring_page_event;
    data['page_site'] = utag.data['page_site'];
    data['page_language'] = utag.data['page_language'];
    data['page_title'] = utag.data['page_title'];
    data['event_domain'] = utag.data['dom.domain'];
    data['event_url'] = utag.data['dom.pathname'];
    data['event_query'] = utag.data['dom.query_string'];
    data['event_referrer_url'] = utag.data['dom.referrer'];
    data['ref_page_type'] = utag.data['page_type'];
    data['ref_page_sub_type'] = utag.data['page_sub_type'];
    data['ref_page_id'] = utag.data['page_id'];
    var gdpr = JSON.parse(localStorage.getItem('gdpr_cookie_consent'));
    data['ccookie'] = gdpr.acceptedOn;
    if (tag_type === 'link') {
        data.page_type = utag.data.page_type;
        data.page_sub_type = utag.data.page_sub_type;
        data.page_id = utag.data.page_id;
        if (typeof href != 'undefined') {
            data['ext_host'] = href.substring(href.indexOf('//')+2,href.indexOf('/',10));
            data['ext_uri'] = href.substr(href.indexOf('/',10));
        }
    }
}

if (utag.data.doNotTrack === "1" || utag.data.do_not_track === 'yes' || window.doNotTrack === "1") {
    utag.data['do_not_track'] = b['do_not_track'] = 'yes';
} else {
    utag.data['do_not_track'] = b['do_not_track'] = 'no';
}

utag.dkParseStringtoDataObj = function(str){
    var aKeyValuePair = [],returnObj = {};
    var strng = str.replace(';',',');
    var keyValuePairs = strng.split(',');
    for (var n = 0; n < keyValuePairs.length; n++) {
        aKeyValuePair = keyValuePairs[n].split("=");
        returnObj[aKeyValuePair[0]] = aKeyValuePair[1];
    }
    return returnObj;
}

utag.dkValuePairsToProperties = function(VPArray,vObject) {
    for (var i = 0; i < VPArray.length; i++) {
        var pair = VPArray[i].split('=');
        if (pair.length > 1) {
            pair[0] = pair[0].replace(' ','');
            pair[1] = pair[1].replace(/^\s+|\s+$/gm,'');
            vObject[pair[0]] = pair[1];
        }
    }
}

utag.dkConCatPageType = function() {
    var pgType = utag.data['page_type'] || utag_data['page_type'] || "";
    var pgSType = utag.data['page_sub_type'] || utag_data['page_sub_type'] || "";
    return pgType + "-" + pgSType;
}

}}} catch(e){ utag.DB(e) }  },
function(a,b){ try{utag.runonce = utag.runonce || {};utag.runonce.ext = utag.runonce.ext || {};if(typeof utag.runonce.ext[331]=='undefined'){utag.runonce.ext[331]=1;if(1){
// Specialized Helper Functions 331
if (utag.data.tealium_environment == 'qa') {
  var e = 1;
} 
 
utag.dkAsgnExtLnk = function(a, e) {
  var dest = e.currentTarget.href;
  if(typeof dest != 'undefined') {
    a['ext_location'] = dest;
    a['ext_host'] = dest.substring(dest.indexOf('//')+2,dest.indexOf('/',10));
    a['ext_uri'] = dest.substr(dest.indexOf('/',10));
  }
}
  
    
 utag.assignVideoSource = function (b) {
   try {
   if (typeof b['video_source'] == 'undefined' && typeof utag.data['video_source'] == 'undefined') {
    if (utag.data['ref_page_type'] === 'SP' && utag.data['ref_page_sub_type'] === 'SP')
      {utag.data['video_source'] = 'Supplier Portal';}
    else if (utag.data['ref_page_type'] === 'CP')
      {utag.data['video_source']='Careers';}
    else if ((utag.data['ref_page_type'] === 'DT' && utag.data['ref_page_sub_type'] === 'RE') || (utag.data['ref_page_type'] === 'RE' && utag.data['ref_page_sub_type'] === 'DT'))
      {utag.data['video_source']='Development Tools';}
    else if ((utag.data['ref_page_type'] === 'DT' && utag.data['ref_page_sub_type'] === 'BFA') || (utag.data['ref_page_type'] === 'DT' && utag.data['ref_page_sub_type'] === 'LP'))
      {utag.data['video_source']='Design Tools';} 
    else if (utag.data['ref_page_type'] === 'RE' && utag.data['ref_page_sub_type'] === 'DKE')
      {utag.data['video_source']='Resources';} 
    else if (utag.data['ref_page_type'] === 'BLG')
      {utag.data['video_source']='Blog - The Circuit';}
    else if (utag.data['ref_page_type'] === 'FS' && utag.data['ref_page_sub_type'] === 'CS')
      {utag.data['video_source']='Content Search';}
    else if (utag.data['ref_page_type'] === 'FS' && utag.data['ref_page_sub_type'] === 'PH')
      {utag.data['video_source']='Product Highlight Library';}
    else if ((utag.data['ref_page_type'] === 'FS' && utag.data['ref_page_sub_type'] === 'PTM') || utag.data['ref_page_type'] === 'PTM')
      {utag.data['video_source']='PTM';}
    else if ((utag.data['ref_page_type'] === 'FS' && utag.data['ref_page_sub_type'] === 'VL') || (utag.data['ref_page_type'] === 'VI' && utag.data['ref_page_sub_type'] === 'VL') || (utag.data['ref_page_type'] === 'VL' && utag.data['ref_page_sub_type'] === 'VP'))
      {utag.data['video_source']='Video Library';}
    else if (utag.data['ref_page_type'] === 'HP')
      {utag.data['video_source']='DK Homepage';}
    else if (utag.data['ref_page_type'] === 'IDA')
      {utag.data['video_source']='Industrial Automation';}
    else if (utag.data['ref_page_type'] === 'PS' && utag.data['ref_page_sub_type'] === 'PD')
      {utag.data['video_source']='Part Detail';}
    else if (utag.data['ref_page_type'] === 'RDL')
      {utag.data['video_source']='Reference Design Library';}
    else if (utag.data['ref_page_type'] === 'RE' && utag.data['ref_page_sub_type'] === 'IOT')
      {utag.data['video_source']='IoT Solutions';}
    else if (utag.data['ref_page_type'] === 'SP' && utag.data['ref_page_sub_type'] === 'PH')
      {utag.data['video_source']='Product Highlight Library';}
    else if (typeof['page_content_group'] != 'undefined' && decodeURIComponent(utag.data['page_content_group']) == 'Product Highlight')
     {utag.data['video_source']='Product Highlight Library';}
     else if (typeof['page_content_group'] != 'undefined' && decodeURIComponent(utag.data['page_content_group']) == 'Scheme It')
     {utag.data['video_source']='Scheme It';}
     else if (typeof['page_content_group'] != 'undefined' && decodeURIComponent(utag.data['page_content_group']) == 'Blogs')
     {utag.data['video_source']='Blog - The Circuit';}
     else if (typeof['page_content_group'] != 'undefined' && decodeURIComponent(utag.data['page_content_group']) == 'Resources')
     {utag.data['video_source']='Resources';}
     else if (utag.data['ref_page_type'] === 'TZ')
      {utag.data['video_source']='Techzones';}
    else if (utag.data['ref_page_sub_type'] === 'SP')
      {utag.data['video_source']='Supplier Portal';}
    else if ((utag.data['ref_page_type'] === 'DYC' && utag.data['ref_page_sub_type'] === 'PG') || (utag.data['ref_page_type'] === 'ERC' && utag.data['ref_page_sub_type'] === 'HP') || (utag.data['ref_page_type'] === 'RCO' && utag.data['ref_page_sub_type'] === 'RDX') || (utag.data['ref_page_type'] === 'RE' && utag.data['ref_page_sub_type'] === 'RE') || (utag.data['ref_page_type'] === 'TZ' && utag.data['ref_page_sub_type'] === 'SB') || (utag.data['ref_page_type'] === 'PS' && utag.data['ref_page_sub_type'] === 'CAT') || (utag.data['ref_page_type'] === 'PS' && utag.data['ref_page_sub_type'] === 'FAM') || (utag.data['ref_page_type'] === 'HE' && utag.data['ref_page_sub_type'] === 'HE'))
      {utag.data['video_source']='Other';}
    else if (typeof b["qp.video_source"] != 'undefined')
      {utag.data['video_source']=b["qp.video_source"];}
    else if (typeof b["qp.WT.z_video_source"] != 'undefined')
      {utag.data['video_source']=b["qp.WT.z_video_source"];}
    else
      {utag.data['video_source']=utag.data['ref_page_type'] + '_' + utag.data['ref_page_sub_type'];}
  } else {
	// correct video sources defined incorrectly
  }
 } catch (e) {
   utag.DB(e);
 }
} 

utag.InitWTCampaign = function (b) {
  b['social_media_campaign'] = '(Not Set)';
  b['vanity_campaign'] = '(Not Set)';
  b['webapp_campaign'] = '(Not Set)';
  b['aggregator_or_supplier_campaign'] = '(Not Set)';
  b['supplier_landing_page_campaign'] = '(Not Set)';
  b["ExtRun"] = utag.dkTrk('333.1');
}

}}} catch(e){ utag.DB(e) }  },
function(a,b){ try{utag.runonce = utag.runonce || {};utag.runonce.ext = utag.runonce.ext || {};if(typeof utag.runonce.ext[357]=='undefined'){utag.runonce.ext[357]=1;if(1){
// Digikey API - 357


utag.dklink = function(a,href) {
    try {
        if (window.utag_cfg_ovrd.noview === false) {
            utag.dkStdVars(a,'link',href);
            if (typeof a['event_category'] == 'undefined') {
                a['event_category'] = 'Coded Event';
            }
            a['not_a_pageview'] = '1';
            if (a['page_type'] == 'VI' && a['page_sub_type'] == 'BC') {
                a['event_category'] = 'bc_video';
            }
            a["ExtRun"] = utag.dkTrk("357.2");
            utag.link(a);
            
            if (a['ref_page_event'] == 'Submit Order') {
                var param = 'ref_page_event='+a['ref_page_event']+',order_payment_type='+a['order_payment_type'];
                utag.dkTrk('125.2');
                utag.dkCookie(param);
            }
            utag.data['ExtRun'] = "";
            utag.data['ExtDln'] = "";
        }
    } catch (e) {
      utag.DB(e);
    } 
}

utag.dkLink = function(txt) {
    var data = {};
    utag.data.priorityLink = true;
    var kvs = txt.split(';');
    for (var i = 0; i < kvs.length; i++) {
        var pair = kvs[i].split('=');
        data[pair[0]] = pair[1];
    }
    data["ExtRun"] = utag.dkTrk("357.3");
    utag.dklink(data);
    utag.data.priorityLink = false;
}

utag.dkVideo = function(playerid,bcData) {
  playerid = "vjs_video_3";
  var elmnt = document.getElementById(playerid);
  var VPlayer = videojs(playerid).player();
  var data = {};
  utag.assignVideoSource(data);
  data['video_source'] = utag.data['video_source'];
  data['event_category'] = 'bc_video';
  data['event_label'] = VPlayer.mediainfo.name;
  data['ref_page_event'] = bcData['WT.z_event_type'];
  data['playlist_id'] = '(Not Set)';
  data['video_id'] = VPlayer.mediainfo.id;
  data['page_type'] = 'VI';
  data['page_sub_type'] = 'BC';
  data['content_group'] = 'Video';
  data['content_sub_group'] = 'Brightcove'; 
  var i;
  var KV = [];
  for (i=0; i < VPlayer.mediainfo.tags.length;i++) {
    KV = VPlayer.mediainfo.tags[i].split('=');
    if (KV[0]=='supplierid') {
      utag.data['ref_supplier_id'] = KV[1];
      break;
    }
  }
  data['supplier_id'] = utag.data['ref_supplier_id']|'(Not Set)';
  utag.dklink(data);
}

utag.dkDialogTag = function(title,label,instr) {
    var e = 1;
}

utag.dkView = function(data) {
    if (utag_cfg_ovrd.noview !== true) utag.view(data);    
}

utag.dkErrorTag = function(data,errorId,errorData) {
    var tmpData = JSON.parse(JSON.stringify(data));
    tmpData.event_category = 'Error Info';
    tmpData.ref_page_event = errorId;
    tmpData.event_label = errorData;
    tmpData["ExtRun"] = utag.dkTrk("357.5");
    utag.dklink(tmpData);
//    data = JSON.parse(tmpData);
}
  

}}} catch(e){ utag.DB(e) }  },
function(a,b){ try{utag.runonce = utag.runonce || {};utag.runonce.ext = utag.runonce.ext || {};if(typeof utag.runonce.ext[300]=='undefined'){utag.runonce.ext[300]=1;if(1){
// Process the ST Micro cookie if exists
if (typeof b['cp.dk_mfr_trk'] != 'undefined') {
  var array = b['cp.dk_mfr_trk'].split('|');
     utag.data['st_campaign'] = array[0]; 
     utag.data['st_campaign_supplier_id'] = array[1]; 
     utag.data['manufacturer_part_number'] = array[2];
     switch (utag.data.st_campaign_supplier_id) {
      case "399":
      utag.data.st_campaign_supplier_name="Kemet";
      break;
      case "497":
      utag.data.st_campaign_supplier_name="ST Micro";
      break;
      default:
      utag.data.st_campaign_supplier_name='Unknown';
      }

  utag.dkTrk('300.3');
}

}}} catch(e){ utag.DB(e) }  },
function(a,b){ try{ if(1){
// Set Variables based on Domain - 239

function AssignLanguage (b,dlang) {
    if (typeof b.page_language == 'undefined' || b.page_language == '(Not Set)') {
        if (typeof b['meta.digikey.fss.language'] != 'undefined') {
          b.page_language = b['meta.digikey.fss.language'];
        }
        else if (typeof b["qp.lang"] != 'undefined') {
            b.page_language = b["qp.lang"];
        }
        else {b.page_language = dlang;}
    }
}
    
function AssignGT(b,gid,site,dlang,region,dcur) {
  b.google_tracking_id = "UA-88355857-" + gid;
  b.page_site = site;
  b.region = region;
  AssignLanguage(b,dlang);
  b.order_currency = dcur;
}

function SetAdWord(b,id,lbl) {
//    b['ad_word_id'+CurrentAdWordID]='AW-'+id;
//    b['ad_word_label'+CurrentAdWordID] = lbl;
//    CurrentAdWordID++;
    b.ad_word_universal_id='AW-'+id;
    b.ad_word_universal_label = lbl;
}


function SetUniversalAdWord(b,id,lbl) {
    b.ad_word_universal_id='AW-'+id+',AW-987442776';
    b.ad_word_universal_label = lbl+',fWozCOSc15ABENjc7NYD';
}

function SetOptimizely(b,id,max_ord_amt) {
  b['optimizely_project_id'] = id;
  if (b['order_subtotal_in_usd'] < max_ord_amt) {
    b['less_than_max_order_size'] = 1;
  }
}

var AdWordConfirmationIDs = [];
var CurrentAdWordID = 1;
b['AdWordConfirmationIDs'] = AdWordConfirmationIDs;
var dom = b['dom.domain'];
if (/digikeytest\.digikey/i.test(dom) || /digikeydev\.digikey/i.test(dom)){
    b['google_tracking_id_sandbox'] = 'UA-88355857-1';
    AssignGT(b,1,'US','en','Americas','USD');
  if (/digikey\.bg$/i.test(dom)) {
    b['google_tracking_id_staging'] = 'UA-88355857-8';
    AssignGT(b,8,'US','en','Americas','USD');
  }
    b['clicktail_project_guid'] = '3d60bbfe-3fa3-45c4-9332-cc1534d3e4bd';
  b['region'] = 'Americas'
  SetUniversalAdWord(b,'986885005','jp2jCOPVvgQQjdfK1gM');
  SetOptimizely(b,'546832397','2500');
  b.marin_client_id = '27490huz44870';
    b.kenshoo_id = '6216';
    utag.data.google_tracking_id1 = 'UA-88355857-1';
      b['bing_id'] = '20044368';
}
else if(/digikey\.at$/i.test(dom)){
  AssignGT(b,'9','AT','de','EMEA','EUR');
  b['region'] = 'EMEA'
  SetUniversalAdWord(b,'976480781','TMPqCNPojwcQjdTP0QM');
  b.marin_client_id = '27490w9b44845';
  }
else if (/digikey\.com\.au$/i.test(dom)){
  AssignGT(b,'10','AU','en','APAC','AUD');
  b['bing_id'] = '20044368';
  b['region'] = 'APAC'
  SetUniversalAdWord(b,'929868311','MrZ0CPHf-wcQl9SyuwM');
  b.marin_client_id = '27490v4c44844';
}
else if (/digikey\.be$/i.test(dom)){
  AssignGT(b,'11','BE','nl','EMEA','EUR');
  b['region'] = 'EMEA'
  SetUniversalAdWord(b,'969095129','bM2lCLejxhwQ2e-MzgM');
  b.marin_client_id = '27490f5a44846';
}
else if (/digikey\.bg$/i.test(dom)){
  AssignGT(b,'12','BG','en','EMEA','EUR');
  b['google_tracking_id_staging'] = 'UA-88355857-8';  
  b['region'] = 'EMEA'
}
else if (/digikey\.ca$/i.test(dom)){
  AssignGT(b,'13','CA','en','Americas','CAD');
  b['bing_id'] = '20044366';
  b['region'] = 'Americas'
//  b['google_tracking_id_sandbox'] = 'UA-88355857-1';
//  b['google_tracking_id_staging'] = 'UA-88355857-8';
  SetUniversalAdWord(b,'986753255','oq7mCOGT1gYQ59HC1gM');
  SetOptimizely(b,'546832397','2500');
  b.marin_client_id = '27490aiz44848';
}
else if (/digikey\.ch$/i.test(dom)){
  AssignGT(b,'14','CH','de','EMEA','CHF');
  b['region'] = 'EMEA'
  SetUniversalAdWord(b,'961995131','493cCJmunVYQ-8LbygM');
  b.marin_client_id = '27490qmj44866';
}
else if (/digikey\.com\.cn$/i.test(dom)){
    AssignGT(b,'15','ZZ','zhs','APAC','CNY');
    b['adwords_remarketing_id'] = '966190433';
    b['region'] = 'APAC'
    b['clicktail_project_guid'] = '4ac915e3-084b-4802-a8a0-e27758930263';
    b.marin_client_id = '6fzke3kdm0';
    b.kenshoo_id = '6216';
}
else if (/digikey\.cn$/i.test(dom)){
  AssignGT(b,'17','CN','zhs','APAC','CNY');
  b['adwords_remarketing_id'] = '966190433';
  b['region'] = 'APAC'
  b.kenshoo_id = '6216';
}
else if (/digikey\.cz$/i.test(dom)){
  AssignGT(b,'16','CZ','en','EMEA','CZK');
  b['region'] = 'EMEA'
}
else if (/digikey\.de$/i.test(dom)){
  AssignGT(b,'19','DE','de','EMEA','EUR');
//  b['adwords_remarketing_id'] = '987990740';
  
  b['twitter_pid']='I4rz4';
  b['bing_id'] = '20044364';
  b['region'] = 'EMEA'
  SetUniversalAdWord(b,'987990740','_unPCLylxgcQ1JWO1wM');
  SetOptimizely(b,'2342910375','4000');
  b['clicktail_project_guid'] = '359f1ac2-6ae6-499d-a3e2-0c0a64bb3273';
  b.marin_client_id = '27490ol144851';
}
else if (/digikey\.dk$/i.test(dom)){
  AssignGT(b,'18','DK','en','EMEA','DKK');
  b['region'] = 'EMEA'
  SetUniversalAdWord(b,'965467474','udvBCM-B1VYQ0rqvzAM');
  b.marin_client_id = '27490p8d44849';
}
else if (/digikey\.ee$/i.test(dom)){
  AssignGT(b,'20','EE','en','EMEA','EUR');
  b['region'] = 'EMEA'
}
else if (/digikey\.es$/i.test(dom)){
  AssignGT(b,'21','ES','en','EMEA','EUR');
  b['region'] = 'EMEA'
  b['bing_id'] = '20114635';
  SetUniversalAdWord(b,'971633003','xkbUCNXKgwkQ6-KnzwM');
  b.marin_client_id = '27490hhi44864';
}
else if (/digikey\.fi$/i.test(dom)){
  AssignGT(b,'23','FI','en','EMEA','EUR');
  b['region'] = 'EMEA'
  SetUniversalAdWord(b,'962854095','xxO0COy1-lUQz_mPywM');
  b.marin_client_id = '274908ii44454';
}
else if (/digikey\.fr$/i.test(dom)){
  AssignGT(b,'22','FR','fr','EMEA','EUR');
  b['twitter_pid']='I4rz4';
  b['bing_id'] = '20044369';
  b['region'] = 'EMEA'
  SetUniversalAdWord(b,'999892546','j1SCCKaZ9AYQwszk3AM');
  b.marin_client_id = '27490bvp44850';
}
else if (/digikey\.gr$/i.test(dom)){
  AssignGT(b,'25','GR','en','EMEA','EUR');
  b['region'] = 'EMEA'
}
else if (/digikey\.hk$/i.test(dom)){
  AssignGT(b,'24','HK','en','APAC','HKD');
  b['bing_id'] = '20044370';
  b['region'] = 'APAC'
  SetUniversalAdWord(b,'966544232','xv2rCLCk5QkQ6JbxzAM');
  b.marin_client_id = '27490k4944852';
}
else if (/digikey\.hu$/i.test(dom)){
   AssignGT(b,'26','HU','en','EMEA','HUF');
  b['region'] = 'EMEA'
}
else if (/digikey\.ie$/i.test(dom)){
  AssignGT(b,'27','IE','en','EMEA','EUR');
  b['region'] = 'EMEA'
  SetUniversalAdWord(b,'992690842','enAsCJaIxgYQmoWt2QM');
  b.marin_client_id = '27490ne544854';
}
else if (/digikey\.co\.il$/i.test(dom)){
  AssignGT(b,'29','IL','en','EMEA','ILS');
  b['adwords_remarketing_id'] = '964542947';
  b['region'] = 'EMEA'
  SetUniversalAdWord(b,'964542947','9Py7CODxqFYQ44P3ywM');
  b.marin_client_id = '27490y1d44455';
}
else if (/digikey\.it$/i.test(dom)){
  AssignGT(b,'28','IT','it','EMEA','EUR');
  b['bing_id'] = '20060577';
  b['twitter_pid']='I4rz4';
  b['region'] = 'EMEA'
  SetUniversalAdWord(b,'975409889','JFkvCJf6vhsQ4aWO0QM');
  b.marin_client_id = '27490mu044855';
}
else if (/digikey\.jp$/i.test(dom)){
  AssignGT(b,'30','JP','ja','APAC','JPY');
  b['region'] = 'APAC'
  SetUniversalAdWord(b,'982810753','AaoBCO--1QUQgYHS1AM');
  SetOptimizely(b,'3579530909','4000');
  b['clicktail_project_guid'] = '4164d9a2-4c6a-46d3-b7d1-3a9f57b01dab';
  b.marin_client_id = '27490x9444856';
}
else if (/digikey\.kr$/i.test(dom)){
  AssignGT(b,'31','KR','ko','APAC','KRW');
//  b['google_tracking_id_sandbox'] = 'UA-88355857-1';
  b['region'] = 'APAC'
  SetUniversalAdWord(b,'967069669','-6ZeCIvMvwoQ5Z-RzQM');
  b.marin_client_id = '27490lb344857';
}
else if (/digikey\.lt$/i.test(dom)){
  b['region'] = 'EMEA'
  AssignGT(b,'32','LT','en','EMEA','EUR');
}
else if (/digikey\.lu$/i.test(dom)){
  b['region'] = 'EMEA'
  AssignGT(b,'33','LU','en','EMEA','EUR');
}
else if (/digikey\.lv$/i.test(dom)){
  b['region'] = 'EMEA'
  AssignGT(b,'35','LV','en','EMEA','EUR');
}
else if (/digikey\.com\.mx$/i.test(dom)){
  AssignGT(b,'34','MX','es','Americas','USD');
  b['region'] = 'Americas'
  SetUniversalAdWord(b,'968133679','UmMZCKHW2wgQr5jSzQM');
  b.marin_client_id = '27490ngz44858';
}
else if (/digikey\.nl$/i.test(dom)){
  AssignGT(b,'36','NL','nl','EMEA','EUR');
  b['region'] = 'EMEA'
  SetUniversalAdWord(b,'973802402','LvzfCI6mxAkQopes0AM');
  b.marin_client_id = '274903oa44859';
}
else if (/digikey\.no$/i.test(dom)){
  AssignGT(b,'37','NO','en','EMEA','NOK');
  b['region'] = 'EMEA'
  SetUniversalAdWord(b,'960334832','e1PoCJTBnFcQ8Jf2yQM');
  b.marin_client_id = '274903ud44860';
}
else if (/digikey\.co\.nz$/i.test(dom)){
  AssignGT(b,'39','NZ','en','APAC','NZD');
  b['region'] = 'APAC'
  SetUniversalAdWord(b,'990617294','XFmjCNKu3QcQzr2u2AM');
  b.marin_client_id = '274903bu44451';
}
else if (/digikey\.pl$/i.test(dom)){
  b['region'] = 'EMEA';
  SetUniversalAdWord(b,'789488977','h4_ICPrk1YgBENHKuvgC');
  AssignGT(b,'38','PL','en','EMEA','PLN');
  b.marin_client_id = '274903m763794';
}
else if (/digikey\.pt$/i.test(dom)){
  AssignGT(b,'41','PT','en','EMEA','EUR');
  SetUniversalAdWord(b,'966398518','4l-FCOW8mlYQtqTozAM');
  b['region'] = 'EMEA';
  b.marin_client_id = '27490rx444861';
}
else if (/digikey\.se$/i.test(dom)){
  AssignGT(b,'40','SE','sv','EMEA','SEK');
  b['region'] = 'EMEA'
  SetUniversalAdWord(b,'973880654','HhMnCOjPx1YQzvqw0AM');
  b.marin_client_id = '27490l5s44865';
}
else if (/digikey\.si$/i.test(dom)){
  AssignGT(b,'43','SI','en','EMEA','EUR');
  b['region'] = 'EMEA'
}
else if (/digikey\.sg$/i.test(dom)){
  AssignGT(b,'42','SG','en','APAC','SGD');
  b['bing_id'] = '20044371';
   b['region'] = 'APAC'
 SetUniversalAdWord(b,'966710723','o1CsCK_kt1YQw6v7zAM');
 b.marin_client_id = '27490i3244862';
}
else if (/digikey\.sk$/i.test(dom)){
  AssignGT(b,'45','SK','en','EMEA','EUR');
  b['region'] = 'EMEA'
}
else if (/digikey\.tw$/i.test(dom)){
  AssignGT(b,'44','TW','zht','APAC','TWD');
  b['bing_id'] = '20044367';
  b['region'] = 'APAC'
  SetUniversalAdWord(b,'972972209','kDvmCJ_5vhsQscH5zwM');
  b.marin_client_id = '2749098744867';
}
else if (/digikey\.co\.uk$/i.test(dom)){
  AssignGT(b,'47','UK','en','EMEA','GBP');
  b['twitter_pid']='I4rz4';
  b['bing_id'] = '20044365';
  b['region'] = 'EMEA'
  SetUniversalAdWord(b,'991776014','aeG6CPqyywcQjpr12AM');
  b.marin_client_id = '27490ndg44869';
}
else if (/digikey\.com$/i.test(dom)){
  AssignGT(b,'46','US','en','Americas','USD');
  b['bing_id'] = '20044363';
  b['region'] = 'Americas'
  //US Site
  SetUniversalAdWord(b,'986885005','jp2jCOPVvgQQjdfK1gM')
  SetOptimizely(b,'346228540','4500');
  b['clicktail_project_guid'] = '3d60bbfe-3fa3-45c4-9332-cc1534d3e4bd';
  b.marin_client_id = '27490huz44870';
}

else if (/digikey\.in$/i.test(dom)){
  AssignGT(b,'49','IN','en','APAC','USD');
//  b['adwords_remarketing_id'] = 'AW-980367696';
  SetUniversalAdWord(b,'980367696','8lpmCJi_pocBENDyvNMD');  
  b['region'] = 'APAC'
  b.marin_client_id = '2749046d44853';
  b['clicktail_project_guid'] = '4ac915e3-084b-4802-a8a0-e27758930263';
}
else if (/digikey\.my$/i.test(dom)){
  AssignGT(b,'48','MY','en','APAC','MYR');
  b['region'] = 'APAC'
  b['bing_id'] = '20114634';
  SetUniversalAdWord(b,'837569373','vd26CPqL-3QQ3ZaxjwM');
  b.marin_client_id = '274905bu61470';
}
else if (/digikey\.ro$/i.test(dom)){
  AssignGT(b,'51','RO','en','EMEA','RON');
  b['region'] = 'EMEA'
}
else if (/digikey\.ae$/i.test(dom)){
  AssignGT(b,'52','AE','en','AFIL','USD');
//  b['adwords_remarketing_id'] = '991414342';
  SetUniversalAdWord(b,'991414342','ASheCILQwQgQxpDf2AM');
}
else if (/digikey\.am$/i.test(dom)){
  AssignGT(b,'52','AM','en','AFIL','USD');
//  b['adwords_remarketing_id'] = '991414342';
  SetUniversalAdWord(b,'991414342','ASheCILQwQgQxpDf2AM');
}
else if (/digikey\.com\.ar$/i.test(dom)){
  AssignGT(b,'52','AR','en','AFIL','USD');
//  b['adwords_remarketing_id'] = '991414342';
  SetUniversalAdWord(b,'991414342','ASheCILQwQgQxpDf2AM');
}
else if (/digikey\.ba$/i.test(dom)){
  AssignGT(b,'52','BA','en','AFIL','USD');
//  b['adwords_remarketing_id'] = '991414342';
  SetUniversalAdWord(b,'991414342','ASheCILQwQgQxpDf2AM');
}
else if (/digikey\.bo$/i.test(dom)){
  AssignGT(b,'52','BO','en','AFIL','USD');
//  b['adwords_remarketing_id'] = '991414342';
  SetUniversalAdWord(b,'991414342','ASheCILQwQgQxpDf2AM');
}
else if (/digikey\.by$/i.test(dom)){
  AssignGT(b,'52','BY','en','AFIL','USD');
//  b['adwords_remarketing_id'] = '991414342';
  SetUniversalAdWord(b,'991414342','ASheCILQwQgQxpDf2AM');
}
else if (/digikey\.cl$/i.test(dom)){
  AssignGT(b,'52','CL','en','AFIL','USD');
//  b['adwords_remarketing_id'] = '991414342';
  SetUniversalAdWord(b,'991414342','ASheCILQwQgQxpDf2AM');
}
else if (/digikey\.com\.co$/i.test(dom)){
  AssignGT(b,'52','CO','en','AFIL','USD');
//  b['adwords_remarketing_id'] = '991414342';
  SetUniversalAdWord(b,'991414342','ASheCILQwQgQxpDf2AM');
}
else if (/digikey\.cr$/i.test(dom)){
  AssignGT(b,'52','CR','en','AFIL','USD');
//  b['adwords_remarketing_id'] = '991414342';
  SetUniversalAdWord(b,'991414342','ASheCILQwQgQxpDf2AM');
}
else if (/digikey\.com\.cy$/i.test(dom)){
  AssignGT(b,'52','CY','en','AFIL','USD');
//  b['adwords_remarketing_id'] = '991414342';
  SetUniversalAdWord(b,'991414342','ASheCILQwQgQxpDf2AM');
}
else if (/digikey\.do$/i.test(dom)){
  AssignGT(b,'52','DO','en','AFIL','USD');
//  b['adwords_remarketing_id'] = '991414342';
  SetUniversalAdWord(b,'991414342','ASheCILQwQgQxpDf2AM');
}
else if (/digikey\.ec$/i.test(dom)){
  AssignGT(b,'52','EC','en','AFIL','USD');
//  b['adwords_remarketing_id'] = '991414342';
  SetUniversalAdWord(b,'991414342','ASheCILQwQgQxpDf2AM');
}
else if (/digikey\.com\.eg$/i.test(dom)){
  AssignGT(b,'52','EG','en','AFIL','USD');
//  b['adwords_remarketing_id'] = '991414342';
  SetUniversalAdWord(b,'991414342','ASheCILQwQgQxpDf2AM');
}
else if (/digikey\.com\.gt$/i.test(dom)){
  AssignGT(b,'52','GT','en','AFIL','USD');
//  b['adwords_remarketing_id'] = '991414342';
  SetUniversalAdWord(b,'991414342','ASheCILQwQgQxpDf2AM');
}
else if (/hr\.digikey\.com$/i.test(dom)){
  AssignGT(b,'52','HR','en','AFIL','USD');
//  b['adwords_remarketing_id'] = '991414342';
  SetUniversalAdWord(b,'991414342','ASheCILQwQgQxpDf2AM');
}
else if (/digikey\.co\.id$/i.test(dom)){
  AssignGT(b,'52','ID','en','AFIL','USD');
//  b['adwords_remarketing_id'] = '991414342';
  SetUniversalAdWord(b,'991414342','ASheCILQwQgQxpDf2AM');
}
else if (/digikey\.is$/i.test(dom)){
  AssignGT(b,'52','IS','en','AFIL','USD');
// b['adwords_remarketing_id'] = '991414342';
  SetUniversalAdWord(b,'991414342','ASheCILQwQgQxpDf2AM');
}
else if (/digikey\.com\.jm$/i.test(dom)){
  AssignGT(b,'52','JM','en','AFIL','USD');
//  b['adwords_remarketing_id'] = '991414342';
  SetUniversalAdWord(b,'991414342','ASheCILQwQgQxpDf2AM');
}
else if (/digikey\.com\.lb$/i.test(dom)){
  AssignGT(b,'52','LB','en','AFIL','USD');
//  b['adwords_remarketing_id'] = '991414342';
  SetUniversalAdWord(b,'991414342','ASheCILQwQgQxpDf2AM');
}
else if (/digikey\.lk$/i.test(dom)){
  AssignGT(b,'52','LK','en','AFIL','USD');
//  b['adwords_remarketing_id'] = '991414342';
  SetUniversalAdWord(b,'991414342','ASheCILQwQgQxpDf2AM');
}
else if (/digikey\.ma$/i.test(dom)){
  AssignGT(b,'52','MA','en','AFIL','USD');
//  b['adwords_remarketing_id'] = '991414342';
  SetUniversalAdWord(b,'991414342','ASheCILQwQgQxpDf2AM');
}
else if (/digikey\.md$/i.test(dom)){
  AssignGT(b,'52','MD','en','AFIL','USD');
//  b['adwords_remarketing_id'] = '991414342';
  SetUniversalAdWord(b,'991414342','ASheCILQwQgQxpDf2AM');
}
else if (/digikey\.com\.mk$/i.test(dom)){
  AssignGT(b,'52','MK','en','AFIL','USD');
//  b['adwords_remarketing_id'] = '991414342';
  SetUniversalAdWord(b,'991414342','ASheCILQwQgQxpDf2AM');
}
else if (/digikey\.com\.pa$/i.test(dom)){
  AssignGT(b,'52','PA','en','AFIL','USD');
//  b['adwords_remarketing_id'] = '991414342';
  SetUniversalAdWord(b,'991414342','ASheCILQwQgQxpDf2AM');
}
else if (/digikey\.pe$/i.test(dom)){
  AssignGT(b,'52','PE','en','AFIL','USD');
//  b['adwords_remarketing_id'] = '991414342';
  SetUniversalAdWord(b,'991414342','ASheCILQwQgQxpDf2AM');
}
else if (/digikey\.ph$/i.test(dom)){
  AssignGT(b,'59','PH','en','APAC','PHP');
//  b['adwords_remarketing_id'] = '991414342';
  SetUniversalAdWord(b,'779924707','4QzHCJr46ZMBEOPp8vMC');
  b.marin_client_id = '27490paf64099';
}
else if (/digikey\.pk$/i.test(dom)){
  AssignGT(b,'52','PK','en','AFIL','USD');
//  b['adwords_remarketing_id'] = '991414342';
  SetUniversalAdWord(b,'991414342','ASheCILQwQgQxpDf2AM');
}
else if (/digikey\.pr$/i.test(dom)){
  AssignGT(b,'52','PR','en','AFIL','USD');
//  b['adwords_remarketing_id'] = '991414342';
  SetUniversalAdWord(b,'991414342','ASheCILQwQgQxpDf2AM');
}
else if (/digikey\.ru$/i.test(dom)){
  AssignGT(b,'52','RU','en','AFIL','USD');
//  b['adwords_remarketing_id'] = '991414342';
  SetUniversalAdWord(b,'991414342','ASheCILQwQgQxpDf2AM');
}
else if (/digikey\.rs$/i.test(dom)){
  AssignGT(b,'52','RS','en','AFIL','USD');
//  b['adwords_remarketing_id'] = '991414342';
  SetUniversalAdWord(b,'991414342','ASheCILQwQgQxpDf2AM');
}
else if (/digikey\.co\.th$/i.test(dom)){
  AssignGT(b,'60','TH','en','APAC','THB');
//  b['adwords_remarketing_id'] = '991414342';
  SetUniversalAdWord(b,'779926364','CmZzCOD-75MBENz28vMC');
  b.marin_client_id = '27490job64063';
}
else if (/digikey\.tn$/i.test(dom)){
  AssignGT(b,'52','TN','en','AFIL','USD');
//  b['adwords_remarketing_id'] = '991414342';
  SetUniversalAdWord(b,'991414342','ASheCILQwQgQxpDf2AM');
}
else if (/digikey\.com\.br$/i.test(dom)){
  AssignGT(b,'52','BR','en','AFIL','USD');
//  b['adwords_remarketing_id'] = '966440419';
  SetUniversalAdWord(b,'966440419','XhcYCJ3ckgwQ4-vqzAM');
  b.marin_client_id = '27490ey344847';
}
else if (/digikey\.com\.tr$/i.test(dom)){
  AssignGT(b,'52','TR','tr','AFIL','USD');
//  b['adwords_remarketing_id'] = '969770396';
  SetUniversalAdWord(b,'991414342','ASheCILQwQgQxpDf2AM');
  b.marin_client_id = '27490d6344868';
}
else if (/digikey\.com\.ua$/i.test(dom)){
  AssignGT(b,'52','UA','en','AFIL','USD');
//  b['adwords_remarketing_id'] = '991414342';
  SetUniversalAdWord(b,'991414342','ASheCILQwQgQxpDf2AM');
}
else if (/digikey\.com\.uy$/i.test(dom)){
  AssignGT(b,'52','UY','en','AFIL','USD');
//  b['adwords_remarketing_id'] = '991414342';
  SetUniversalAdWord(b,'991414342','ASheCILQwQgQxpDf2AM');
}
else if (/digikey\.com\.ve$/i.test(dom)){
  AssignGT(b,'52','VE','en','AFIL','USD');
//  b['adwords_remarketing_id'] = '991414342';
}
else if (/digikey\.vn$/i.test(dom)){
  AssignGT(b,'52','VN','en','AFIL','USD');
//  b['adwords_remarketing_id'] = '991414342';
  SetUniversalAdWord(b,'991414342','ASheCILQwQgQxpDf2AM');
}
else if (/digikey\.co\.za$/i.test(dom)){
  AssignGT(b,'50','ZA','en','EMEA','ZAR');
//  b['adwords_remarketing_id'] = 'AW-958453091';
  SetUniversalAdWord(b,'958453091','wfZjCMbtw1cQ46qDyQM');
  b['region'] = 'EMEA';
  b.marin_client_id = '27490ns144863';
};
b['Google_tracking_name'] = 'Production';
b['google_tracking_name_sandbox'] = 'Sandbox';
b['google_tracking_name_staging'] = 'Staging';

    
} } catch(e){ utag.DB(e) }  },
function(a,b){ try{utag.runonce = utag.runonce || {};utag.runonce.ext = utag.runonce.ext || {};if(typeof utag.runonce.ext[379]=='undefined'){utag.runonce.ext[379]=1;if(1){
utag.pIds = [];
utag.pSku = [];
utag.pDesc = [];
utag.pSup = [];
utag.pQty = [];
utag.pCat = [];
utag.pSStat = [];
utag.pPrc = [];
utag.pWID = [];
utag.postLoadEvents = [];
utag.charCount = 0;

utag.dkPartActivity = function(Action, PartDescx) {
  try {
      utag.pLastOp = Action;
    
  if (typeof utag.data['google_tracking_id_sandbox'] != 'undefined' || typeof utag.data['google_tracking_id_staging'] != 'undefined') {
  utag.charCount += PartDescx.length;
  var PartDesc = JSON.parse(PartDescx);
  utag.pIds.push(PartDesc['part_id']||'(Not Set)');
  utag.pSku.push(PartDesc['pn_sku']||'(Not Set)');
  utag.pDesc.push(PartDesc['part_description']||'(Not Set)');
  utag.pSup.push(PartDesc['supplier_id']||'(Not Set)');
  utag.pQty.push(PartDesc['part_qty']||'(Not Set)');
  utag.pCat.push(PartDesc['part_category']||'(Not Set)');
  utag.pSStat.push(PartDesc['stock_status']||'(Not Set)');
  utag.pPrc.push(PartDesc['line_item_price']||'(Not Set)');
  utag.pWID.push(PartDesc['web_id']||'(Not Set)');
  
//  if (utag.pIds.length > 25) {
    if (utag.charCount > 7000) {
       utag.sendProductList();
      utag.charCount = 0;
    }
  }
  }
  catch(er) {
    utag.DB(er);
  }
}
    
utag.dkLastPart = function(tagID){
     utag.sendProductList(tagID); 
}
  
utag.sendProductList = function(tagID) {
  try {
    if (typeof utag.data['google_tracking_id_sandbox'] != 'undefined' || typeof utag.data['google_tracking_id_staging'] != 'undefined') {
     if (typeof utag.postLoadCompleted == 'undefined') {
        utag.postLoadCompleted = 0;
      }
  var data = [];
      if (typeof utag.pLastOp == 'undefined' || utag.pLastOp == "") {return};
  data['tealium_event'] = utag.pLastOp;
  
  if (typeof data['tealium_event'] != 'undefined') {
    data['part_id_a'] = utag.pIds;
    data['part_sku_a'] = utag.pSku;
    data['part_description_a'] = utag.pDesc;
    data['supplier_id_a'] = utag.pSup;
    data['part_qty_a'] = utag.pQty;
    data['part_category_a'] = utag.pCat;
    data['stock_status_a'] = utag.pSStat;
    data['line_item_price_a'] = utag.pPrc;
    data['web_id_a'] = utag.pWID;
    switch (data['tealium_event']) {
      case 'cart_add':
	utag.dkStdVars(data);
	data['ref_page_event'] = 'Post Parts Added to Cart';
	data['not_a_pageview'] = '1';
	utag.link(data,null,tagID);
	break;
      case 'remove_part':
	utag.dkStdVars(data);
	data['ref_page_event'] = 'Post Parts Removed from Cart';
	data['not_a_pageview'] = '1';
	utag.link(data,null,tagID);
	break;
      case 'checkout':
	utag.dkStdVars(data);
	data['ref_page_event'] = 'Post Parts Checked Out Cart';
	data['not_a_pageview'] = '1';
	utag.link(data,null,tagID);
	break;
      case 'purchase':
	utag.dkStdVars(data);
	data['ref_page_event'] = 'Post Purchased Part';
	data['not_a_pageview'] = '1';
	data['order_id'] = utag.data['order_id'];
	utag.link(data,null,tagID);
	break;
      case 'product_view':
	// Do nothing.  Let the pageview handle it.
	break;
      }
  
    utag.DB('Send Part Data');
    utag.pIds = [];
    utag.pSku = [];
    utag.pDesc = [];
    utag.pSup = [];
    utag.pQty = [];
    utag.pCat = [];
    utag.pSStat = [];
    utag.pPrc = [];
    utag.pWID = [];
  }
//  } else {
      utag.dkTrk('379.3');
//      switch (utag.pLastOp) {
//      case 'cart_add':
//	utag.dkLink('ref_page_event=Add Part');
//	break;
//      case 'checkout':
//        if (utag.pLastOp === 'checkout'){
//            utag.dkCookie('ref_page_event=Click Checkout');
//            utag.dkLink('ref_page_event=Checkout Event;google_action=checkout;checkout_step=1');
//	break;
//        }
       
    }
 
} catch(er) {
  utag.DB(er);
}
}

}}} catch(e){ utag.DB(e) }  },
function(a,b){ try{utag.runonce = utag.runonce || {};utag.runonce.ext = utag.runonce.ext || {};if(typeof utag.runonce.ext[380]=='undefined'){utag.runonce.ext[380]=1;if(1){
// Remove when new cookie tracking goes into Production

utag.fixSubmitOrder = function() {
    utag.data["ExtRun"] = utag.dkTrk('380');
    utag.dkCookie('ref_page_event=Submit Order');
    };

// first define a function that will do the work that we want done. It requires 5 parameters.  For the Events from 
//cookies Global extension, it is everything after the JQuery selector.  The first parameter is the event.

utag.dkConvertCookiesToEvents = function(e, b, c, d, a) {
    // remove when new cookies go into PROD
    e = e || window.e;
    var target = e.target || e.srcElement;
    if (utag.data.page_type==='SC' && utag.data.page_sub_type === 'POR' && utag.data.page_id === 'POR') {
        if (target.id === 'primaryButton') {
            data['ExtRun']='380.1';
            utag.fixSubmitOrder();
        }
    }
//    var hrf;
//    while (target) {
//         if (target instanceof HTMLAnchorElement) {
//         hrf = target.getAttribute('href');
//         break;
//         }
//    target = target.parentNode;
//    }

//    if (typeof hrf != 'undefined' && hrf != null && hrf.substring(0, 1) != '/'//!(hrf.startsWith("/")) 
//         && hrf.indexOf(".digikey.") <= 0) {
//         var parent = e.target;
//         var data = {};
//         while (parent) {
//         if (parent.getAttribute('track-data')) {
//                break;
               // exits  the while loop. 
//          }
//          attr = parent.getAttribute('cookie-tracking');
//          if (attr != null && (attr.indexOf('ref_page_event') >= 0 || attr.indexOf('header_flag') >= 0)) {
//               var kvs = attr.split(';');
//               for (var i = 0; i < kvs.length; i++) {
//                     var pair = kvs[i].split('=');
//                     data[pair[0]] = pair[1];
//                     }
//               data["ExtRun"] = utag.dkTrk('380');
//               utag.dklink(data);
//                break;
//                }
//            parent = parent.parentElement;
//            }
//     }
 }

// Use Tealium's EV method to register the event in the Event Handler based on non-JQuery selector.
utag.loader.EV(document,'click',utag.dkConvertCookiesToEvents);
}}} catch(e){ utag.DB(e) }  },
function(a,b){ try{ if(1){
utag.dkSetConsentValues = function(consentStatus) {
    if (consentStatus === 'noConsent') {
        b.do_not_track_for_consent = utag.data.do_not_track_for_consent = 'yes';
        window.utag_cfg_ovrd.noview = true;
        window.utag_cfg_ovrd.nocookie=true;
        utag.cfg.noview = true;
        window['ga-disable-'+utag.data.google_tracking_id1] = true;
    } else {
        b.do_not_track_for_consent = utag.data.do_not_track_for_consent = 'no';
        window.utag_cfg_ovrd.noview = false;
        window.utag_cfg_ovrd.nocookie=false;
        utag.cfg.noview = false;
        window['ga-disable-'+utag.data.google_tracking_id1] = false;
    }
}

utag.dkSetConsentValues('noConsent');
utag.utag_data_at_pageLoad = {};
for (var i in utag_data) {
    utag.utag_data_at_pageLoad[i] = utag_data[i];
    }
if (window.localStorage.getItem('gdpr_cookie_consent') !== null) {
    utag.dkSetConsentValues('Consented');
} else if (typeof utag.data['ccookie'] != 'undefined') {
    window.localStorage.setItem('gdpr_cookie_consent',JSON.stringify({ "acceptedOn":utag.data['ccookie']}));
    utag.dkSetConsentValues('Consented');
}
} } catch(e){ utag.DB(e) }  },
function(a,b){ try{ if(1){
if (b.kenshoo_id === '6216') {
    if (b.page_type === 'SC' && b.page_sub_type === 'CO' && b.ref_page_event === 'Add to Cart') {
        b.Kenshoo_conversion_type = 'add_to_cart';
    } else if (b['dom.pathname'] === '/ordering/OrderWorkflow' && b['dom.referrer'].indexOf('ShoppingCartView')) {
        b.Kenshoo_conversion_type = 'purchase_button_click';
    } else if ((b.page_type === 'MDK' && b['dom.query_string'].indexOf('newRegistration') > -1) || (b.page_sub_type === 'NR' && b.ref_page_event === 'Submit Registration')) {
        b.Kenshoo_conversion_type = 'registration';
    } else if ((b.page_type === 'MDK' && b.ref_page_event === 'Complete Registration')|| (b.ref_page_event === 'Continue Registration')) {
        b.Kenshoo_conversion_type = 'create_account';
    }
}
} } catch(e){ utag.DB(e) }  },
function(a,b,c,d){
  b._ccity='';
  b._ccountry='';
  b._ccurrency=(typeof b['order_currency']!='undefined')?b['order_currency']:'';
  b._ccustid='';
  b._corder=(typeof b['order_id']!='undefined')?b['order_id']:'';
  b._cpromo='';
  b._cship='';
  b._cstate='';
  b._cstore='';
  b._csubtotal=(typeof b['order_subtotal']!='undefined')?b['order_subtotal']:'';
  b._ctax='';
  b._ctotal=(typeof b['order_subtotal']!='undefined')?b['order_subtotal']:'';
  b._ctype='';
  b._czip='';
  b._cprod=(typeof b['product_number']!='undefined'&&b['product_number'].length>0)?b['product_number']:[];
  b._cprodname=[];
  b._cbrand=[];
  b._ccat=[];
  b._ccat2=[];
  b._cquan=(typeof b['product_quantities']!='undefined'&&b['product_quantities'].length>0)?b['product_quantities']:[];
  b._cprice=(typeof b['product_price']!='undefined'&&b['product_price'].length>0)?b['product_price']:[];
  b._csku=(typeof b['product_sku']!='undefined'&&b['product_sku'].length>0)?b['product_sku']:[];
  b._cpdisc=[];
  if(b._cprod.length==0){b._cprod=b._csku.slice()};
  if(b._cprodname.length==0){b._cprodname=b._csku.slice()};
  function tf(a){if(a=='' || isNaN(parseFloat(a))){return a}else{return (parseFloat(a)).toFixed(2)}};
  b._ctotal=tf(b._ctotal);b._csubtotal=tf(b._csubtotal);b._ctax=tf(b._ctax);b._cship=tf(b._cship);for(c=0;c<b._cprice.length;c++){b._cprice[c]=tf(b._cprice[c])};for(c=0;c<b._cpdisc.length;c++){b._cpdisc[c]=tf(b._cpdisc[c])};
},
function(a,b){ try{ if(1){
// Standard Variable Corrections - 361

try {
   b['tealium_visitorid'] = utag_data['tealium_visitor_id'];
   b['tealium_visitid'] = utag_data['tealium_session_id'];
} catch(e) {
   utag.DB(e);
}

if (typeof b['part_search_term'] != 'undefined') {
  b['part_search_term'].toLowerCase();
  }
if (typeof b['part_search_term_ext'] != 'undefined') {
    b["ExtRun"] = utag.dkTrk('361.1')
    b['part_search_term_ext'].toLowerCase();
    
}

if (typeof b['page_language'] != 'undefined' && b['page_language'].toLowerCase() == 'zh') {
    if (typeof b['page_site'] != 'undefined') {
        switch (b['page_site'].toLowerCase()) {
           case 'hk':
           case 'tw':
		b['page_language'] = 'zht';
                break;
           case 'cn':
           case 'sg':
           case 'zz':
                b['page_language'] = 'zhs';
                break;
         }
    }
    b["ExtRun"] = utag.dkTrk('361.3')
}
} } catch(e){ utag.DB(e) }  },
function(a,b){ try{ if(1){b['currency_Always_USD']='USD'} } catch(e){ utag.DB(e) }  },
function(a,b){ try{ if(1){
utag.fixCookieHomepageRedbar = function(a, b, c, d, e) {
  var element = a.target, counter = 0,hrefx="";
  while (element && counter < 5) {
    if (element.getAttribute('href') == '/panda/en/'){
      element.getAttribute('href');
      utag.dkTrk('405.1');
      utag.dkCookie("ref_page_event=Price Availability");
      break;
    }
    element = element.parentElement; 
    counter++;
  }
}

if (b.page_type==='HP' && b.page_sub_type==='HP') {
    elementx = document.getElementById('banner__redbar');
      if (elementx !== null) {
	  utag.loader.EV(elementx,'click',utag.fixCookieHomepageRedbar);
      }
}

} } catch(e){ utag.DB(e) }  },
function(a,b){ try{ if(1){
if (typeof utag.data.st_campaign !== 'undefined' && typeof utag.data.st_campaign_supplier_id !== 'undefined') {
    if (b['event_category']==='Personalization' && (b['personalization_creative'] === 'Prioritized Search Results'
        || b['personalization_creative'] === 'Search Results prioritized for STMicro')) {
        b.personalization_program = 'Supplier Cookies - '+utag.data.st_campaign_supplier_name;
        b.personalization_creative = 'Prioritized Search Results - '+utag.data.st_campaign_supplier_name;
        if (b['ref_page_event'] == 'Click' || b['ref_page_event'] == 'Select Part' 
            || b['ref_page_event'] == "Substitute-Also Eval"){
            b["ExtRun"] = utag.dkTrk('410.1');
            if (typeof utag.data.st_campaign_supplier_name != 'undefined' && utag.data.st_campaign_supplier_name.length > 0){
                if (utag.data.st_campaign_supplier_id == b.ref_supplier_id){
                    b['ref_page_event'] = 'Click - '+utag.data.st_campaign_supplier_name+' Part';
                } else {
                    b['ref_page_event'] = 'Click - Not '+utag.data.st_campaign_supplier_name+' Part';
                }
            }
        } else if (b['ref_page_event'] == 'Impression' && b['personalization_vendor'] == '1') {
            b['ref_page_event'] = 'Impression - '+utag.data.st_campaign_supplier_name+' Parts in Result';
            b["ExtRun"] = utag.dkTrk('410.2');
        } else {
            b['ref_page_event'] = 'Impression - '+utag.data.st_campaign_supplier_name+' Parts not in Result';
            b["ExtRun"] = utag.dkTrk('410.3');
        }
    } else if(b['event_category'] === 'Personalization' && b['personalization_creative'] === 'Weighted Recommendation List') {
        b.personalization_program = 'Supplier Cookies - '+utag.data.st_campaign_supplier_name;
        b.personalization_creative = 'Weighted Recomendation List - '+utag.data.st_campaign_supplier_name; 
        if (b.ref_page_event === 'Click') {
            if (utag.data.supplier_id == utag.data.st_campaign_supplier_id) {
                b.ref_page_event = 'Click - '+utag.data.st_campaign_supplier_name+' Part';
            } else if (b.ref_page_event === 'Click') {
                b.ref_page_event = 'Click - not '+utag.data.st_campaign_supplier_name+' Part';
            }
        }
    }
    
}


} } catch(e){ utag.DB(e) }  },
function(a,b){ try{ if(1){
utag.CookieOrLink = function(hrf) {
if ((typeof hrf != 'undefined' && hrf != null && hrf.substring(0, 1) != '/' && hrf.indexOf(".digikey.") <= 0) 
 || (typeof hrf != 'undefined' && hrf != null && hrf.indexOf("api-portal.digikey.") > 0)) {
    // need to handle this case: 'https://facebook.com/sharer/sharer.php?u=https://digikeytest.digikey.com/short/24jmw'
    // if hrf is blank, treat as cookie
         utag.dkTrk('429.1');
         return 'Link';
    }
        else return 'Cookie';
        utag.dkTrk('429.2');
}
} } catch(e){ utag.DB(e) }  },
function(a,b){ try{ if(1){
if (typeof b.order_id_on_confirmation_page != 'undefined') linkedin_conversion_id = '956649';
} } catch(e){ utag.DB(e) }  },
function(a,b){ try{ if(1){
// Clean up After Tags - 370
utag.data['ExtRun'] = "";
utag.data['ExtDln'] = "";
utag.data['ref_page_category'] = "";
} } catch(e){ utag.DB(e) }  },
function(a,b){ try{utag.runonce = utag.runonce || {};utag.runonce.ext = utag.runonce.ext || {};if(typeof utag.runonce.ext[394]=='undefined'){utag.runonce.ext[394]=1;if(1){
utag.dkAutoTag = function(a, b, c, d, e) {
  var e1 = a.target;
  var a1 = e1.tagName.toLowerCase();
  var counter = 0;
  var href = "";
  var htmlElements = [];
  var elementPointer = 0;
  while (elementPointer < 5 && counter < 8) {
      if (a1 == 'a' || a1 == 'div'|| a1 == 'li' || a1 == 'ul') {
          if ((e1.id !== null  && e1.id !== "") || (e1.className !== null && e1.className !== "")) {
             htmlElements[elementPointer] = e1.id || e1.className;
             elementPointer++;
          }
      }
      if (href === "" && e1.hasAttribute('href')) href = e1.getAttribute('href');
      e1 = e1.parentElement;
      if (e1 === null) break;
      a1 = e1.tagName.toLowerCase();
      counter++;
  }
  if (htmlElements.length > 0 && href !== "") {
      utag.data.htmlElement1 = htmlElements[0];
      utag.data.htmlElement2 = htmlElements[1] || "(not set)";
      utag.data.htmlElement3 = htmlElements[2] || "(not set)";
      utag.data.htmlElement4 = htmlElements[3] || "(not set)";
      utag.data.htmlElement5 = htmlElements[4] || "(not set)"
      utag.dkCookie("html_element1="+utag.data.htmlElement1+",html_element2="+utag.data.htmlElement2+",html_element3="+utag.data.htmlElement3+",html_element4="+utag.data.htmlElement4
      +",html_element5="+utag.data.htmlElement5);
    }
};
  
if (utag.data.page_type === 'MK' ||
    (utag.data['dom.pathname'].indexOf('/resources/local-support')>-1 && utag.data.page_type === 'RE')) {
    utag.loader.EV(document,'click',utag.dkAutoTag);
} 
}}} catch(e){ utag.DB(e) }  },
function(a,b){ try{utag.runonce = utag.runonce || {};utag.runonce.ext = utag.runonce.ext || {};if(typeof utag.runonce.ext[403]=='undefined'){utag.runonce.ext[403]=1;if(1){

utag.personalizationTag = function(a, b, c, d, e) {
    try {
  var element = a.target, counter = 0;
  while (element && counter < 5) {
    if (element.hasAttribute('href')){
      utag.dkTrk('403.4');
      utag.dkLink("event_category=Personalization;ref_page_event=Supplier Promo Click;personalization_program=Supplier Cookies - "+utag.data.st_campaign_supplier_name+";personalization_creative=Homepage Tile Ad");
      break;
    }
    element = element.parentElement; 
    counter++;
  }
    }
  catch(e) {
      utag.DB(e);
  }
}

utag.personalizationTagSP = function(a, b, c, d, e) {
    try {
  var element = a.target, counter = 0;
  while (element && counter < 5) {
    if (element.hasAttribute('href')){
      utag.dkTrk('403.5');
      utag.dkLink("event_category=Personalization;ref_page_event=Supplier Promo Click;personalization_program=Supplier Cookies - "+utag.data.st_campaign_supplier_name+";personalization_creative=Product Search - Skyscraper");
      break;
    }
    element = element.parentElement; 
    counter++;
  }
    } catch(e) {
        utag.DB(e);
    }
}

var elmts;

if (typeof utag.data.st_campaign !== 'undefined' && typeof utag.data.st_campaign_supplier_id !== 'undefined') {
    if (b.page_type==='HP' && b.page_sub_type==='HP') {
    elmts = document.getElementById('featured__ST')||document.getElementById('kemet');
    if (typeof elmts != 'undefined' && elmts !== null) {
        utag.dkTrk('403.1');
        utag.dkLink("event_category=Personalization;ref_page_event=Impression;personalization_program=Supplier Cookies - "+utag.data.st_campaign_supplier_name+";personalization_creative=Homepage Tile Ad");
        utag.loader.EV(elmts,'click',utag.personalizationTag);
    }
    } else if (b.page_type==='PS' && (b.page_sub_type==='CAT' || b.page_sub_type === 'FAM')) {
        var mxloops = 0,nds;
        elmts = document.getElementById('rightAds');
        if (typeof elmts != 'undefined' && elmts !== null) {
            while ((nds=elmts.firstElementChild) !== null && mxloops < 5) {
                if (nds.tagName.toLowerCase() === 'img' && (nds.src.indexOf('STMicro')>=0||nds.src.indexOf('KEMET')>=0)) {
                    utag.dkTrk('403.2');
                    utag.dkLink("event_category=Personalization;ref_page_event=Impression;personalization_program=Supplier Cookies - "+utag.data.st_campaign_supplier_name+";personalization_creative=Product Search - Skyscraper");
                    utag.loader.EV(elmts,'click',utag.personalizationTagSP);
                }
             elmts = nds;
             mxloops++;
            }
        }
    }
}


}
}} catch(e){ utag.DB(e) }  },
function(a,b){ try{ if(1){
var cookie = document.cookie.match('cur'+'=([^;]*)');
if (cookie !== null && typeof cookie[1] != 'undefined') {
    b.order_currency = cookie[1];
} 

} } catch(e){ utag.DB(e) }  },
function(a,b){ try{ if(1){
utag.fixUpSuppliers = function(data,sElements)  {
    
    if (typeof sElements['Link to Newest Products'] !== 'undefined') {
        data.ref_page_event = 'Link to Newest Products';
    }
};
} } catch(e){ utag.DB(e) }  },
function(a,b){ try{utag.runonce = utag.runonce || {};utag.runonce.ext = utag.runonce.ext || {};if(typeof utag.runonce.ext[447]=='undefined'){utag.runonce.ext[447]=1;if(1){

// The following will need to be before processing the load rules
//try {
//    if (utag.data.do_not_track_for_consent === 'yes') {
//        utag.data['IPdata'] = {};
//        var xhttp = new XMLHttpRequest();
//        xhttp.onreadystatechange = function() {
//            try {
//                if (this.readyState == 4 && this.status == 200) {
//                    utag.IPData = JSON.parse(xhttp.responseText);
//                } 
//            } catch (e) {
//                var a = 1;
//            }
//        };
//        xhttp.open("GET", "https://api.muctool.de/whois", true);
//        xhttp.send();
//    }
//} catch (e) {
//    var a = 1;
//}


// The following will need to be run after the user has given consent.
utag.dkCollectConsentData = function(gdpr,tags) {
    utag.consentData = {
        "consentDate" : "",
        "expirationDate" : "",
        "digiKeyApplication" : "digikey.com",
        "consentVersion" : "ver 1.0",
        "typeOfConsent" : "Cookie"
    };
    
//    tags['ipAddress'] = utag.IPData['ip'];
    
    utag.consentData['consentDate'] = gdpr.acceptedOn;
    var jDate = new Date(gdpr.acceptedOn);
    var year = jDate.getFullYear();
    var month = jDate.getMonth();
    var date = jDate.getDate();
    
    utag.consentData['expirationDate'] = new Date(jDate.getFullYear()+1,jDate.getMonth(),jDate.getDate());
    tags['consentData'] = JSON.stringify(utag.consentData);
};
}
}} catch(e){ utag.DB(e) }  },
function(a,b){ try{ if(1){
utag.evergagePersonalization = function(data,sElements){
    var perData = {}, id=sElements['Evergage Click'].id;
    perData.evergageID = id.substr(-5);    
    perData.ref_page_event = "Supplier Promo Click";
    perData.event_category = 'Personalization';
    perData.personalization_program = '(Evergage - Not Defined)';
    perData.personalization_creative = '(Evergage - Not Defined)';
    utag.dklink(perData);
}
} } catch(e){ utag.DB(e) }  }];
  utag.handler.cfg_extend=[{"id":"398","alr":0,"bwq":0,"blr":1,"end":0},{"end":0,"blr":1,"bwq":0,"alr":0,"id":"356"},{"alr":0,"id":"331","bwq":0,"blr":1,"end":0},{"blr":1,"end":0,"alr":0,"id":"357","bwq":0},{"blr":1,"end":0,"alr":0,"id":"300","bwq":0},{"blr":1,"end":0,"id":"239","alr":0,"bwq":0},{"end":0,"blr":1,"bwq":0,"alr":0,"id":"379"},{"alr":0,"id":"380","bwq":0,"blr":1,"end":0},{"blr":1,"end":0,"alr":0,"id":"421","bwq":0},{"blr":1,"end":0,"id":"423","alr":0,"bwq":0},{"end":0,"blr":0,"bwq":0,"alr":1,"id":"3"},{"id":"361","alr":1,"bwq":0,"blr":0,"end":0},{"end":0,"blr":0,"bwq":0,"alr":1,"id":"397"},{"id":"405","alr":1,"bwq":0,"blr":0,"end":0},{"end":0,"blr":0,"bwq":0,"alr":1,"id":"410"},{"id":"429","alr":1,"bwq":0,"blr":0,"end":0},{"end":0,"blr":0,"bwq":0,"alr":1,"id":"433"},{"alr":0,"id":"370","bwq":0,"blr":0,"end":1},{"blr":0,"end":1,"id":"394","alr":0,"bwq":0},{"end":1,"blr":0,"bwq":0,"id":"403","alr":0},{"bwq":0,"alr":1,"id":"439","end":0,"blr":0},{"alr":1,"id":"445","bwq":0,"blr":0,"end":0},{"blr":1,"end":0,"id":"447","alr":0,"bwq":0},{"end":0,"blr":0,"bwq":0,"id":"448","alr":1}];
  utag.loader.initcfg = function(){
    utag.loader.cfg={"304":{load:1,send:1,v:201805151502,wait:0,tid:20067},"4":{load:(utag.cond[136] && utag.cond[2]),send:1,v:201904081403,wait:1,tid:4001},"172":{load:(utag.cond[63] && utag.cond[136]),send:1,v:201904081403,wait:1,tid:20078},"192":{load:(utag.cond[67] && utag.cond[136]),send:1,v:201904081403,wait:1,tid:11003},"204":{load:(utag.cond[136] && utag.cond[97] && utag.cond[2]),send:1,v:201904081403,wait:1,tid:6026},"207":{load:(utag.cond[79] && utag.cond[136] && utag.cond[2]),send:1,v:201904081403,wait:1,tid:7117},"208":{load:(utag.cond[80] && utag.cond[136] && utag.cond[2]),send:1,v:201904081403,wait:1,tid:7117},"214":{load:(utag.cond[136] && utag.cond[82]),send:1,v:201904081403,wait:1,tid:7001},"211":{load:(utag.cond[132] && utag.cond[90]),send:1,v:201906212008,wait:1,tid:7110},"265":{load:(utag.cond[136] && utag.cond[95] && utag.cond[127] && utag.cond[8]),send:1,v:201904081403,wait:1,tid:13002},"266":{load:(utag.cond[136] && utag.cond[127] && utag.cond[2]),send:1,v:201906121532,wait:1,tid:13002},"267":{load:(utag.cond[118] && utag.cond[131] && utag.cond[101]),send:1,v:201906192044,wait:1,tid:7110},"268":{load:(utag.cond[136] && utag.cond[97] && utag.cond[98]),send:1,v:201904081403,wait:1,tid:6026},"269":{load:(utag.cond[91] && utag.cond[118]),send:1,v:201906261618,wait:1,tid:7110},"272":{load:(utag.cond[136] && utag.cond[23]),send:1,v:201904081403,wait:1,tid:25019},"274":{load:(utag.cond[136] && utag.cond[27]),send:1,v:201904081403,wait:1,tid:20067},"279":{load:utag.cond[106],send:1,v:201806131506,wait:1,tid:20067},"287":{load:(utag.cond[136] && utag.cond[105] && utag.cond[98]),send:1,v:201904081403,wait:1,tid:4001},"288":{load:1,send:1,v:201801010024,wait:1,tid:20010},"299":{load:(utag.cond[115] && utag.cond[114] && utag.cond[2]),send:1,v:201905220244,wait:1,tid:15022},"301":{load:(utag.cond[136] && utag.cond[116] && utag.cond[43]),send:1,v:201904081403,wait:1,tid:20078},"303":{load:(utag.cond[136] && utag.cond[117]),send:1,v:201904081403,wait:1,tid:3158},"307":{load:(utag.cond[136] && utag.cond[120]),send:1,v:201904081403,wait:1,tid:20067},"312":{load:(utag.cond[121] && utag.cond[136] && utag.cond[2]),send:1,v:201905220244,wait:1,tid:2045},"313":{load:(utag.cond[121] && utag.cond[136] && utag.cond[8]),send:1,v:201905220244,wait:1,tid:2045},"316":{load:(utag.cond[136] && utag.cond[8] && utag.cond[126]),send:1,v:201905220244,wait:1,tid:7132},"321":{load:(utag.cond[136] && utag.cond[2] && utag.cond[126]),send:1,v:201905220244,wait:1,tid:7132},"335":{load:(utag.cond[79] && utag.cond[136] && utag.cond[135] && utag.cond[8]),send:1,v:201904081403,wait:1,tid:11003},"336":{load:utag.cond[136],send:1,v:201905011912,wait:1,tid:12047},"337":{load:(utag.cond[91] && utag.cond[136]),send:1,v:201905081802,wait:1,tid:17003},"338":{load:(utag.cond[137] && utag.cond[136]),send:1,v:201905081802,wait:1,tid:17003},"339":{load:(utag.cond[8] && utag.cond[27]),send:1,v:201905101910,wait:1,tid:14022},"340":{load:(utag.cond[136] && utag.cond[2] && utag.cond[27]),send:1,v:201905101910,wait:1,tid:14022},"343":{load:(utag.cond[91] && utag.cond[2] && utag.cond[27]),send:1,v:201906121532,wait:1,tid:20010}};
utag.loader.cfgsort=["304","4","172","192","204","207","208","214","211","265","266","267","268","269","272","274","279","287","288","299","301","303","307","312","313","316","321","335","336","337","338","339","340","343"];
  }
utag.loader.initcfg();
}

  if(typeof utag_cfg_ovrd!='undefined'){for(var i in utag.loader.GV(utag_cfg_ovrd))utag.cfg[i]=utag_cfg_ovrd[i]};
  utag.loader.PINIT = function(a,b,c){
    utag.DB("Pre-INIT");
    if (utag.cfg.noload) {
      return;
    }

    try {
      // Initialize utag.data
      this.GET();
      // Even if noview flag is set, we still want to load in tags and have them ready to fire
      // FUTURE: blr = "before load rules"
      if(utag.handler.RE('view',utag.data,"blr")){
        utag.handler.LR(utag.data);
      }
      
    }catch(e){utag.DB(e)};
    // process 'blocking' tags (tags that need to run first)
    a=this.cfg;
    c=0;
    for (b in this.GV(a)) {
      // external .js files (currency converter tag) are blocking
      if(a[b].block == 1 || (a[b].load>0 && (typeof a[b].src!='undefined'&&a[b].src!=''))){
        a[b].block = 1;
        c=1;
        this.bq[b]=1;
      }
    }
    if(c==1) {
      for (b in this.GV(a)) {
        if(a[b].block){
          // handle case of bundled and blocking (change 4 to 1)
          // (bundled tags that do not have a .src should really never be set to block... they just run first)
          a[b].id=b; 
          if(a[b].load==4)a[b].load=1; 
 	  a[b].cb=function(){
            var d=this.uid;
            utag.loader.cfg[d].cbf=1;
            utag.loader.LOAD(d)
          };
          this.AS(a[b]);
        }
      }
    }
    if(c==0)this.INIT();
  };
  utag.loader.INIT = function(a, b, c, d, e) {
    utag.DB('utag.loader.INIT');
    if (this.ol == 1) return -1;
    else this.ol = 1;
    // The All Tags scope extensions run after blocking tags complete
    // The noview flag means to skip these Extensions (will run later for manual utag.view call)
    if(utag.cfg.noview!=true)utag.handler.RE('view',utag.data,"alr"); 

    utag.rpt.ts['i'] = new Date();
     
    d = this.cfgsort;
    // TODO: Publish engine should sort the bundled tags first..
    for (a=0;a<d.length;a++){
      e = d[a];
      b = this.cfg[e];
      b.id = e;
      // s2s (ServerStream) tags do not load client-side
      if(b.block != 1 && b.s2s != 1){
        // do not wait if the utag.cfg.noview flag is set and the tag is bundled
        if (utag.loader.bk[b.id] || ((utag.cfg.readywait||utag.cfg.noview) && b.load==4)){
          this.f[b.id]=0;
          utag.loader.LOAD(b.id)
        }else if (b.wait == 1 && utag.loader.rf == 0) {
	  utag.DB('utag.loader.INIT: waiting ' + b.id);
          this.wq.push(b)
          this.f[b.id]=2;
        }else if (b.load>0){
	  utag.DB('utag.loader.INIT: loading ' + b.id);
	  this.lq.push(b);
          this.AS(b);
        }
      }
    }
          
    if (this.wq.length > 0) utag.loader.EV('', 'ready', function(a) {
      if(utag.loader.rf==0){
        utag.DB('READY:utag.loader.wq');
        utag.loader.rf=1;
        utag.loader.WQ();
      }
    });
    else if(this.lq.length>0)utag.loader.rf=1;
    else if(this.lq.length==0)utag.loader.END();

    return 1
  };
  utag.loader.EV('', 'ready', function(a) {if(utag.loader.efr!=1){utag.loader.efr=1;try{ try{ if(1){
utag.fixUpFamilyPage = function(data,sElements,eventType)  {
    
    if (typeof sElements['Asset'] !== 'undefined') {
        data.ref_page_event = 'Display Asset';
        data.page_title = 'Datasheet';
        data.asset_type = 'Datasheet';
        data.personalization_program = "";
        data.personalization_creative = "";
        data['ExtRun'] = utag.dkTrk('435.1');
    }
    if (typeof sElements['Help for Parts'] !== 'undefined') {
        data.ref_page_event = 'Help for Parts';
        data.personalization_program = "";
        data.personalization_creative = "";
        eventType = 'Link';
        data['ExtRun'] = utag.dkTrk('435.2');
    }
    if (typeof sElements['Select Manufacturer'] !== 'undefined') {
        data.ref_page_event = 'Select Manufacturer';
        data.personalization_program = "";
        data.personalization_creative = "";
        eventType = 'Cookie';
        data['ExtRun'] = utag.dkTrk('435.3');
    }
    if (typeof sElements['View Series'] !== 'undefined') {
        data.ref_page_event = 'View Series';
        data.personalization_program = "";
        data.personalization_creative = "";
        data['ExtRun'] = utag.dkTrk('435.4');
    }
    if (typeof sElements['Supplier Search'] !== 'undefined') {
        data.ref_page_event = 'Filter on Supplier';
        data.personalization_program = "";
        data.personalization_creative = "";
        data['ExtRun'] = utag.dkTrk('435.5');
    }
    return eventType;
};
} } catch(e){ utag.DB(e) }  }catch(e){utag.DB(e)};
try{ try{ if(1){
utag.getHeaderNavHrchy = function(data,sElements)  {
    var submenu = [];
        var text = '',identifier = '',texta = [], i = 0, results = '',delineator = '->',innrtxt = "";

    try {
    
    if (utag.data['page_language'] !== 'en') return;
    if (sElements.hasOwnProperty('Logout')) {
        data.ref_page_event = 'Log Out';
        return;
    }
    
    submenu = document.getElementsByClassName('section open');
    innrtxt = submenu[0].innerText.split('\n')[0];
    results = innrtxt.toUpperCase().trim();
    submenu = document.getElementsByClassName('item open');
    for (i = 0; i < submenu.length; i++) {
        innrtxt = submenu[i].innerText.split('\n')[0];
        results += delineator + innrtxt.trim();
    }
    if (typeof sElements['Flyout'] !== 'undefined') {
        innrtxt = sElements['Flyout'].innerText;
        results += delineator + innrtxt.trim() + ' - Flyout'; 
    }
    if (results.length > 0) {
        if (results.indexOf('HELLO') === 0) {
            results = 'MyDigiKey';
        }
        if (results === 'LOGIN OR') {
            results = 'Login or Register';
        }
        data.ref_page_category = results;
        data['ExtRun'] = utag.dkTrk('434.1');
    }
    } catch (e) {
//        data['ExtRun'] = utag.dkTrk('434.1-' + e.message);
//        var x = i ||0; var errDisp = "undefined";
//        if (typeof submenu[x].innerText !== 'undefined') {
//            errDisp = submenu[x].innerText.replace(/\n/g,'|');
//        }
//        utag.dkErrorTag(data,'434.1'+e.message,submenu[x].className + "--" + errDisp);
        utag.DB(e);
    }
};

} } catch(e){ utag.DB(e) }  }catch(e){utag.DB(e)};
try{ try{ if(1){
utag.newEventDefaultValues = function(data,linkType,href) {
    if (typeof data.referring_page_event != 'undefined') data.ref_page_event = data.referring_page_event;
    data['ref_page_type'] = data['ref_page_type'] || utag.data['page_type'];
    data['ref_page_sub_type'] = data['ref_page_sub_type'] || utag.data['page_sub_type'];
    data['ref_page_id'] = data['ref_page_id'] || utag.data['page_id'];
    try {
        var gdprStr = localStorage.getItem('gdpr_cookie_consent');
        var gdpr = JSON.parse(gdprStr);
        data['ccookie'] = gdpr.acceptedOn;
    } catch (e) {utag.DB(e);}
    
    if ("customer_id" in utag.data === true) data['ref_customer'] = utag.data['customer_id'];
    if ("part_id" in utag.data === true) data['ref_part_id'] = utag.data['part_id'];
    if ("part_sku" in utag.data === true) data['ref_pn_sku'] = utag.data['part_sku'];
    if ("supplier_id" in utag.data === true) data['ref_supplier_id'] = utag.data['supplier_id'];
    
    if (linkType == 'link') {
        data.page_type = utag.data.page_type;
        data.page_sub_type = utag.data.page_sub_type;
        data.page_id = utag.data.page_id;
        if (typeof href != 'undefined') {
            data['ext_host'] = href.substring(href.indexOf('//')+2,href.indexOf('/',10));
            data['ext_uri'] = href.substr(href.indexOf('/',10));
        }
    }
}

utag.dkCookieImpl = function(dataObj){
    if (typeof dataObj === 'object') {
        var tag = "",del="";
        if (typeof utag.newEventDefaultValues === 'function') utag.newEventDefaultValues(dataObj,'cookie');
        for (var i in dataObj) {
            dataObj[i] = dataObj[i].replace(/,/g,'@@');
            tag += del+i+'='+decodeURIComponent(dataObj[i]);
            del = ",";
        }
        tag += ',ExtRun=' + decodeURIComponent(utag.dkTrk("357.5"));
        var now = new Date();
        var time = now.getTime();
        time += 600 * 1000;
        now.setTime(time);
        var enctag = encodeURIComponent(tag);
        document.cookie = "utm_data_x="+enctag +";path=/;expires="+now.toUTCString()+";domain="+utag.cfg.domainForCookies+";";
        if (typeof b !== 'undefined') b['cp.utm_data_x'] = utag.data['cp.utm_data_x'] = enctag;
        utag.DB('Write utm_data_x');
        utag.DB(tag);
    }
}

utag.newCookie = function (a) {
    try {
        utag.dkTrk("428.1")
        utag.dkCookieImpl(a)
    } catch (e) {
        utag.DB(e);
    }
}

utag.dkCookie = function (a) {
  try {
    if (a.indexOf("Initiate Search")>=0) return;
    var utagData = utag.dkParseStringtoDataObj(a);
    utag.dkTrk('428.2');
    utag.dkCookieImpl(utagData);
    utag.data.prorityCookie = true;
} catch (e) {
  utag.DB(e);
}
  }
  
utag.dkISCookie = function (a) {
    try {
        var utagData = utag.dkParseStringtoDataObj(a);
        utag.dkTrk('428.4');
        utag.dkCookieImpl(utagData);
        utag.data.prorityCookie = true;
    } catch (e) {
        utag.DB(e);
    }
}
  
} } catch(e){ utag.DB(e) }  }catch(e){utag.DB(e)};
try{
  if(typeof utag.linkHandler=='undefined'){
    utag.linkHandler=function(a,b,c,d,e){
      if(!a)a=window.event;
      if(a.target)b=a.target;
      else if(a.srcElement)b=a.srcElement;
      if(b.nodeType==3)b=b.parentNode;
      if(typeof b=='undefined'||typeof b.tagName=='undefined')return;
      c=b.tagName.toLowerCase();
      if(c=='body')return;
      if(c!='a'){
        for(d=0;d<5;d++){
          if(typeof b!='undefined'&&b.parentNode)b=b.parentNode;
          c=(b!=null&&b.tagName)?b.tagName.toLowerCase():'';
          if(c=='a')break;
          else if(c == 'body')return;
        }
      }
      if(c!='a')return;
      var lt=b.text ? b.text: b.innerText ? b.innerText : '';
      if((lt=='' || /^\s+$/.test(lt)) && typeof b.innerHTML!='undefined'){
        lt=b.innerHTML.toLowerCase();
        if(lt.indexOf('<img ')>-1){
          d=lt.indexOf('alt="');
          if(d>-1){
            e=lt.indexOf('"', d + 5);
            lt=lt.substring(d+5,e);
          }else{
            d=lt.indexOf('src="');
            if(d>-1){
              e=lt.indexOf('"',d+5);
              lt=lt.substring(d+5,e);
            }
          }
        }
      }
      var hr=b.href,hrnq=(b.href.split('?'))[0];
      var obj={link_obj:b,link_text:lt,link_url:hrnq,link_type:'exit link',event_name:'Onsite and Downloads'};
c=[location.hostname].concat(('javascript:,digikey,localhost').split(','));
for(d=0;d<c.length;d++){if(hrnq.indexOf(c[d])>-1){obj.link_type='link';break;}};
c=('exe,zip,wav,mp3,mov,mpg,avi,wmv,doc,pdf,xls').split(',');
for(d=0;d<c.length;d++){e=new RegExp(c[d]+'$');if(e.test(hrnq)){obj.link_type='download link';break;}};
try{var link=b;(function () {
  var data = {};   
  utag.dkStdVars(data);
  data['not_a_pageview'] = '1';
  if (typeof obj != 'undefined' && typeof obj.link_url != 'undefined' && obj.link_url.length > 0) {
    //if (!/digikey/ig.test(obj.link_url)) {
    if (!/\/\/digikey/ig.test(obj.link_url) && !/\.digikey/ig.test(obj.link_url)) {
    var dest = data['ext_location'] = data['event_label'] = obj.link_url;
    data['ext_host'] = dest.substring(dest.indexOf('//') + 2,dest.indexOf('/',10)); 
    data['ext_uri'] = dest.substr(dest.indexOf('/',10));
    switch(obj.link_type) {
      case 'download link':
	data['ref_page_event'] = 'Download from External Page (Auto)';
	break;
      case 'exit link': 
	data['ref_page_event'] = 'Link to External Page (Auto)';
	break;
      default: 
	data['ref_page_event'] = 'Javascript & Misc (Auto)';
	data['event_label'] = obj.link_text;
    }
    data['event_category'] = "Offsite Links (Auto)";
    data['page_title'] = obj.link_url;
    utag.link(data); 
  } else if (obj.link_type === "download link") {
    data['ref_page_event'] = "DigiKey Download (Auto)";
    data['event_category'] = "DigiKey Download (Auto)";
    data['page_title'] = obj.link_url;
    data['event_label'] = obj.link_url;
     utag.link(data);
  }
}
}());


      
}catch(e){};
    if(obj['link_url']=='EXCLUDEALL')utag.link(obj);
    }
  utag.loader.EV(document,'mousedown',utag.linkHandler);
  }

}catch(e){utag.DB(e)};
try{ try{ if(1){
utag.checkClassPath = function(a,classStr) {
    var element = a.target, counter = 0;
    while (element && counter < 10) {
        if (element.className.indexOf(classStr)>=0) {
            return true;
        }
        counter++;
        element = element.parentElement;
    }
    return false;
}


utag.tagHeaderNav = function(a, b, c, d, e) {
  var element = a.target, counter = 0;
  while (element && counter < 5) {
    if (element.hasAttribute('href')){
      utag.dkTrk('389.1');
      utag.dkCookie("ref_page_event=Header Nav");
      break;
    }
    element = element.parentElement; 
    counter++;
  }
};

utag.tagSearchNav = function(a, b, c, d, e) {
    var cv = "ref_page_event=Initiate Search";
    if (utag.checkClassPath(a,"show-advanced")) {
        cv += ",html_element1=show-advanced";
    }
    utag.dkTrk('389.2');
    utag.dkISCookie(cv);
};
  
utag.tagSearchKeypressEvent = function(a,b,c,d,e) {
    var ky = window.event.which || window.event.keyCode;
    if (ky === 13) {
        var cv = "ref_page_event=Initiate Search";
        if (utag.checkClassPath(a,"show-advanced")) {
            cv += ",html_element1=show-advanced";
        }
        utag.dkTrk("389.3");
        utag.dkISCookie(cv);
    }
};    
  
utag.tagFooterNav = function(a, b, c, d, e) {
  var element = a.target, counter = 0;
  while (element && counter < 5) {
    if (element.hasAttribute('href')){
      utag.dkTrk('389.4');
      utag.dkCookie("ref_page_event=Footer Nav");
      utag.data.prorityCookie = true;
      break;
    }
    element = element.parentElement; 
    counter++;
  }
};
  
// Tag Searches
utag.tagSearchKeypress = function(searchElements) {
  var i,i1;
  var navElement = [];
  utag.DB('Add Nav Events');
  for (i = 0; i < searchElements.length; i++) {
      navElement = searchElements[i];
      if (navElement['type'] == 'c') {
        var elementy = document.getElementsByClassName(navElement['element']);
	    if (elementy !== null && typeof elementy !== undefined) {
      	    for (i1 = 0; i1 < elementy.length; i1++) {
	            utag.loader.EV(elementy[i1],'keydown',utag.tagSearchKeypressEvent);
	        }
	    }
      } else if (navElement['type'] == 'i') {
            var elementx = document.getElementById(navElement['element']);
            if (elementx !== null && typeof elementx !== 'undefined') {
                utag.loader.EV(elementx,'keydown',utag.tagSearchKeypressEvent);
            }
      }
  }
};
  
utag.tagSearchButton = function(searchElements) {
    var i,i1;
    var navElement = [];
    utag.DB('Add Nav Events');
    for (i = 0; i < searchElements.length; i++) {
        navElement = searchElements[i];
        if (navElement['type'] == 'c') {
            var elementy = document.getElementsByClassName(navElement['element']);
            if (elementy !== null && typeof elementy !== undefined) {
                for (i1 = 0; i1 < elementy.length; i1++) {
                    utag.loader.EV(elementy[i1],'mousedown',utag.tagSearchNav);
                }
            }
        } else if (navElement['type'] == 'i') {
            var elementx = document.getElementById(navElement['element']);
            if (elementx !== null && typeof elementx !== 'undefined') {
                utag.loader.EV(elementx,'mousedown',utag.tagSearchNav);
            }
        }
    }
}
  
// Tag Navigation
utag.tagNavigation = function(navElements) {
  var i,i1;
  var navElement = [];
  utag.DB('Add Nav Events');
  for (i = 0; i < navElements.length; i++) {
      navElement = navElements[i];
      if (navElement['type'] == 'c') {
        var elementy = document.getElementsByClassName(navElement['element']);
	if (elementy !== null && typeof elementy !== undefined) {
      	   for (i1 = 0; i1 < elementy.length; i1++) {
	   utag.loader.EV(elementy[i1],'mousedown',utag.tagHeaderNav);
	   }
	}
      } else if (navElement['type'] == 'i') {
         var elementx = document.getElementById(navElement['element']);
	if (elementx !== null && typeof elementx !== 'undefined') {
	  utag.loader.EV(elementx,'mousedown',utag.tagHeaderNav);
	}
      }
  }
}
// Register Navigation Events 
 
// Determine Navigation Events to Register
utag.tagNavigation([{type:'c',element:'resource--products'},{type:'c',element:'resource--suppliers'},{type:'c',element:'resource--resources'},{type:'c',element:'dropdown--mydigikey'},
    {type:'c',element:'header__left'},{type:'c',element:'header_0__centerDropdowns'},{type:'c',element:'header-resource'},{type:'c',element:'header-dropdown'},{type:'i',element:'header-login'},
    {type:'i',element:'header-left'},{type:'c',element:'dropdown--resources'},{type:'c',element:'header-logo'}]);

utag.tagSearchKeypress([{type:'i',element:'custom-search'},{type:'i',element:'header-search'},{type:'c',element:'product-search-text'},{type:'i',element:'header-search'},
    {type:'i',element:'header_search_bar'},{type:'i',element:'search-textbox'},{type:'c',element:'search-textbox'}]);
utag.tagSearchButton([{type:'c',element:'search-button'},{type:'i',element:'custom-search-button'},{type:'i',element:'header_search_bar'},{type:'i',element:'header-search-button'}]);


// Footer Tag Navigation
utag.tagFooterNavigation = function(navElements) {
  var i,i1;
  var navElement = [];
  for (i = 0; i < navElements.length; i++) {
      navElement = navElements[i];
      if (navElement.type == 'c') {
        var elementy = document.getElementsByClassName(navElement.element);
	if (elementy !== null && typeof elementy !== undefined) {
      	   for (i1 = 0; i1 < elementy.length; i1++) {
	   utag.loader.EV(elementy[i1],'mousedown',utag.tagFooterNav);
	   }
	}
      } else if (navElement['type'] == 'i') {
         var elementx = document.getElementById(navElement['element']);
	if (elementx !== null && typeof elementx != 'undefined') {
	  utag.loader.EV(elementx,'mousedown',utag.tagFooterNav);
	}
      }
  }
}
// Register Navigation Events 
 
// Determine Navigation Events to Register
utag.tagFooterNavigation([{type:'c',element:'footer__wrapper--left'},{type:'c',element:'blackbox__associations'}]);

} } catch(e){ utag.DB(e) }  }catch(e){utag.DB(e)};
try{ try{ if(1){
utag.dkGetEventForPageType = function(pageType) {
    retval = "";
    switch (utag.dkConCatPageType()) {
        case 'RDL-DP':
        case 'RDL-HP':
        case 'RDL-RP':
            retval = "ref_page_event=Search RDL";
            break;
    }
    return retval;
    
}

utag.tagGSearchNav = function(a, b, c, d, e) {
    if (a.target.type === 'text') return;
    var pagtp = utag.dkConCatPageType();
    var cv = utag.dkGetEventForPageType(pagtp);
    if (cv !== "") {
        utag.dkTrk('446.1');
        utag.dkISCookie(cv);
    }
};
  
utag.tagGSearchKeypressEvent = function(a,b,c,d,e) {
    var ky = window.event.which || window.event.keyCode;
    if (ky === 13) {
        var pagtp = utag.dkConCatPageType();
        var cv = utag.dkGetEventForPageType();
        if (cv !== "") {
            utag.dkTrk("446.2");
            utag.dkISCookie(cv);
        }
    }
};    

utag.tagGSearch = function(searchElements) {
    var i,i1;
    var navElement = [];
    for (i = 0; i < searchElements.length; i++) {
        navElement = searchElements[i];
        if (navElement['type'] == 'c') {
            var elementy = document.getElementsByClassName(navElement['element']);
            if (elementy !== null && typeof elementy !== undefined) {
                for (i1 = 0; i1 < elementy.length; i1++) {
                    utag.loader.EV(elementy[i1],'mousedown',utag.tagGSearchNav);
                    utag.loader.EV(elementy[i1],'keydown',utag.tagGSearchKeypressEvent);
                }
            }
        } else if (navElement['type'] == 'i') {
            var elementx = document.getElementById(navElement['element']);
            if (elementx !== null && typeof elementx !== 'undefined') {
                utag.loader.EV(elementx,'mousedown',utag.tagSearchNav);
                utag.loader.EV(elementy[i1],'keydown',utag.tagGSearchKeypressEvent);
            }
        }
    }
}
  
utag.tagGSearch([{type:'c',element:'SearchBar'}]);

} } catch(e){ utag.DB(e) }  }catch(e){utag.DB(e)};
try{ try{ if(1){

utag.processPandAEvents = function(evt) {
    var cntr = 0;
    if (utag.data.page_type === 'P&A') {
        if (utag.data.page_sub_type === 'RLS'||utag.data.page_sub_type === 'ADP'){
            var target = evt.target;
            while (target && cntr < 5) {
                if (target.id == 'btnAdd' && target.innerHTML == 'Add to list') {
                    utag.dkTrk('416.1');
                    utag.dkLink("ref_page_event=Add Part to List");
                    break;
                }
                target = target.parentElement;
                cntr++;
            }
        }
    }
}



} } catch(e){ utag.DB(e) }  }catch(e){utag.DB(e)};
try{ try{ if(1){
// Control what is implemented in test.
utag.parseDataStr = function(str)
{

    var returnObj = {}, e = str.split(";");
    for (var i = 0; i < e.length; i++) {
        if (e[i].indexOf('=')>=0) {
            var r = e[i].split("=");
            r[0] = r[0].trim();
            r[1] = r[1].trim();
            if (r[0].length > 0 && r[1].length > 0) {
                returnObj[(r[0])]=r[1];
            }
        }
    }
    return returnObj;
    
}

utag.collectSpecElements = function(element,sElements,trackable) {
    // for Header Nav
    if (typeof element.className !== 'string') return;
    if (element.className.indexOf('featured__flyout__text') >= 0) sElements['Flyout'] = element;
    if (element.className.indexOf('cta-button') >= 0) sElements['Flyout'] = element;
    if (typeof element.href !== 'undefined' && element.href.toLowerCase().indexOf('logout') >= 0) sElements['Logout'] = element;
    // for Part Search Family Page
    if (element.className.indexOf('lnkDatasheet') >= 0) sElements['Asset'] = element;
    if (element.className.indexOf('tr-qtyAvailable') >= 0) sElements['Help for Parts'] = element;
    if (element.className.indexOf('tr-packaging') >= 0) sElements['Help for Parts'] = element;
    if (element.className.indexOf('tr-series') >= 0) sElements['View Series'] = element;
    if (element.className.indexOf('tr-vendor') >= 0) sElements['Select Manufacturer'] = element;
    // for Part Search Category Page
    if (element.className.indexOf('chosen-results') >= 0){
        sElements['Supplier Search'] = element;
        return true;
    } 
    // for Shopping Cart
    if (element.className.indexOf('button-checkout') >= 0) sElements['Checkout'] = element;
    // for Supplier Centers
    if (element.className.indexOf('supplier-result-container') >= 0) sElements['Link to Newest Products'] = element;
    // for Evergage Personalization
    if (element.id.indexOf('evergage-tooltip') >= 0) sElements['Evergage Click'] = element;
    return trackable;
}

utag.postDCSpecializedFunc = function(tags,sElements,eventType) {
    if (tags.ref_page_event === 'Header Nav') {
        if (typeof utag.getHeaderNavHrchy !== 'undefined') utag.getHeaderNavHrchy(tags,sElements);
    } else if (utag.data['page_type'] === 'PS' && (utag.data['page_sub_type'] === 'FAM' ||utag.data['page_sub_type'] === 'CAT') ) {
        if (typeof utag.fixUpFamilyPage !== 'undefined') eventType = utag.fixUpFamilyPage(tags,sElements,eventType)
    } else if (utag.data['page_type'] === 'SC' && utag.data['page_sub_type'] === 'CO') {
        if (typeof utag.fixUpShoppingCart !== 'undefined') utag.fixUpShoppingCart(tags,sElements);
    } else if (utag.data['page_type'] === 'SP' && utag.data['page_sub_type'] === 'SP') {
        if (typeof utag.fixUpSuppliers !== 'undefined') utag.fixUpSuppliers(tags,sElements);
    }
    if (typeof sElements['Evergage Click'] != 'undefined' && typeof utag.evergagePersonalization !== 'undefined') utag.evergagePersonalization(tags,sElements);
    return eventType;
}

utag.clearTagValues = function(tagData) {
//    for (var i in tagData) {
//        utag.data[i] = '';
//    }  
}
    
utag.processTags = function(a, b, c, d, e) {
    var fStage = 'Start';
    try {
    var element = a.target, counter = 0, href="",tags = {},rawProp = {}, trackableElement=false,eventType = "undefined",nProperty = "";
    var labels = [], sElements = {},tagAssigned = false;
    if (utag.data.priorityLink === true) return;
    
    while (element && counter < 50) {
        if (href==="" && typeof element.href !== 'undefined'){
            href = element.href;
        }

        if (!trackableElement && (element.tagName.toLowerCase().match(/^a$|^input$|^button$|^span$|^img$/i) !== null)
            || (element.onclick !== null)) {
            trackableElement = true;
        }

        // Collect data for utag. 
        
            // Collect ref_page_event from all attributes, break if found and href is found.  Do not set TrackAsEvent or TrackAsCookie
            // Collect dkTrack from all attributes, break if found  and href is found.  Do not set TrackAsEvent or TrackAsCookie
        var r = element.getAttribute("cookie-tracking")||element.getAttribute("data-webtrends")||element.getAttribute("wt_name") || element.getAttribute("cookie-event");
        if (r && eventType !== 'Link' && r.indexOf('header_flag')<0) {
            rawProp = utag.parseDataStr(r);
            for (nProperty in rawProp) {
                if (nProperty !== 'header_flag') {
                    tags[nProperty] || (tags[nProperty] = rawProp[nProperty]);
                    tagAssigned = true;
                    if (eventType === 'undefined') eventType='Cookie';
                }
            }
        } else if (eventType !== 'Cookie' && (r = element.getAttribute('track-data'))) {
            rawProp = utag.parseDataStr(r);
            for (nProperty in rawProp) {
                tags[nProperty] || (tags[nProperty] = rawProp[nProperty]);
                tagAssigned = true;
                if (eventType === 'undefined') eventType = 'Link';
            }
        // Implement ref_page_event as an attribute
        // Type of tag (Cookie or Event) is undefined, will be set by CookieOrEvent.  Supports inheretence.  Default values assigned.
        } else if (r = element.getAttribute('ref_page_event')) {
            tags['ref_page_event'] = r;
            tagAssigned = true;
        }
            trackableElement = utag.collectSpecElements(element,sElements,trackableElement);
        element = element.parentElement;
        counter++;
    }
    
    // Determine whether to use a cookie or an event.  Use the rules in Events from Cookies Tracking, basically if the href doesn't include digikey it is an event.
        fStage = 'Finish Gather Element Data';
        if (trackableElement) {
            if (utag.data.do_not_track_for_consent === 'yes' && typeof utag.clearDoNotTrack === 'function') {
                fStage = 'Clear Consent';
                utag.clearDoNotTrack(href,tags);
            }
            if (tagAssigned) {
                tags['ExtRun'] = utag.dkTrk('409.1');
                fStage = 'Process Specialized Functions';
                eventType = utag.postDCSpecializedFunc(tags,sElements,eventType);
                fStage = 'Send Tag';
                if (eventType === 'undefined' && typeof utag.CookieOrLink != 'undefined') eventType = utag.CookieOrLink(href);
                if (eventType === 'Link') {
                    utag.dklink(tags,href);
                } else if (eventType === 'Cookie' && utag.data.prorityCookie !== true) {  // tags created from the nav section, by user calls to dkCookie and by event handlers take precedence over cookies constructed by processing attributes
                    utag.newCookie(tags);
                }
            }

    // Process Site Specific Events 
            fStage = 'Process Site Specific Events';
            utag.processPandAEvents(a, b, c, d, e);
        }
    utag.data.priorityLink = utag.data.prorityCookie = false;
    utag.clearTagValues(tags);
    } catch(err) {
        var x = i ||0; var errDisp = fStage,data = [];
        data['ExtRun'] = utag.dkTrk('409.1-e');
        utag.dkErrorTag(data,err.name,err.message + '--409 -- ' +errDisp);
        utag.DB(err)
        }
    }
utag.loader.EV(document, 'mousedown', utag.processTags);





} } catch(e){ utag.DB(e) }  }catch(e){utag.DB(e)};
try{ try{ if(1){
utag.clearDoNotTrack = function(href,tags){
    if (document.getElementsByClassName('cookie-notice').length > 0) {
        if (window.localStorage.getItem('gdpr_cookie_consent') === null) {
            if ((typeof href != 'undefined' && href.indexOf("help/privacy") < 0) 
                && utag.data['dom.pathname'].toLowerCase().indexOf('help/privacy')<0) {
                var gdpr={'acceptedOn':new Date()};
                window.localStorage.setItem("gdpr_cookie_consent", JSON.stringify({ "acceptedOn": new Date() }));
                window.utag_cfg_ovrd.noview = false;
                window.utag_cfg_ovrd.nocookie=false;
                window['ga-disable-'+ utag.data.google_tracking_id1] = false;
                utag.cfg.noview = false;
                utag.data.do_not_process_cookies = true;
                utag.dkTrk('420');
                utag.view(utag.utag_data_at_pageLoad);
                utag.data.do_not_track_for_consent = 'no';
                if (typeof utag.dkCollectConsentData === 'function') {
                    utag.dkCollectConsentData(gdpr,tags);
                }
            }
        }
    }
}
} } catch(e){ utag.DB(e) }  }catch(e){utag.DB(e)};
try{ try{ if(1){
utag.setTag = function(element,value,tagType) {
    if (typeof element === 'undefined' || element === null) return;
    var tgtp = (typeof tagType === 'undefined') ? 'ref_page_event' : tagType;
    if (tgtp === 'ref_page_event') {
        utag.dkTrk('432.1');
        element.setAttribute(tgtp,value);
    } else {
        utag.dkTrk('432.2');
        element.setAttribute(tgtp,'ref_page_event='+value);
    }
};
    
utag.insertTag = function(elmType,attr,value,page_type,page_sub_type,instance,tagType) {
    var i = 0, x,vrr={};
    var itm = (typeof instance !== 'number') ? 0 : instance;
//    var tgtp = (typeof tagType === 'undefined') ? 'ref_page_event' : tagType;
    if ((typeof page_type === 'undefined' && typeof page_sub_type === 'undefined')
        || (page_type === null && page_sub_type === null)
        || (utag_data.page_type === page_type && (utag_data.page_sub_type === page_sub_type || page_sub_type === 'all'))) {
        if (elmType === 'class') {
            if (instance !== 'all') {
                x = document.getElementsByClassName(attr)[itm];
                utag.setTag(x,value,tagType);
            } else if (instance === 'all') {
                x = document.getElementsByClassName(attr);
                if (typeof x !== 'undefined') {
                    for (y = 0; y < x.length; y++) {
                        vrr = x[y];
                        utag.setTag(vrr,value,tagType);
                    }
                }
            }
        } else {
            x = document.getElementById(attr);
            utag.setTag(x,value,tagType);
        }
    }
};

// Header
utag.insertTag('class','button-desktop','Consent or View Privacy',null,null,0,'track-data');
utag.insertTag('class','button-mobile','Consent or View Privacy',null,null,0,'track-data');

// China RMB
utag.insertTag('Id','btnSubmit','Complete Registration','MDK','HP',0,'cookie-tracking');

// Part Search
utag.insertTag('class','filter-toggle','Change Parametric Search Presentation','PS','FAM',null,'track-data');
utag.insertTag('class','dload-btn','Download Table','PS','FAM',1,'track-data');
utag.insertTag('class','paging-inner','Change Page in Search Results','PS','FAM');
utag.insertTag('class','download-table','Download Table','PS','FAM');
utag.insertTag('id','naddfav','Add to Favorites','PS','PD',null,'track-data');
utag.insertTag('class','catfiltertopitem','Select Family by Header','PS','CAT','all');
utag.insertTag('class','newProductCategory','Select New Products for Family','PS','CAT','all');
//utag.insertTag('class','chosen-results','Filter on Supplier','PS','CAT');

// All Content Search Pages
utag.insertTag('class','pager','Change Page in Search Results');
utag.insertTag('class','results-per-page','Change Number of Results Displayed');  //This doesn't work in part search because there is no trackable event

// Conversion Pages
utag.insertTag('class','calcResults','Select Resulting Component','COV','all');
utag.insertTag('class','calcViewResults','View All Resulting Components','COV','all');
utag.insertTag('class','related-resistors','View Related Components','COV','all');

// Shopping Cart and Checkout
utag.insertTag('class','button-checkout','Checkout;checkout_step=1','SC','CO',0,'cookie-tracking');
utag.insertTag('class','button-checkout','Checkout;checkout_step=1','SC','CO',1,'cookie-tracking');
utag.insertTag('class','already-registered','Login from Checkout;checkout_step=1','SC','CO',0,'cookie-tracking');
utag.insertTag('class','already-registered','Login from Checkout;checkout_step=1','SC','CO',1,'cookie-tracking');
// Until new CIM
utag.insertTag('id','ctl00_ctl00_mainContentPlaceHolder_mainContentPlaceHolder_btnContinue','Continue as Guest;ref_page_type=RU;ref_page_sub_type=LOG;ref_page_id=In Process Login',null,null,null,'cookie-tracking');

// BOM
utag.insertTag('id','btnAddToBom','Add to BOM', 'BOM','BOM');

// Online Catalog
utag.insertTag('class','datasheet-link','Display Part Documents;asset_type=Datasheet','DYC','PG','all','track-data');
} } catch(e){ utag.DB(e) }  }catch(e){utag.DB(e)};
try{ try{ if(1){
utag.fixUpShoppingCart = function(data,sElements)  {
    
    if (typeof sElements['Checkout'] !== 'undefined') {
        utag.dkLink('ref_page_event=Checkout Event;google_action=checkout;checkout_step=1');
        var labelx = sElements['Checkout'].innerText.trim();
        if (labelx.toLowerCase() === 'continue as guest') {
            data.ref_page_event = 'Checkout As Guest';
            data['ExtRun'] = utag.dkTrk('444.1');
        } else {
            data.ref_page_event = 'Click Checkout'
            data['ExtRun'] = utag.dkTrk('444.2');
        }
//        data.google_action = 'checkout';
//        data.checkout_step = '1';
    }
};
} } catch(e){ utag.DB(e) }  }catch(e){utag.DB(e)};}})

  if(utag.cfg.readywait || utag.cfg.waittimer){
    utag.loader.EV('', 'ready', function(a) {
      if(utag.loader.rf==0){
        utag.loader.rf=1;
        utag.cfg.readywait=1;
        utag.DB('READY:utag.cfg.readywait');
        setTimeout(function(){utag.loader.PINIT()}, utag.cfg.waittimer || 1);
      }
    })
  }else{
    utag.loader.PINIT()
  }
}

