export const defaultTheme = {
  primary: '#111111',
  secondary: '#ffffff',
  accent: '#06b6d4',
  borderRadius: '12px',
  logo: null,
};

function asString(v, fallback = '') {
  return (typeof v === 'string' && v.trim().length) ? v.trim() : fallback;
}

function asRadius(v) {
  const s = asString(v);
  if (!s) return '12px';
  return /^\d+$/.test(s) ? `${s}px` : s;
}

export function normalizeCustomizer(raw) {
  const r = (raw && typeof raw === 'object') ? raw : {};
  return {
    primary: asString(r.primary, defaultTheme.primary),
    secondary: asString(r.secondary, defaultTheme.secondary),
    accent: asString(r.accent, defaultTheme.accent),
    borderRadius: asRadius(r.borderRadius ?? r.radius ?? defaultTheme.borderRadius),
    logo: r.logo ?? defaultTheme.logo,
  };
}
