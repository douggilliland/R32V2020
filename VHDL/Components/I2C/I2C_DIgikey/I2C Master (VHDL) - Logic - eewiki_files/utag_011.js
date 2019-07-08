//~~tv:2045.20150805
//~~tc: Added code to ensure gv is a number.
//~~tc: Updating logic for populating and sending the gv parameter.

var uetq = uetq || [];

//tealium universal tag - utag.sender.2045 ut4.0.201905220244, Copyright 2019 Tealium.com Inc. All Rights Reserved.
try {
  (function (id, loader) {
    var u = {};
    utag.o[loader].sender[id] = u;

    // Please do not modify
    if (utag.ut === undefined) { utag.ut = {}; }
    // Start Tealium loader 4.35
    if (utag.ut.loader === undefined) { u.loader = function (o) { var b, c, l, a = document; if (o.type === "iframe") { b = a.createElement("iframe"); o.attrs = o.attrs || { "height" : "1", "width" : "1", "style" : "display:none" }; for( l in utag.loader.GV(o.attrs) ){ b.setAttribute( l, o.attrs[l] ); } b.setAttribute("src", o.src); }else if (o.type=="img"){ utag.DB("Attach img: "+o.src); b=new Image();b.src=o.src; return; }else{ b = a.createElement("script");b.language="javascript";b.type="text/javascript";b.async=1;b.charset="utf-8"; for( l in utag.loader.GV(o.attrs) ){ b[l] = o.attrs[l]; } b.src = o.src; } if(o.id){b.id=o.id}; if (typeof o.cb=="function") { if(b.addEventListener) { b.addEventListener("load",function(){o.cb()},false); }else { /* old IE support */ b.onreadystatechange=function(){if(this.readyState=='complete'||this.readyState=='loaded'){this.onreadystatechange=null;o.cb()}}; } } l = o.loc || "head"; c = a.getElementsByTagName(l)[0]; if (c) { utag.DB("Attach to "+l+": "+o.src); if (l == "script") { c.parentNode.insertBefore(b, c); } else { c.appendChild(b) } } } } else { u.loader = utag.ut.loader; }
    // End Tealium loader
    // Start Tealium typeOf 4.35
    if (utag.ut.typeOf === undefined) { u.typeOf = function(e) {return ({}).toString.call(e).match(/\s([a-zA-Z]+)/)[1].toLowerCase();};} else { u.typeOf = utag.ut.typeOf; }
    // End Tealium typeOf

    u.ev = {"view" : 1, "link" : 1};
    u.initialized = false;

      u.map={"bing_id":"tagid","b_page_type":"ecomm_pagetype","b_part_id":"ecomm_prodid"};
  u.extend=[];


    u.send = function (a, b) {
      if (u.ev[a] || u.ev.all !== undefined) {
        //##UTENABLEDEBUG##utag.DB("send:##UTID##");

        var c, d, e, f, g;

        u.data = {
          "base_url" : "//bat.bing.com/bat.js",
          "tagid" : "",
          "ec" : "",
          "ea" : "",
          "el" : "",
          "ev" : "",
          "gv" : "",
          // E-Commerce Vars
          "order_subtotal" : ""
        };

        // Start tag-scoped extensions
        
        // End tag-scoped extensions

        // Start Mapping
        for (d in utag.loader.GV(u.map)) {
          if (b[d] !== undefined && b[d] !== "") {
            e = u.map[d].split(",");
            for (f = 0; f < e.length; f++) {
              u.data[e[f]] = b[d];
            }
          }
        }
        // End Mapping

        // Pull E-Commerce extension values
        // Mappings override E-Commerce extension values
        u.data.order_subtotal = u.data.order_subtotal || b._csubtotal || "";

        // Start Loader Callback
        u.loader_cb = function () {
          if (!u.initialized) {
            var o = {ti: u.data.tagid};
            o.q = uetq;
            uetq = new UET(o);
            uetq.push("pageLoad");
          }

          u.initialized = true;

          g = {};

          if (u.data.ec) {
            g.ec = u.data.ec;
          }

          if (u.data.ea) {
            g.ea = u.data.ea;
          }

          if (u.data.el) {
            g.el = u.data.el;
          }

          if (u.data.ev) {
            g.ev = u.data.ev;
          }

          u.data.gv = u.data.gv || u.data.order_subtotal;

          if (u.data.gv) {
            var gv = parseFloat(u.data.gv, 10);
            // Make sure gv is a number
            if (isNaN(gv) === false) {
              g.gv = gv;
            }
          }

          if (g.ec || g.ea || g.el || g.ev || g.gv) {
            uetq.push(g);
          }
        };
        // End Loader Callback

        if (!u.initialized) {
          u.loader({ "type" : "script", "src" : u.data.base_url, "cb" : u.loader_cb, "loc" : "script", "id" : "utag_313" });
        } else {
          u.loader_cb();
        }

        //##UTENABLEDEBUG##utag.DB("send:##UTID##:COMPLETE");
      }
    };
    utag.o[loader].loader.LOAD(id);
  }("313", "digikey.main"));
} catch (error) {
  utag.DB(error);
}
//end tealium universal tag

