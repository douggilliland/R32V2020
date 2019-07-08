    window.addEventListener('load', function() {
        // Establishes the vars to build the GA collect request
        var imgUrl = "https://www.google-analytics.com/collect?v=1";
    if (/digikeytest\.digikey/i.test(document.location.origin) || /digikeydev\.digikey/i.test(document.location.origin)){PropID = 'UA-88355857-1';} 
    else if(/digikey\.at$/i.test(document.location.origin)){PropID = 'UA-88355857-9';}
    else if (/digikey\.com\.au$/i.test(document.location.origin)){PropID = 'UA-88355857-10';} 
    else if (/digikey\.be$/i.test(document.location.origin)){PropID = 'UA-88355857-11';} 
    else if (/digikey\.bg$/i.test(document.location.origin)){PropID = 'UA-88355857-12';} 
else if (/digikey\.ca$/i.test(document.location.origin)){PropID = 'UA-88355857-13';} 
else if (/digikey\.ch$/i.test(document.location.origin)){PropID = 'UA-88355857-14';} 
else if (/digikey\.com\.cn$/i.test(document.location.origin)){PropID = 'UA-88355857-15';} 
else if (/digikey\.cn$/i.test(document.location.origin)){PropID = 'UA-88355857-17';} 
else if (/digikey\.cz$/i.test(document.location.origin)){PropID = 'UA-88355857-16';} 
else if (/digikey\.de$/i.test(document.location.origin)){PropID = 'UA-88355857-19';} 
else if (/digikey\.dk$/i.test(document.location.origin)){PropID = 'UA-88355857-18';} 
else if (/digikey\.ee$/i.test(document.location.origin)){PropID = 'UA-88355857-20';} 
else if (/digikey\.es$/i.test(document.location.origin)){PropID = 'UA-88355857-21';} 
else if (/digikey\.fi$/i.test(document.location.origin)){PropID = 'UA-88355857-23';} 
else if (/digikey\.fr$/i.test(document.location.origin)){PropID = 'UA-88355857-22';} 
else if (/digikey\.gr$/i.test(document.location.origin)){PropID = 'UA-88355857-25';} 
else if (/digikey\.hk$/i.test(document.location.origin)){PropID = 'UA-88355857-24';} 
else if (/digikey\.hu$/i.test(document.location.origin)){PropID = 'UA-88355857-26';} 
else if (/digikey\.ie$/i.test(document.location.origin)){PropID = 'UA-88355857-27';} 
else if (/digikey\.co\.il$/i.test(document.location.origin)){PropID = 'UA-88355857-29';} 
else if (/digikey\.it$/i.test(document.location.origin)){PropID = 'UA-88355857-28';} 
else if (/digikey\.jp$/i.test(document.location.origin)){PropID = 'UA-88355857-30';} 
else if (/digikey\.kr$/i.test(document.location.origin)){PropID = 'UA-88355857-31';} 
else if (/digikey\.lt$/i.test(document.location.origin)){PropID = 'UA-88355857-32';} 
else if (/digikey\.lu$/i.test(document.location.origin)){PropID = 'UA-88355857-33';} 
else if (/digikey\.lv$/i.test(document.location.origin)){PropID = 'UA-88355857-35';} 
else if (/digikey\.com\.mx$/i.test(document.location.origin)){PropID = 'UA-88355857-34';} 
else if (/digikey\.nl$/i.test(document.location.origin)){PropID = 'UA-88355857-36';} 
else if (/digikey\.no$/i.test(document.location.origin)){PropID = 'UA-88355857-37';} 
else if (/digikey\.co\.nz$/i.test(document.location.origin)){PropID = 'UA-88355857-39';} 
else if (/digikey\.pl$/i.test(document.location.origin)){PropID = 'UA-88355857-38';} 
else if (/digikey\.pt$/i.test(document.location.origin)){PropID = 'UA-88355857-41';} 
else if (/digikey\.se$/i.test(document.location.origin)){PropID = 'UA-88355857-40';} 
else if (/digikey\.si$/i.test(document.location.origin)){PropID = 'UA-88355857-43';} 
else if (/digikey\.sg$/i.test(document.location.origin)){PropID = 'UA-88355857-42';} 
else if (/digikey\.sk$/i.test(document.location.origin)){PropID = 'UA-88355857-45';} 
else if (/digikey\.tw$/i.test(document.location.origin)){PropID = 'UA-88355857-44';} 
else if (/digikey\.co\.uk$/i.test(document.location.origin)){PropID = 'UA-88355857-47';} 
else if (/digikey\.com$/i.test(document.location.origin)){PropID = 'UA-88355857-46';} 
else if (/digikey\.in$/i.test(document.location.origin)){PropID = 'UA-88355857-49';} 
else if (/digikey\.my$/i.test(document.location.origin)){PropID = 'UA-88355857-48';} 
else if (/digikey\.ro$/i.test(document.location.origin)){PropID = 'UA-88355857-51';} 
else if (/digikey\.ae$/i.test(document.location.origin)){PropID = 'UA-88355857-52';} 
else if (/digikey\.am$/i.test(document.location.origin)){PropID = 'UA-88355857-52';} 
else if (/digikey\.com\.ar$/i.test(document.location.origin)){PropID = 'UA-88355857-52';} 
else if (/digikey\.ba$/i.test(document.location.origin)){PropID = 'UA-88355857-52';} 
else if (/digikey\.bo$/i.test(document.location.origin)){PropID = 'UA-88355857-52';} 
else if (/digikey\.by$/i.test(document.location.origin)){PropID = 'UA-88355857-52';} 
else if (/digikey\.cl$/i.test(document.location.origin)){PropID = 'UA-88355857-52';} 
else if (/digikey\.com\.co$/i.test(document.location.origin)){PropID = 'UA-88355857-52';} 
else if (/digikey\.cr$/i.test(document.location.origin)){PropID = 'UA-88355857-52';} 
else if (/digikey\.com\.cy$/i.test(document.location.origin)){PropID = 'UA-88355857-52';} 
else if (/digikey\.do$/i.test(document.location.origin)){PropID = 'UA-88355857-52';} 
else if (/digikey\.ec$/i.test(document.location.origin)){PropID = 'UA-88355857-52';} 
else if (/digikey\.com\.eg$/i.test(document.location.origin)){PropID = 'UA-88355857-52';} 
else if (/digikey\.com\.gt$/i.test(document.location.origin)){PropID = 'UA-88355857-52';} 
else if (/hr\.digikey\.com$/i.test(document.location.origin)){PropID = 'UA-88355857-52';} 
else if (/digikey\.co\.id$/i.test(document.location.origin)){PropID = 'UA-88355857-52';} 
else if (/digikey\.is$/i.test(document.location.origin)){PropID = 'UA-88355857-52';} 
else if (/digikey\.com\.jm$/i.test(document.location.origin)){PropID = 'UA-88355857-52';} 
else if (/digikey\.com\.lb$/i.test(document.location.origin)){PropID = 'UA-88355857-52';} 
else if (/digikey\.lk$/i.test(document.location.origin)){PropID = 'UA-88355857-52';} 
else if (/digikey\.ma$/i.test(document.location.origin)){PropID = 'UA-88355857-52';} 
else if (/digikey\.md$/i.test(document.location.origin)){PropID = 'UA-88355857-52';} 
else if (/digikey\.com\.mk$/i.test(document.location.origin)){PropID = 'UA-88355857-52';} 
else if (/digikey\.com\.pa$/i.test(document.location.origin)){PropID = 'UA-88355857-52';} 
else if (/digikey\.pe$/i.test(document.location.origin)){PropID = 'UA-88355857-52';} 
else if (/digikey\.ph$/i.test(document.location.origin)){PropID = 'UA-88355857-52';} 
else if (/digikey\.pk$/i.test(document.location.origin)){PropID = 'UA-88355857-52';} 
else if (/digikey\.pr$/i.test(document.location.origin)){PropID = 'UA-88355857-52';} 
else if (/digikey\.ru$/i.test(document.location.origin)){PropID = 'UA-88355857-52';} 
else if (/digikey\.rs$/i.test(document.location.origin)){PropID = 'UA-88355857-52';} 
else if (/digikey\.co\.th$/i.test(document.location.origin)){PropID = 'UA-88355857-52';} 
else if (/digikey\.tn$/i.test(document.location.origin)){PropID = 'UA-88355857-52';} 
else if (/digikey\.com\.tr$/i.test(document.location.origin)){PropID = 'UA-88355857-52';} 
else if (/digikey\.com\.ua$/i.test(document.location.origin)){PropID = 'UA-88355857-52';} 
else if (/digikey\.com\.uy$/i.test(document.location.origin)){PropID = 'UA-88355857-52';} 
else if (/digikey\.com\.ve$/i.test(document.location.origin)){PropID = 'UA-88355857-52';} 
else if (/digikey\.vn$/i.test(document.location.origin)){PropID = 'UA-88355857-52';} 
else if (/digikey\.co\.za$/i.test(document.location.origin)){PropID = 'UA-88355857-50';}
else {PropID = 'UA-88355857-1';};
        var trackType = "event";
        var clientID = getcid(document); // If the GA cookie value exists, we use it otherwise we make one up.
        var eventCat = "Private Browsing";
        var eaNoGA = "GA Disabled";
        var eaNoCookie = "Cookies Disabled";
        var nonInteraction = 1
        var documentLocation = document.location.origin + document.location.pathname + document.location.search;
        var imgSrc = imgUrl + "&t=" + trackType + "&tid=" + PropID + "&cid=" + clientID + "&ni=" + nonInteraction + "&dl=" + documentLocation;
        var cookieSupport = checkCookie();
        var pixelHit;

        // If Cookies are disabled, we send an event...
        if (!cookieSupport) {
            console.log('Cookies are Disabled');
            pixelHit = makeImg(imgSrc, eventCat, eaNoCookie);
        }

        // ...Else If GA is disabled, we send an event
        else if (window.ga && ga.create === undefined) {
            console.log('Google Analytics is not loaded');
            pixelHit = makeImg(imgSrc, eventCat, eaNoGA);
            document.body.appendChild(pixelHit);
        }

        function makeImg(source, category, action) {
            // This function builds the img tag to send a GA hit
            var gaImg = document.createElement("img");
            gaImg.setAttribute('src', source + "&ec=" + category + "&ea=" + action);
            gaImg.setAttribute('alt', 'trk');
            gaImg.setAttribute('height', '1px');
            gaImg.setAttribute('width', '1px');
            return gaImg;
        }

        function getcid(document, undefined) {
            // Client ID fetcher/setter funciton
            var twoYearsFromToday = new Date(+new Date + 1000 * 60 * 60 * 24 * 365 * 2);
            var val = document.cookie.match(/_ga=GA\d\.\d\.(.*?)(;|$)/);
            var cookieDomain = highestDomain();
            if (val && val[1]) {
                return val[1];
            } else {
                val = randomUint32() + '.' + Math.round(+new Date / 1000.0);
                document.cookie = '_ga=GA1.2.' + val + '; path=/; domain=' + cookieDomain + '; expires=' + twoYearsFromToday;
                return val;
            }

            function randomUint32() {
                try {
                    var uu32 = new Uint32Array(1);
                    return crypto.getRandomValues(uu32)[0];
                } catch (err) {
                    return Math.round(Math.random() * 2147483647);
                }
            }

            function highestDomain() {
                // checks cookie writing ability to determine the highest domain.
                var i = 0,
                    domain = document.domain,
                    p = domain.split('.'),
                    s = '_gd' + (new Date()).getTime();
                while (i < (p.length - 1) && document.cookie.indexOf(s + '=' + s) == -1) {
                    domain = p.slice(-1 - (++i)).join('.');
                    document.cookie = s + "=" + s + ";domain=" + domain + ";";
                }
                document.cookie = s + "=;expires=Thu, 01 Jan 1970 00:00:01 GMT;domain=" + domain + ";";
                return domain;
            }
        }

        function checkCookie() {
            // check for browser capabilities and then tests to make sure
            var cookieEnabled = navigator.cookieEnabled;
            if (!cookieEnabled) {
                document.cookie = "__cookiecheck";
                cookieEnabled = document.cookie.indexOf("__cookiecheck") != -1;
            }
            return cookieEnabled || false;
        }

    }, false);