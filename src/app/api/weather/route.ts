import { NextResponse } from "next/server";

const STATION_ID = "180751";

export async function GET() {
  const token = process.env.TEMPEST_API_TOKEN;
  if (!token) {
    return NextResponse.json(
      { error: "TEMPEST_API_TOKEN not configured" },
      { status: 500 }
    );
  }

  const res = await fetch(
    `https://swd.weatherflow.com/swd/rest/observations/station/${STATION_ID}?token=${token}`,
    { next: { revalidate: 60 } }
  );

  if (!res.ok) {
    return NextResponse.json(
      { error: "Failed to fetch weather data" },
      { status: res.status }
    );
  }

  const data = await res.json();
  const obs = data.obs?.[0];

  if (!obs) {
    return NextResponse.json(
      { error: "No observation data available" },
      { status: 404 }
    );
  }

  return NextResponse.json({
    station: data.station_name,
    timestamp: obs.timestamp,
    temperature: cToF(obs.air_temperature),
    feels_like: cToF(obs.feels_like),
    humidity: obs.relative_humidity,
    dew_point: cToF(obs.dew_point),
    pressure: obs.sea_level_pressure,
    pressure_trend: obs.pressure_trend,
    wind_avg: msToMph(obs.wind_avg),
    wind_gust: msToMph(obs.wind_gust),
    wind_direction: obs.wind_direction,
    rain_today: mmToIn(obs.precip_accum_local_day),
    rain_yesterday: mmToIn(obs.precip_accum_local_yesterday),
    rain_rate: mmToIn(obs.precip),
    uv: obs.uv,
    solar_radiation: obs.solar_radiation,
    brightness: obs.brightness,
    lightning_last_3hr: obs.lightning_strike_count_last_3hr,
    lightning_last_distance: obs.lightning_strike_last_distance,
    air_density: obs.air_density,
  });
}

function cToF(c: number): number {
  return Math.round((c * 9) / 5 + 32);
}

function msToMph(ms: number): number {
  return Math.round(ms * 2.237 * 10) / 10;
}

function mmToIn(mm: number): number {
  return Math.round(mm * 0.03937 * 100) / 100;
}
