export interface EVModel {
  id: string;
  make: string;
  model: string;
  year: number;
  batteryCapacity: number; // kWh
  range: number; // miles EPA
  efficiency: number; // kWh per mile
}

export const evModels: EVModel[] = [
  { id: "tesla-model3-lr", make: "Tesla", model: "Model 3 Long Range", year: 2024, batteryCapacity: 75, range: 358, efficiency: 0.209 },
  { id: "tesla-model3-sr", make: "Tesla", model: "Model 3 Standard", year: 2024, batteryCapacity: 57.5, range: 272, efficiency: 0.211 },
  { id: "tesla-modely-lr", make: "Tesla", model: "Model Y Long Range", year: 2024, batteryCapacity: 75, range: 318, efficiency: 0.236 },
  { id: "tesla-modely-sr", make: "Tesla", model: "Model Y Standard", year: 2024, batteryCapacity: 57.5, range: 260, efficiency: 0.221 },
  { id: "tesla-models-lr", make: "Tesla", model: "Model S Long Range", year: 2024, batteryCapacity: 100, range: 405, efficiency: 0.247 },
  { id: "tesla-modelx-lr", make: "Tesla", model: "Model X Long Range", year: 2024, batteryCapacity: 100, range: 348, efficiency: 0.287 },
  { id: "tesla-cybertruck", make: "Tesla", model: "Cybertruck AWD", year: 2024, batteryCapacity: 123, range: 318, efficiency: 0.387 },
  { id: "rivian-r1s", make: "Rivian", model: "R1S Large Pack", year: 2024, batteryCapacity: 135, range: 321, efficiency: 0.421 },
  { id: "rivian-r1t", make: "Rivian", model: "R1T Large Pack", year: 2024, batteryCapacity: 135, range: 328, efficiency: 0.411 },
  { id: "ford-mache-er", make: "Ford", model: "Mustang Mach-E Extended", year: 2024, batteryCapacity: 91, range: 312, efficiency: 0.292 },
  { id: "ford-f150-er", make: "Ford", model: "F-150 Lightning Extended", year: 2024, batteryCapacity: 131, range: 320, efficiency: 0.409 },
  { id: "chevy-equinox", make: "Chevrolet", model: "Equinox EV", year: 2024, batteryCapacity: 85, range: 319, efficiency: 0.266 },
  { id: "chevy-blazer", make: "Chevrolet", model: "Blazer EV", year: 2024, batteryCapacity: 102, range: 324, efficiency: 0.315 },
  { id: "hyundai-ioniq5-lr", make: "Hyundai", model: "IONIQ 5 Long Range", year: 2024, batteryCapacity: 77.4, range: 303, efficiency: 0.255 },
  { id: "hyundai-ioniq6-lr", make: "Hyundai", model: "IONIQ 6 Long Range", year: 2024, batteryCapacity: 77.4, range: 361, efficiency: 0.214 },
  { id: "kia-ev6-lr", make: "Kia", model: "EV6 Long Range", year: 2024, batteryCapacity: 77.4, range: 310, efficiency: 0.250 },
  { id: "kia-ev9-lr", make: "Kia", model: "EV9 Long Range", year: 2024, batteryCapacity: 99.8, range: 304, efficiency: 0.328 },
  { id: "bmw-ix-50", make: "BMW", model: "iX xDrive50", year: 2024, batteryCapacity: 111.5, range: 324, efficiency: 0.344 },
  { id: "bmw-i4-40", make: "BMW", model: "i4 eDrive40", year: 2024, batteryCapacity: 83.9, range: 318, efficiency: 0.264 },
  { id: "mercedes-eqs450", make: "Mercedes", model: "EQS 450+", year: 2024, batteryCapacity: 108.4, range: 350, efficiency: 0.310 },
  { id: "mercedes-eqe350", make: "Mercedes", model: "EQE 350+", year: 2024, batteryCapacity: 90.6, range: 305, efficiency: 0.297 },
  { id: "vw-id4-pro", make: "Volkswagen", model: "ID.4 Pro S", year: 2024, batteryCapacity: 82, range: 275, efficiency: 0.298 },
  { id: "lucid-air-gt", make: "Lucid", model: "Air Grand Touring", year: 2024, batteryCapacity: 112, range: 516, efficiency: 0.217 },
  { id: "polestar-2-lr", make: "Polestar", model: "2 Long Range", year: 2024, batteryCapacity: 82, range: 295, efficiency: 0.278 },
  { id: "nissan-ariya", make: "Nissan", model: "Ariya e-4ORCE", year: 2024, batteryCapacity: 87, range: 265, efficiency: 0.328 },
];

export function getEVDisplayName(ev: EVModel): string {
  return `${ev.year} ${ev.make} ${ev.model}`;
}
