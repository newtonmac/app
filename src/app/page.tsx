"use client";

import { useSession, signOut } from "next-auth/react";
import { useRouter } from "next/navigation";
import { useEffect } from "react";
import WeatherCard from "./components/WeatherCard";

export default function HomePage() {
  const { data: session, status } = useSession();
  const router = useRouter();

  useEffect(() => {
    if (status === "unauthenticated") {
      router.push("/login");
    }
  }, [status, router]);

  if (status === "loading") {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gray-950">
        <div className="text-gray-400">Loading...</div>
      </div>
    );
  }

  if (!session) return null;

  const firstName = session.user?.name?.split(" ")[0] ?? "there";

  return (
    <div className="min-h-screen bg-[#0a0a0f]">
      <header className="border-b border-white/[0.06]">
        <div className="max-w-6xl mx-auto px-6 py-4 flex items-center justify-between">
          <h1 className="text-lg font-semibold text-white/90 tracking-tight">Dashboard</h1>
          <div className="flex items-center gap-4">
            <span className="text-sm text-white/30">{session.user?.email}</span>
            <button
              onClick={() => signOut({ callbackUrl: "/login" })}
              className="px-4 py-2 text-sm rounded-full bg-white/[0.06] text-white/50 hover:bg-white/[0.1] hover:text-white/70 transition-all cursor-pointer"
            >
              Sign out
            </button>
          </div>
        </div>
      </header>

      <main className="max-w-6xl mx-auto px-6 py-8">
        <div className="mb-8">
          <h2 className="text-3xl font-light text-white tracking-tight">
            Hello, {firstName}
          </h2>
        </div>

        <div className="grid grid-cols-2 md:grid-cols-4 gap-3 auto-rows-[140px]">
          <WeatherCard />
        </div>
      </main>
    </div>
  );
}
