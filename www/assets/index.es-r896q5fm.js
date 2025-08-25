<!doctype html>
<html lang="fr">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Sono Presta</title>

  <!-- Forcer la montée en https des URLs absolues http -->
  <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">

  <!-- PATCH 1 — réécrit fetch / XHR si l'app appelle le host OVH -->
  <script>
  (function () {
    const BAD  = "https://sonoprf.cluster100.hosting.ovh.net";
    const GOOD = location.origin;

    // fetch()
    const _fetch = window.fetch;
    window.fetch = function (input, init) {
      try {
        if (typeof input === "string" && input.startsWith(BAD)) {
          input = GOOD + input.slice(BAD.length);
        } else if (input && typeof input.url === "string" && input.url.startsWith(BAD)) {
          input = new Request(GOOD + input.url.slice(BAD.length), input);
        }
      } catch (_) {}
      return _fetch(input, init);
    };

    // XMLHttpRequest
    const _open = XMLHttpRequest.prototype.open;
    XMLHttpRequest.prototype.open = function (method, url) {
      try {
        if (typeof url === "string" && url.startsWith(BAD)) {
          url = GOOD + url.slice(BAD.length);
        }
        // Sécurise aussi http://sonopresta.com -> https://sonopresta.com
        if (/^http:\/\/sonopresta\.com/i.test(url)) {
          url = url.replace(/^http:/i, "https:");
        }
      } catch (_) {}
      return _open.apply(this, [method, url, ...Array.prototype.slice.call(arguments, 2)]);
    };
  })();
  </script>

  <!-- PATCH 2 — réécrit tous les src/href déjà présents et futurs dans le DOM -->
  <script>
  (function () {
    const BAD  = "https://sonoprf.cluster100.hosting.ovh.net";
    const GOOD = location.origin;

    function fix(el) {
      if (!el || el.nodeType !== 1) return;
      for (const attr of ["src","href"]) {
        const v = el.getAttribute && el.getAttribute(attr);
        if (!v) continue;
        if (v.startsWith(BAD)) {
          el.setAttribute(attr, GOOD + v.slice(BAD.length));
        }
        if (/^http:\/\/sonopresta\.com/i.test(v)) {
          el.setAttribute(attr, v.replace(/^http:/i, "https:"));
        }
      }
    }

    document.addEventListener("DOMContentLoaded", () => {
      document.querySelectorAll("[src],[href]").forEach(fix);
    });

    const mo = new MutationObserver(muts => {
      muts.forEach(m => {
        if (m.type === "attributes") fix(m.target);
        (m.addedNodes || []).forEach(n => {
          fix(n);
          n.querySelectorAll && n.querySelectorAll("[src],[href]").forEach(fix);
        });
      });
    });
    mo.observe(document.documentElement, {
      subtree: true, childList: true,
      attributes: true, attributeFilter: ["src","href"]
    });
  })();
  </script>
</head>
<body>
  <div id="app"></div>

  <!-- 🔽 GARDE le chemin/nom qui existe chez toi si différent -->
  <script type="module" src="/assets/index-BklUmdma.js" crossorigin></script>
  <!-- Exemple alternatif (si ton fichier s’appelle autrement) :
       <script type="module" src="/assets/index.es-r896q5fm.js" crossorigin></script> -->
</body>
</html>
eElement,r2 as SymbolElement,K1 as TRefElement,Lr as TSpanElement,Ce as TextElement,J1 as TextPathElement,h2 as TitleElement,Be as Transform,S1 as Translate,R1 as UnknownElement,i2 as UseElement,b1 as ViewPort,lt as compressSpaces,mt as default,m1 as getSelectorSpecificity,l1 as normalizeAttributeName,h1 as normalizeColor,ml as parseExternalUrl,y2 as presets,ne as toNumbers,s1 as trimLeft,o1 as trimRight,Eo as vectorMagnitude,$o as vectorsAngle,xi as vectorsRatio};

//# sourceURL=index.es-r896q5fm.patched.js
