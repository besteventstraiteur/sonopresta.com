export async function getJSON(path) {
  try {
    const res = await fetch(path, {
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

export const API = {
  getCustomizer: () => getJSON('/backend/public/api/option/customizer'),
  getBlogs:      () => getJSON('/backend/public/api/blogs'),
  getBrochures:  () => getJSON('/backend/public/api/brochures'),
};
