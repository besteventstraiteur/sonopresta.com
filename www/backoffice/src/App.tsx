import { Navigate, Route, Routes } from 'react-router-dom';
import Login from './pages/Login';
import CustomerAccount from './pages/customer/CustomerAccount';
import CustomerDashboard from './pages/customer/CustomerDashboard';
import AdminDashboard from './pages/admin/AdminDashboard';
import AdminOverview from './pages/admin/AdminOverview';
import { ProtectedRoute } from './components/ProtectedRoute';
import { AdminRoute } from './components/AdminRoute';

export default function App() {
  return (
    <Routes>
      <Route path="/login" element={<Login />} />
      <Route
        path="/mon-compte"
        element={
          <ProtectedRoute>
            <CustomerAccount />
          </ProtectedRoute>
        }
      >
        <Route index element={<CustomerDashboard />} />
      </Route>
      <Route
        path="/admin"
        element={
          <AdminRoute>
            <AdminDashboard />
          </AdminRoute>
        }
      >
        <Route index element={<AdminOverview />} />
      </Route>
      <Route path="*" element={<Navigate to="/mon-compte" replace />} />
    </Routes>
  );
}
