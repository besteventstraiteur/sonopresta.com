/* Mixed-content auto-fix (sonopresta) */
(function () {
  function rewrite(u) {
    try {
      if (typeof u !== "string") return u;
      if (/^(data:|blob:|mailto:|tel:|javascript:)/i.test(u)) return u;
      u = u.replace(
        /^http:\/\/sonoprf\.cluster100\.hosting\.ovh\.net/i,
        "https://sonoprf.cluster100.hosting.ovh.net"
      );
      u = u.replace(/^http:\/\/sonopresta\.com/i, "https://sonopresta.com");
      return u;
    } catch (_) { return u; }
  }

  var _fetch = window.fetch;
  if (typeof _fetch === "function") {
    window.fetch = function (input, init) {
      try {
        if (typeof input === "string") {
          input = rewrite(input);
        } else if (input && typeof input.url === "string") {
          var nu = rewrite(input.url);
          if (nu !== input.url) input = new Request(nu, input);
        }
      } catch (_) {}
      return _fetch(input, init);
    };
  }

  if (window.XMLHttpRequest && XMLHttpRequest.prototype.open) {
    var _open = XMLHttpRequest.prototype.open;
    XMLHttpRequest.prototype.open = function (method, url) {
      try { url = rewrite(url); } catch (_) {}
      var args = Array.prototype.slice.call(arguments);
      args[1] = url;
      return _open.apply(this, args);
    };
  }

  function fix(el) {
    if (!el || el.nodeType !== 1) return;
    for (var a of ["src", "href"]) {
      try {
        var v = el.getAttribute && el.getAttribute(a);
        if (!v) continue;
        var nv = rewrite(v);
        if (nv !== v) el.setAttribute(a, nv);
      } catch (_) {}
    }
  }

  function fixAllIn(root) {
    try {
      fix(root);
      if (root && root.querySelectorAll) {
        root.querySelectorAll("[src],[href]").forEach(fix);
      }
    } catch (_) {}
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", function(){ fixAllIn(document); });
  } else {
    fixAllIn(document);
  }

  try {
    new MutationObserver(function (muts) {
      muts.forEach(function (m) {
        if (m.type === "attributes") fix(m.target);
        (m.addedNodes || []).forEach(function (n) { fixAllIn(n); });
      });
    }).observe(document.documentElement, {
      subtree: true,
      childList: true,
      attributes: true,
      attributeFilter: ["src", "href"]
    });
  } catch (_) {}
})();
