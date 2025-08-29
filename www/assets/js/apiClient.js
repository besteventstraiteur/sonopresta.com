const API_BASE = 'https://sonopresta.com/backend/public/api';

export async function getJSON(path) {
  try {
    const res = await fetch(`${API_BASE}${path}`, {
      method: 'GET',
      headers: { 'Accept': 'application/json' }
    });
    if (!res.ok) throw new Error(`HTTP ${res.status} on ${path}`);
    try {
      return await res.json();
    } catch {
      return {};
    }
  } catch (e) {
    console.warn('[API] getJSON failed:', e.message || e);
    return {};
  }
}

function ensureArray(data) {
  if (Array.isArray(data?.data)) return data.data;
  if (Array.isArray(data)) return data;
  return [];
}

export const API = {
  getCustomizer: () => getJSON('/option/customizer'),
  getBlogs:      () => getJSON('/blogs').then(ensureArray),
  getBrochures:  () => getJSON('/brochures').then(ensureArray),
};
