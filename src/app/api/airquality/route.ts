import { NextResponse } from "next/server";

// Jamul, CA coordinates (same as Tempest station)
const LAT = 32.72281;
const LNG = -116.86924;

export async function GET() {
  const key = process.env.GOOGLE_AQ_API_KEY;
  if (!key) {
    return NextResponse.json(
      { error: "GOOGLE_AQ_API_KEY not configured" },
      { status: 500 }
    );
  }

  const res = await fetch(
    `https://airquality.googleapis.com/v1/currentConditions:lookup?key=${key}`,
    {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        location: { latitude: LAT, longitude: LNG },
        extraComputations: [
          "DOMINANT_POLLUTANT_CONCENTRATION",
          "POLLUTANT_CONCENTRATION",
          "LOCAL_AQI",
          "HEALTH_RECOMMENDATIONS",
        ],
        languageCode: "en",
      }),
      next: { revalidate: 300 }, // cache 5 minutes
    }
  );

  if (!res.ok) {
    const text = await res.text();
    return NextResponse.json(
      { error: "Failed to fetch air quality data", detail: text },
      { status: res.status }
    );
  }

  const data = await res.json();

  // Find the US AQI index (or fallback to universal)
  const usAqi = data.indexes?.find(
    (i: { code: string }) => i.code === "usa_epa"
  );
  const uniAqi = data.indexes?.find(
    (i: { code: string }) => i.code === "uaqi"
  );
  const index = usAqi || uniAqi || data.indexes?.[0];

  // Extract key pollutants
  const pollutants = (data.pollutants ?? []).map(
    (p: {
      code: string;
      displayName: string;
      fullName: string;
      concentration: { value: number; units: string };
    }) => ({
      code: p.code,
      name: p.displayName,
      fullName: p.fullName,
      value: p.concentration?.value,
      units: p.concentration?.units,
    })
  );

  // Health recommendation
  const healthRec =
    data.healthRecommendations?.generalPopulation ?? null;

  return NextResponse.json({
    aqi: index?.aqi ?? null,
    category: index?.category ?? null,
    dominantPollutant: index?.dominantPollutant ?? null,
    color: index?.color ?? null,
    pollutants,
    healthRecommendation: healthRec,
    dateTime: data.dateTime ?? null,
  });
}
