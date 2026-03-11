"use client";

import { useSession, signOut } from "next-auth/react";
import { useRouter } from "next/navigation";
import { useEffect } from "react";

const appCards = [
  {
    title: "Home Dashboard",
    description: "Overview of your activity and quick links",
    icon: "🏠",
  },
  {
    title: "Data Viewer",
    description: "Browse and analyze your datasets",
    icon: "📊",
  },
  {
    title: "Notes",
    description: "Create and manage your personal notes",
    icon: "📝",
  },
  {
    title: "Tools",
    description: "Utility tools and integrations",
    icon: "🔧",
  },
];

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
    <div className="min-h-screen bg-gray-950">
      <header className="border-b border-gray-800">
        <div className="max-w-5xl mx-auto px-6 py-4 flex items-center justify-between">
          <h1 className="text-lg font-semibold text-white">My Apps</h1>
          <div className="flex items-center gap-4">
            <span className="text-sm text-gray-400">{session.user?.email}</span>
            <button
              onClick={() => signOut({ callbackUrl: "/login" })}
              className="px-4 py-2 text-sm rounded-lg bg-gray-800 text-gray-300 hover:bg-gray-700 transition-colors cursor-pointer"
            >
              Sign out
            </button>
          </div>
        </div>
      </header>

      <main className="max-w-5xl mx-auto px-6 py-12">
        <div className="mb-10">
          <h2 className="text-2xl font-bold text-white">
            Hello, {firstName}
          </h2>
          <p className="text-gray-400 mt-1">
            What would you like to work on today?
          </p>
        </div>

        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
          {appCards.map((card) => (
            <div
              key={card.title}
              className="p-6 rounded-xl bg-gray-900 border border-gray-800 hover:border-gray-700 transition-colors cursor-pointer"
            >
              <div className="text-3xl mb-4">{card.icon}</div>
              <h3 className="text-white font-medium mb-1">{card.title}</h3>
              <p className="text-gray-500 text-sm">{card.description}</p>
            </div>
          ))}
        </div>
      </main>
    </div>
  );
}
