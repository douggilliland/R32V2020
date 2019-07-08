//~~tv:7132.20180808
//~~tc: Resolve issues bundling gtag.js tags
//~~tc: Add remarketing support
//~~tc: Force currency to uppercase

//tealium universal tag - utag.sender.7132 ut4.0.201905220244, Copyright 2019 Tealium.com Inc. All Rights Reserved.
try {
  (function (id, loader) {
    var u = {"id" : id};
    utag.o[loader].sender[id] = u;
    // Please do not modify
    if (utag.ut === undefined) { utag.ut = {}; }
    // Start Tealium loader 4.41
    /* utag.js version 4.26 or above is required to avoid errors with this loader function */
    var match = /ut\d\.(\d*)\..*/.exec(utag.cfg.v);
    if (utag.ut.loader === undefined || !match || parseInt(match[1]) < 41) { u.loader = function(o, a, b, c, l, m) { utag.DB(o); a = document; if (o.type == "iframe") { m = a.getElementById(o.id); if (m && m.tagName == "IFRAME") { b = m; } else { b = a.createElement("iframe"); } o.attrs = o.attrs || {}; utag.ut.merge(o.attrs, { "height": "1", "width": "1", "style": "display:none" }, 0); } else if (o.type == "img") { utag.DB("Attach img: " + o.src); b = new Image(); } else { b = a.createElement("script"); b.language = "javascript"; b.type = "text/javascript"; b.async = 1; b.charset = "utf-8"; } if (o.id) { b.id = o.id; } for (l in utag.loader.GV(o.attrs)) { b.setAttribute(l, o.attrs[l]); } b.setAttribute("src", o.src); if (typeof o.cb == "function") { if (b.addEventListener) { b.addEventListener("load", function() { o.cb(); }, false); } else { b.onreadystatechange = function() { if (this.readyState == "complete" || this.readyState == "loaded") { this.onreadystatechange = null; o.cb(); } }; } } if (o.type != "img" && !m) { l = o.loc || "head"; c = a.getElementsByTagName(l)[0]; if (c) { utag.DB("Attach to " + l + ": " + o.src); if (l == "script") { c.parentNode.insertBefore(b, c); } else { c.appendChild(b); } } } }; } else { u.loader = utag.ut.loader; }
    // End Tealium loader
    // Start Tealium typeOf 4.35
    if (utag.ut.typeOf === undefined) { u.typeOf = function(e) {return ({}).toString.call(e).match(/\s([a-zA-Z]+)/)[1].toLowerCase();};} else { u.typeOf = utag.ut.typeOf; }
    // End Tealium typeOf

    u.ev = {"view" : 1};

    u.hasgtagjs = function (){
      window.gtagRename = window.gtagRename || "" || "gtag";
      if (utag.ut.gtagScriptRequested) {
        return true;
      }
      var i, s = document.getElementsByTagName("script");
      for (i = 0; i < s.length; i++) {
        if (s[i].src && s[i].src.indexOf("gtag/js") >= 0) {
          return true;
        }
      }
      window.dataLayer = window.dataLayer || [];
      if ( typeof window[window.gtagRename] !== "function" ) {
        window[window.gtagRename] = function() { dataLayer.push(arguments); };
        window[window.gtagRename]("js", new Date());
      }
      return false;
    };

    u.scriptrequested = u.hasgtagjs();

    u.o = window[window.gtagRename];

    u.map_func = function (arr, obj, item) {
      var i = arr.shift();
      obj[i] = obj[i] || {};
      if (arr.length > 0) {
        u.map_func(arr,obj[i], item);
      } else {
        obj[i] = item;
      }
    };

    u.toBoolean = function (val) {
      val = val || "";
      return val === true || val.toLowerCase() === "true" || val.toLowerCase() === "on";
    };

    u.clearEmptyKeys = function (object) {
      for (var key in object) {
        if (object[key] === "" || object[key] === undefined) {
          delete object[key];
        }
      }
      return object;
    };

    u.isEmptyObject = function(o, a) {
      for (a in o) {
        if (utag.ut.hasOwn(o, a)) return false;
      }
      return true;
    };

    u.sites = {
      "ecomm": {
        "required": ["prodid"],
        "params": ["prodid", "pagetype", "totalvalue", "category", "pvalue", "quantity"],
        "valuerules": ["product", "cart", "purchase"]
      },
      "hotel": {
        "required": ["hotelid"],
        "params": ["hotelid", "pagetype", "checkoutdate", "totalvalue"],
        "valuerules": ["cart", "purchase"]
      },
      "edu": {
        "required": ["pid"],
        "params": ["pid", "plocid", "pagetype"]
      },
      "flight": {
        "required": ["originid", "destid"],
        "params": ["originid", "destid", "pagetype", "totalvalue", "startdate", "enddate"],
        "valuerules": ["cart", "purchase"]
      },
      "hrental": {
        "required": ["id"],
        "params": ["id", "pagetype", "startdate", "enddate", "totalvalue"],
        "valuerules": ["conversionintent", "conversion"]
      },
      "job": {
        "required": ["id"],
        "params": ["id", "locid", "pagetype", "totalvalue"],
        "valuerules": ["conversionintent", "conversion"]
      },
      "local": {
        "required": ["id"],
        "params": ["id", "pagetype", "totalvalue"],
        "valuerules": ["conversionintent", "conversion"]
      },
      "listing": {
        "required": ["id"],
        "params": ["id", "pagetype", "totalvalue"],
        "valuerules": ["conversionintent", "conversion"]
      },
      "travel": {
        "required": ["destid"],
        "params": ["destid", "originid", "pagetype", "startdate", "enddate", "totalvalue"],
        "valuerules": ["conversionintent", "conversion"]
      },
      "dynx": {
        "required": ["itemid"],
        "params": ["itemid", "itemid2", "pagetype", "totalvalue"],
        "valuerules": ["conversionintent"]
      }
    };
     
    u.checkRequired = function (siteName, site) {
      var i, valid = false;
      if (!u.data[siteName]) {
        return valid;
      }
      for (i = 0; i < site.required.length; i++) {
        valid = u.data[siteName][site.required[i]] ? true : false;
      }
      return valid;
    };
    
    // Return totalvalue via mapping or default value order_subtotal. Check valuerules before returning value
    u.getValue = function (paramName, siteName, site) {
      var i;
      for (i = 0; i < site.valuerules.length; i++) {
        if (u.data.pagetype &&  u.data.pagetype === site.valuerules[i]) {
          return u.data[siteName][paramName] || u.data.order_subtotal;
        }
      }
    };
    
    u.getParams = function () {
      var siteName, g = {}, i;
      for (siteName in u.sites) {
        var site = u.sites[siteName];
        if (!u.data[siteName]) { continue; }
        if ( u.checkRequired(siteName, site) ) {
          for (i = 0; i < site.params.length; i++) {
            if (site.params[i] === "totalvalue") {
              g[siteName + "_" + site.params[i]] = u.getValue(site.params[i], siteName, site );
            } else if (site.params[i] === "pagetype") {
              // Use generic pagetype mapping for all site types
              g[siteName + "_" + site.params[i]] = u.data.pagetype;
            } else {
              g[siteName + "_" + site.params[i]] = u.data[siteName][site.params[i]];
            }
          }
        }
      }
      return u.clearEmptyKeys(g);
    };

    u.callBack = function() {
      utag.ut.gtagScriptRequested = true;
    };

      u.map={"ad_word_universal_id":"conversion_id","gr_page_type:home":"page_view","gr_page_type:product_detail":"page_view","gr_page_type:cart":"page_view","gr_page_label":"custom.ecomm_pagetype,pagetype","gr_part_id":"custom.ecomm_prodid","gr_supplier_id":"custom.ecomm_supplier"};
  u.extend=[function(a,b){ try{ if(1){
var page_type_sub_type = b.page_type + "-" + b.page_sub_type;
switch (page_type_sub_type) {
    case "HP-HP":
        b.b_page_type = b.gr_page_type = b.gr_page_lagel = "home";
        break;
    case "PS-PD":
        b.b_page_type = "product";
        b.bing_event = "view_item";
        b.bing_part_ids = [];
        b.bing_part_ids.push(b.part_id);
        b.gr_page_type = b.gr_page_label = 'product_detail'
        b.b_part_id = b.gr_part_id = b.part_id;
        b.gr_supplier_id = b.supplier_id;
        break;
    case "SC-CO":
        b.b_page_type = b.gr_page_type = b.gr_page_label = "cart";
        break;
    case "SC-SCN":
        b.gr_page_type = 'confirmation';
        break;
    default:
        b.gr_page_type = 'default';
}
} } catch(e){ utag.DB(e) }  }];


    u.send = function (a, b) {
      if (u.ev[a] || u.ev.all !== undefined) {
        utag.DB("send:316");
        utag.DB(b);

        var c, d, e, f, h, i;

        u.data = {
          "base_url" : "https://www.googletagmanager.com/gtag/js",
          "conversion_id" : "",
          "conversion_label" : "",
          "conversion_value" : "",
          "pagetype" : "other",
          "remarketing" : "true",
          // E-Commerce Vars
          "product_id" : [],
          "product_category" : [],
          "product_quantity" : [],
          "product_unit_price" : [],
          "config" : {},
          "event_data" : {},
          "event" : [],
          "custom" : {}
        };

        // Start tag-scoped extensions
        for(c=0;c<u.extend.length;c++){try{d=u.extend[c](a,b);if(d==false)return}catch(e){}};
        utag.DB("send:316:EXTENSIONS");
        utag.DB(b);
        // End tag-scoped extensions

        c = [];

        // Start Mapping
        for (d in utag.loader.GV(u.map)) {
          if (b[d] !== undefined && b[d] !== "") {
            e = u.map[d].split(",");
            for (f = 0; f < e.length; f++) {
              u.map_func(e[f].split("."), u.data, b[d]);
            }
          } else {
            h = d.split(":");
            if (h.length === 2 && b[h[0]] === h[1]) {
              if (u.map[d]) {
                u.data.event = u.data.event.concat(u.map[d].split(","));
              }
            }
          }
        }
        utag.DB("send:316:MAPPINGS");
        utag.DB(u.data);
        // End Mapping

        // Pull E-Commerce extension values
        // Mappings override E-Commerce extension values
        u.data.order_id = u.data.order_id || b._corder || "";
        u.data.order_subtotal = u.data.conversion_value || u.data.order_subtotal || b._csubtotal || "";
        u.data.order_currency = u.data.conversion_currency || u.data.order_currency || b._ccurrency || "";
        if (u.data.product_id.length === 0 && b._cprod !== undefined) { u.data.product_id = b._cprod.slice(0); }
        if (u.data.product_category.length === 0 && b._ccat !== undefined) { u.data.product_category = b._ccat.slice(0); }
        if (u.data.product_quantity.length === 0 && b._cquan !== undefined) { u.data.product_quantity = b._cquan.slice(0); }
        if (u.data.product_unit_price.length === 0 && b._cprice !== undefined) { u.data.product_unit_price = b._cprice.slice(0); }
        if (u.data.event.length === 0 && b._cevent !== undefined) { u.data.event = (u.typeOf(b._cevent) === "array") ? b._cevent.slice(0) : [b._cevent] ; }

        if (u.data.order_currency !== u.data.order_currency.toUpperCase()) {
          u.data.order_currency = u.data.order_currency.toUpperCase();
          utag.DB("Currency not supplied in uppercase - automatically converting");
        }

        // Report required config is missing, and stop tag from firing.
        if (!u.data.conversion_id) {
          utag.DB(u.id + ": Tag not fired: Required attribute not populated");
          return;
        }

        //corrections for retrieving gtag/js
        //u.data.base_url += "?id=" + u.data.conversion_id;
        u.data.base_url += "?id=" + u.data.conversion_id.split(',')[0];

        // corrections for remarketing
        // u.o("config", u.data.conversion_id, u.data.config);
        var conid = u.data.conversion_id.split(',');
        for (i = 0;i<conid.length;i++){
            u.o("config",conid[i]);
       }

        // Set Ecomm site values using e-commerce extension
        if (u.data.product_id.length > 0) {
          u.data.ecomm = u.data.ecomm || {};
          if (u.data.ecomm.prodid === undefined) {
            u.data.ecomm.prodid = u.data.product_id;
          }
          if (u.data.product_category.length > 0 && u.data.ecomm.category === undefined) {
            u.data.ecomm.category = u.data.product_category;
          }
          if (u.data.product_quantity.length > 0 && u.data.ecomm.quantity === undefined) {
            u.data.ecomm.quantity = u.data.product_quantity;
          }
          if (u.data.product_unit_price.length > 0 && u.data.ecomm.pvalue === undefined) {
            u.data.ecomm.pvalue = u.data.product_unit_price;
          }
        }

        u.data.event_data = u.getParams();

        // Combine custom parameters and sites data
        utag.ut.merge(u.data.event_data, u.data.custom, 1);

        // Send Conversion Event if a conversion label is set
        if (u.data.conversion_label) {
          u.data.event_data.send_to = u.data.conversion_id + "/" + u.data.conversion_label;
          if (u.data.order_subtotal) {
            u.data.event_data.value = u.data.order_subtotal;
            u.data.event_data.currency = u.data.order_currency;
            u.data.event_data.transaction_id = u.data.order_id;
          }
          // Add "conversion" event if not set

          var containsConversion = false;
          for (i = 0; i < u.data.event.length; i++){
            containsConversion = u.data.event[i] === "conversion" ? true : false;
          }
          if (!containsConversion) {
            u.data.event.push("conversion");
          }
        }

        // Default to "page" event if no event is set
        if (u.toBoolean(u.data.remarketing)) {
          if (!u.data.event.length) {
            u.data.event.push("page_view");
          }
        }
        
        for (i = 0; i < u.data.event.length; i++) {
          u.o("event", u.data.event[i], u.data.event_data);
        }

        if (!u.hasgtagjs()) {
          u.scriptrequested = true;
          u.loader({
            "type" : "script",
            "src" : u.data.base_url,
            "cb" : u.callBack,
            "loc" : "script",
            "id" : "utag_316",
            "attrs" : {}
          });
        }

        utag.DB("send:316:COMPLETE");
      }
    };
    utag.o[loader].loader.LOAD(id);
  }("316", "digikey.main"));
} catch (error) {
  utag.DB(error);
}
//end tealium universal tag

