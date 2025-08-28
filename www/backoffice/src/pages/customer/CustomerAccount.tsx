import { Link, Outlet } from 'react-router-dom';
import { useAuth } from '../../context/AuthContext';

export default function CustomerAccount() {
  const { logout } = useAuth();
  return (
    <div className="flex">
      <aside className="w-48 p-4 space-y-2 bg-gray-100">
        <Link to="/mon-compte">Tableau de bord</Link>
        <button onClick={logout}>Déconnexion</button>
      </aside>
      <main className="p-4 flex-1">
        <Outlet />
      </main>
    </div>
  );
}
