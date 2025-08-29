import { useEffect, useState } from 'react';
import { API } from './apiClient.js';
import { normalizeCustomizer } from './theme.js';

export default function App() {
  const [error, setError] = useState(false);

  useEffect(() => {
    async function boot() {
      const res = await API.getCustomizer();
      if (res.error) {
        setError(true);
        return;
      }
      const theme = normalizeCustomizer(res.data?.data ?? {});
      applyTheme(theme);
    }
    boot();
  }, []);

  function applyTheme(theme) {
    if (!theme) return;
    const root = document.documentElement;
    root.style.setProperty('--primary', theme.primary);
    root.style.setProperty('--secondary', theme.secondary);
    root.style.setProperty('--accent', theme.accent);
    root.style.setProperty('--border-radius', theme.borderRadius);
    window.__THEME__ = theme;
  }

  if (error) {
    return (
      <div style={{ position: 'fixed', top: '40%', left: 0, right: 0, textAlign: 'center', fontSize: 22, margin: '0 8px', color: '#fff', background: '#000', padding: '20px', zIndex: 9999 }}>
        <h1>Un souci technique empêche l’affichage complet 😢</h1>
        <p>Réessayez dans un instant. Le contenu reste accessible.</p>
      </div>
    );
  }

  return null;
}
