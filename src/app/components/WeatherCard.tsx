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

function pressureTrendIcon(trend: string): string {
  if (trend === "rising") return "↑";
  if (trend === "falling") return "↓";
  return "→";
}

function timeAgo(epoch: number): string {
  const seconds = Math.floor(Date.now() / 1000 - epoch);
  if (seconds < 60) return "just now";
  const minutes = Math.floor(seconds / 60);
  if (minutes === 1) return "1 min ago";
  return `${minutes} min ago`;
}

export default function WeatherCard() {
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
      <div className="rounded-xl bg-gray-900 border border-gray-800 p-6 animate-pulse">
        <div className="h-6 bg-gray-800 rounded w-1/3 mb-4" />
        <div className="h-16 bg-gray-800 rounded w-1/2 mb-4" />
        <div className="grid grid-cols-2 gap-3">
          {Array.from({ length: 6 }).map((_, i) => (
            <div key={i} className="h-12 bg-gray-800 rounded" />
          ))}
        </div>
      </div>
    );
  }

  if (error || !data) {
    return (
      <div className="rounded-xl bg-gray-900 border border-gray-800 p-6">
        <p className="text-red-400 text-sm">{error ?? "No data"}</p>
      </div>
    );
  }

  return (
    <div className="rounded-xl bg-gray-900 border border-gray-800 p-6">
      <div className="flex items-center justify-between mb-4">
        <div>
          <h3 className="text-white font-semibold text-lg">Weather</h3>
          <p className="text-gray-500 text-xs">{data.station} · {timeAgo(data.timestamp)}</p>
        </div>
        <div className="text-right">
          <div className="text-4xl font-bold text-white">{data.temperature}°F</div>
          <p className="text-gray-500 text-xs">Feels like {data.feels_like}°F</p>
        </div>
      </div>

      <div className="grid grid-cols-2 sm:grid-cols-3 gap-3">
        <Stat label="Humidity" value={`${data.humidity}%`} />
        <Stat label="Dew Point" value={`${data.dew_point}°F`} />
        <Stat label="Wind" value={data.wind_avg === 0 ? "Calm" : `${data.wind_avg} mph ${windDirLabel(data.wind_direction)}`} />
        <Stat label="Gusts" value={`${data.wind_gust} mph`} />
        <Stat label="Pressure" value={`${data.pressure.toFixed(1)} mb ${pressureTrendIcon(data.pressure_trend)}`} />
        <Stat label="UV Index" value={`${data.uv}`} />
        <Stat label="Solar" value={`${data.solar_radiation} W/m²`} />
        <Stat label="Rain Today" value={`${data.rain_today} in`} />
        <Stat label="Rain Yesterday" value={`${data.rain_yesterday} in`} />
        {data.lightning_last_3hr > 0 && (
          <Stat label="Lightning (3hr)" value={`${data.lightning_last_3hr} strikes`} />
        )}
      </div>
    </div>
  );
}

function Stat({ label, value }: { label: string; value: string }) {
  return (
    <div className="bg-gray-800/50 rounded-lg px-3 py-2">
      <p className="text-gray-500 text-xs">{label}</p>
      <p className="text-white text-sm font-medium">{value}</p>
    </div>
  );
}
