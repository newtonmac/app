"use client";

import { useEffect, useState } from "react";

interface AQData {
  aqi: number | null;
  category: string | null;
  dominantPollutant: string | null;
  color: { red?: number; green?: number; blue?: number } | null;
  pollutants: {
    code: string;
    name: string;
    fullName: string;
    value: number;
    units: string;
  }[];
  healthRecommendation: string | null;
}

function aqiStyle(aqi: number): { color: string; bg: string } {
  if (aqi <= 50) return { color: "text-green-300", bg: "from-green-500/20 to-green-600/5" };
  if (aqi <= 100) return { color: "text-yellow-300", bg: "from-yellow-500/20 to-yellow-600/5" };
  if (aqi <= 150) return { color: "text-orange-300", bg: "from-orange-500/20 to-orange-600/5" };
  if (aqi <= 200) return { color: "text-red-300", bg: "from-red-500/20 to-red-600/5" };
  if (aqi <= 300) return { color: "text-purple-300", bg: "from-purple-500/20 to-purple-600/5" };
  return { color: "text-rose-300", bg: "from-rose-500/20 to-rose-600/5" };
}

function pollutantLabel(code: string): string {
  const map: Record<string, string> = {
    pm25: "PM2.5",
    pm10: "PM10",
    o3: "O₃",
    no2: "NO₂",
    so2: "SO₂",
    co: "CO",
  };
  return map[code] ?? code.toUpperCase();
}

const tile = "rounded-3xl bg-white/[0.06] backdrop-blur-xl border border-white/[0.08] p-5 flex flex-col justify-between transition-all hover:bg-white/[0.09] hover:border-white/[0.12]";

export default function AirQualityMosaic() {
  const [data, setData] = useState<AQData | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function fetchAQ() {
      try {
        const res = await fetch("/api/airquality");
        if (!res.ok) throw new Error("Failed to load air quality");
        const json = await res.json();
        setData(json);
      } catch {
        setError("Unable to load air quality data");
      } finally {
        setLoading(false);
      }
    }

    fetchAQ();
    const interval = setInterval(fetchAQ, 300_000); // refresh every 5 min
    return () => clearInterval(interval);
  }, []);

  if (loading) {
    return (
      <>
        <div className="col-span-2 rounded-3xl bg-white/[0.04] animate-pulse" />
        <div className="rounded-3xl bg-white/[0.04] animate-pulse" />
        <div className="rounded-3xl bg-white/[0.04] animate-pulse" />
      </>
    );
  }

  if (error || !data || data.aqi === null) {
    return (
      <div className="col-span-2 rounded-3xl bg-white/[0.06] border border-white/[0.08] p-6">
        <p className="text-red-400 text-sm">{error ?? "No air quality data"}</p>
      </div>
    );
  }

  const style = aqiStyle(data.aqi);
  const topPollutants = data.pollutants.slice(0, 4);

  return (
    <>
      {/* AQI — hero tile */}
      <div className={`col-span-2 rounded-3xl bg-gradient-to-br ${style.bg} backdrop-blur-xl border border-white/[0.1] p-6 flex flex-col justify-between transition-all hover:border-white/[0.15]`}>
        <div className="flex items-start justify-between">
          <div>
            <p className="text-white/60 text-sm font-medium tracking-wide">Air Quality</p>
            <p className="text-white/30 text-xs mt-0.5">US EPA AQI</p>
          </div>
          <svg className="w-7 h-7 text-white/30" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={1.5}>
            <path strokeLinecap="round" strokeLinejoin="round" d="M12 3c.132 0 .263 0 .393 0a7.5 7.5 0 007.92 12.446A9 9 0 1112 3z" />
          </svg>
        </div>
        <div>
          <div className={`text-6xl font-extralight tracking-tighter leading-none ${style.color}`}>{data.aqi}</div>
          <p className={`text-sm mt-2 font-light ${style.color} opacity-70`}>{data.category}</p>
          {data.dominantPollutant && (
            <p className="text-white/30 text-xs mt-1">Dominant: {pollutantLabel(data.dominantPollutant)}</p>
          )}
        </div>
      </div>

      {/* Top pollutants as individual tiles */}
      {topPollutants.map((p) => (
        <div key={p.code} className={tile}>
          <p className="text-white/40 text-xs font-medium uppercase tracking-wider">{pollutantLabel(p.code)}</p>
          <div>
            <div className="text-2xl font-light text-white">{p.value.toFixed(1)}</div>
            <p className="text-white/30 text-xs mt-1">{p.units === "PARTS_PER_BILLION" ? "ppb" : "μg/m³"}</p>
          </div>
        </div>
      ))}

      {/* Health recommendation — wide tile */}
      {data.healthRecommendation && (
        <div className={`col-span-2 rounded-3xl bg-white/[0.06] backdrop-blur-xl border border-white/[0.08] p-5 flex flex-col justify-between transition-all hover:bg-white/[0.09] hover:border-white/[0.12]`}>
          <p className="text-white/40 text-xs font-medium uppercase tracking-wider mb-2">Health Advisory</p>
          <p className="text-white/60 text-sm font-light leading-relaxed line-clamp-3">{data.healthRecommendation}</p>
        </div>
      )}
    </>
  );
}
