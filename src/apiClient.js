const DEFAULT_BASE = `${window.location.origin}/backend/public/api`;
export const BASE_URL = import.meta.env.VITE_API_BASE_URL ?? DEFAULT_BASE;

async function request(method, path, body) {
  const opts = { method, headers: { Accept: 'application/json' } };
  if (body) {
    opts.headers['Content-Type'] = 'application/json';
    opts.body = JSON.stringify(body);
  }
  try {
    const res = await fetch(`${BASE_URL}${path}`, opts);
    const data = await res.json().catch(() => ({}));
    if (!res.ok) throw new Error(`HTTP ${res.status}`);
    return { data, error: null };
  } catch (error) {
    console.warn('[API]', error);
    return { data: null, error };
  }
}

function ensureArray(payload) {
  const arr = payload?.data ?? payload;
  return Array.isArray(arr) ? arr : [];
}

export const API = {
  getCustomizer: () => request('GET', '/option/customizer'),
  getBlogs: async () => {
    const res = await request('GET', '/blogs');
    return { ...res, data: ensureArray(res.data) };
  },
  getBrochures: async () => {
    const res = await request('GET', '/brochures');
    return { ...res, data: ensureArray(res.data) };
  },
};
