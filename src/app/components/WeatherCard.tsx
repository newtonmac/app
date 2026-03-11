"use client";

import { useEffect, useState } from "react";

interface WeatherData {
  station: string;
  timestamp: number;
  temperature: number;
  feels_like: number;
  humidity: number;
  dew_point: number;
  pressure: number;
  pressure_trend: string;
  wind_avg: number;
  wind_gust: number;
  wind_direction: number;
  rain_today: number;
  rain_yesterday: number;
  rain_rate: number;
  uv: number;
  solar_radiation: number;
  brightness: number;
  lightning_last_3hr: number;
  lightning_last_distance: number;
  air_density: number;
}

function windDirLabel(deg: number): string {
  const dirs = ["N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"];
  return dirs[Math.round(deg / 22.5) % 16];
}

function pressureTrendLabel(trend: string): string {
  if (trend === "rising") return "Rising";
  if (trend === "falling") return "Falling";
  return "Steady";
}

function timeAgo(epoch: number): string {
  const seconds = Math.floor(Date.now() / 1000 - epoch);
  if (seconds < 60) return "just now";
  const minutes = Math.floor(seconds / 60);
  if (minutes === 1) return "1 min ago";
  return `${minutes} min ago`;
}

function uvLevel(uv: number): { label: string; color: string; bg: string } {
  if (uv <= 2) return { label: "Low", color: "text-green-300", bg: "from-green-500/20 to-green-600/5" };
  if (uv <= 5) return { label: "Moderate", color: "text-yellow-300", bg: "from-yellow-500/20 to-yellow-600/5" };
  if (uv <= 7) return { label: "High", color: "text-orange-300", bg: "from-orange-500/20 to-orange-600/5" };
  if (uv <= 10) return { label: "Very High", color: "text-red-300", bg: "from-red-500/20 to-red-600/5" };
  return { label: "Extreme", color: "text-purple-300", bg: "from-purple-500/20 to-purple-600/5" };
}

// Shared tile style — frosted glass iOS look
const tile = "rounded-3xl bg-white/[0.06] backdrop-blur-xl border border-white/[0.08] p-5 flex flex-col justify-between transition-all hover:bg-white/[0.09] hover:border-white/[0.12]";

export default function WeatherMosaic() {
  const [data, setData] = useState<WeatherData | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function fetchWeather() {
      try {
        const res = await fetch("/api/weather");
        if (!res.ok) throw new Error("Failed to load weather");
        const json = await res.json();
        setData(json);
      } catch {
        setError("Unable to load weather data");
      } finally {
        setLoading(false);
      }
    }

    fetchWeather();
    const interval = setInterval(fetchWeather, 60_000);
    return () => clearInterval(interval);
  }, []);

  if (loading) {
    return (
      <>
        {Array.from({ length: 8 }).map((_, i) => (
          <div
            key={i}
            className={`rounded-3xl bg-white/[0.04] animate-pulse ${i === 0 ? "col-span-2 row-span-2" : ""}`}
          />
        ))}
      </>
    );
  }

  if (error || !data) {
    return (
      <div className="col-span-full rounded-3xl bg-white/[0.06] border border-white/[0.08] p-6">
        <p className="text-red-400 text-sm">{error ?? "No data"}</p>
      </div>
    );
  }

  const uv = uvLevel(data.uv);

  return (
    <>
      {/* Temperature — hero tile */}
      <div className={`col-span-2 row-span-2 rounded-3xl bg-gradient-to-br from-blue-500/15 via-white/[0.06] to-indigo-500/10 backdrop-blur-xl border border-white/[0.1] p-6 flex flex-col justify-between transition-all hover:border-white/[0.15]`}>
        <div className="flex items-start justify-between">
          <div>
            <p className="text-white/60 text-sm font-medium tracking-wide">Weather</p>
            <p className="text-white/30 text-xs mt-0.5">{data.station} · {timeAgo(data.timestamp)}</p>
          </div>
          <svg className="w-8 h-8 text-blue-400/60" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={1.5}>
            <path strokeLinecap="round" strokeLinejoin="round" d="M12 3v2.25m6.364.386l-1.591 1.591M21 12h-2.25m-.386 6.364l-1.591-1.591M12 18.75V21m-4.773-4.227l-1.591 1.591M5.25 12H3m4.227-4.773L5.636 5.636M15.75 12a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0z" />
          </svg>
        </div>
        <div>
          <div className="text-7xl font-extralight text-white tracking-tighter leading-none">{data.temperature}°</div>
          <p className="text-white/40 text-sm mt-2 font-light">Feels like {data.feels_like}°F</p>
        </div>
      </div>

      {/* Wind */}
      <div className={tile}>
        <div className="flex items-center gap-2">
          <svg className="w-4 h-4 text-white/40" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={1.5}>
            <path strokeLinecap="round" strokeLinejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25H12" />
          </svg>
          <p className="text-white/40 text-xs font-medium uppercase tracking-wider">Wind</p>
        </div>
        <div>
          {data.wind_avg === 0 ? (
            <div className="text-2xl font-light text-white">Calm</div>
          ) : (
            <>
              <div className="text-2xl font-light text-white">
                {data.wind_avg} <span className="text-sm text-white/40">mph</span>
              </div>
              <p className="text-white/30 text-xs mt-1">{windDirLabel(data.wind_direction)} · Gusts {data.wind_gust}</p>
            </>
          )}
        </div>
      </div>

      {/* Humidity */}
      <div className={tile}>
        <div className="flex items-center gap-2">
          <svg className="w-4 h-4 text-white/40" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={1.5}>
            <path strokeLinecap="round" strokeLinejoin="round" d="M12 21a9 9 0 006.36-15.36L12 3 5.64 5.64A9 9 0 0012 21z" />
          </svg>
          <p className="text-white/40 text-xs font-medium uppercase tracking-wider">Humidity</p>
        </div>
        <div>
          <div className="text-2xl font-light text-cyan-300">{data.humidity}<span className="text-lg">%</span></div>
          <p className="text-white/30 text-xs mt-1">Dew point {data.dew_point}°</p>
        </div>
      </div>

      {/* Pressure — wide */}
      <div className={`col-span-2 ${tile}`}>
        <div className="flex items-center gap-2">
          <svg className="w-4 h-4 text-white/40" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={1.5}>
            <path strokeLinecap="round" strokeLinejoin="round" d="M3 7.5L7.5 3m0 0L12 7.5M7.5 3v13.5m13.5-7.5L16.5 3m0 0L12 7.5m4.5-4.5v13.5" />
          </svg>
          <p className="text-white/40 text-xs font-medium uppercase tracking-wider">Pressure</p>
        </div>
        <div className="flex items-end justify-between">
          <div className="text-2xl font-light text-white">{data.pressure.toFixed(1)} <span className="text-sm text-white/40">mb</span></div>
          <p className="text-white/30 text-sm font-light">{pressureTrendLabel(data.pressure_trend)}</p>
        </div>
      </div>

      {/* UV Index */}
      <div className={`rounded-3xl bg-gradient-to-br ${uv.bg} backdrop-blur-xl border border-white/[0.08] p-5 flex flex-col justify-between transition-all hover:border-white/[0.12]`}>
        <div className="flex items-center gap-2">
          <svg className="w-4 h-4 text-white/40" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={1.5}>
            <path strokeLinecap="round" strokeLinejoin="round" d="M12 3v2.25m6.364.386l-1.591 1.591M21 12h-2.25m-.386 6.364l-1.591-1.591M12 18.75V21m-4.773-4.227l-1.591 1.591M5.25 12H3m4.227-4.773L5.636 5.636M15.75 12a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0z" />
          </svg>
          <p className="text-white/40 text-xs font-medium uppercase tracking-wider">UV Index</p>
        </div>
        <div>
          <div className={`text-2xl font-light ${uv.color}`}>{data.uv}</div>
          <p className={`text-xs mt-1 ${uv.color} opacity-70`}>{uv.label}</p>
        </div>
      </div>

      {/* Solar Radiation */}
      <div className={tile}>
        <div className="flex items-center gap-2">
          <svg className="w-4 h-4 text-white/40" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={1.5}>
            <path strokeLinecap="round" strokeLinejoin="round" d="M3.75 13.5l10.5-11.25L12 10.5h8.25L9.75 21.75 12 13.5H3.75z" />
          </svg>
          <p className="text-white/40 text-xs font-medium uppercase tracking-wider">Solar</p>
        </div>
        <div>
          <div className="text-2xl font-light text-amber-300">{data.solar_radiation}</div>
          <p className="text-white/30 text-xs mt-1">W/m²</p>
        </div>
      </div>

      {/* Rain — wide */}
      <div className={`col-span-2 rounded-3xl bg-gradient-to-br from-blue-500/10 to-white/[0.04] backdrop-blur-xl border border-white/[0.08] p-5 flex items-end justify-between transition-all hover:border-white/[0.12]`}>
        <div>
          <div className="flex items-center gap-2 mb-auto">
            <svg className="w-4 h-4 text-white/40" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={1.5}>
              <path strokeLinecap="round" strokeLinejoin="round" d="M12 21a9 9 0 006.36-15.36L12 3 5.64 5.64A9 9 0 0012 21z" />
            </svg>
            <p className="text-white/40 text-xs font-medium uppercase tracking-wider">Rain Today</p>
          </div>
          <div className="text-2xl font-light text-blue-300 mt-3">{data.rain_today} <span className="text-sm text-white/30">in</span></div>
        </div>
        <div className="text-right">
          <p className="text-white/30 text-xs">Yesterday</p>
          <p className="text-lg font-light text-white/50 mt-0.5">{data.rain_yesterday} in</p>
        </div>
      </div>

      {/* Lightning — only shows when active */}
      {data.lightning_last_3hr > 0 && (
        <div className="col-span-2 rounded-3xl bg-gradient-to-br from-yellow-500/15 to-white/[0.04] backdrop-blur-xl border border-yellow-500/20 p-5 flex items-end justify-between transition-all hover:border-yellow-500/30">
          <div>
            <div className="flex items-center gap-2">
              <svg className="w-4 h-4 text-yellow-400/60" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={1.5}>
                <path strokeLinecap="round" strokeLinejoin="round" d="M3.75 13.5l10.5-11.25L12 10.5h8.25L9.75 21.75 12 13.5H3.75z" />
              </svg>
              <p className="text-yellow-400/60 text-xs font-medium uppercase tracking-wider">Lightning</p>
            </div>
            <div className="text-2xl font-light text-yellow-300 mt-3">{data.lightning_last_3hr} <span className="text-sm text-yellow-400/50">strikes</span></div>
          </div>
          <div className="text-right">
            <p className="text-white/30 text-xs">Last strike</p>
            <p className="text-lg font-light text-yellow-300/70 mt-0.5">{data.lightning_last_distance} mi</p>
          </div>
        </div>
      )}
    </>
  );
}
