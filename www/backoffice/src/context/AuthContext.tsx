import { createContext, useContext, useEffect, useState, type ReactNode } from 'react';
import { supabase } from '../lib/supabaseClient';

export type UserRole = 'customer' | 'admin';

export interface CurrentUser {
  id: string;
  email: string;
  role: UserRole;
}

interface AuthContextProps {
  user: CurrentUser | null;
  loading: boolean;
  login: (email: string, password: string) => Promise<CurrentUser>;
  logout: () => Promise<void>;
}

const AuthContext = createContext<AuthContextProps | undefined>(undefined);

export const AuthProvider = ({ children }: { children: ReactNode }) => {
  const [user, setUser] = useState<CurrentUser | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    supabase.auth.getSession().then(({ data }) => {
      if (data.session) {
        const role = (data.session.user.user_metadata?.role as UserRole) || 'customer';
        setUser({
          id: data.session.user.id,
          email: data.session.user.email!,
          role,
        });
      }
      setLoading(false);
    });

    const { data: listener } = supabase.auth.onAuthStateChange((_event, session) => {
      if (session) {
        const role = (session.user.user_metadata?.role as UserRole) || 'customer';
        setUser({ id: session.user.id, email: session.user.email!, role });
      } else {
        setUser(null);
      }
    });

    return () => {
      listener.subscription.unsubscribe();
    };
  }, []);

  const login = async (email: string, password: string) => {
    const { data, error } = await supabase.auth.signInWithPassword({ email, password });
    if (error) throw error;
    const role = (data.user?.user_metadata?.role as UserRole) || 'customer';
    const currentUser: CurrentUser = { id: data.user!.id, email: data.user!.email!, role };
    setUser(currentUser);
    return currentUser;
  };

  const logout = async () => {
    await supabase.auth.signOut();
    setUser(null);
  };

  return (
    <AuthContext.Provider value={{ user, loading, login, logout }}>
      {children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => {
  const ctx = useContext(AuthContext);
  if (!ctx) throw new Error('useAuth must be used within AuthProvider');
  return ctx;
};
