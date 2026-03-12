import Foundation

// MARK: - Top Type

enum TopType: String, CaseIterable, Identifiable, Hashable, Codable {
    case formicaRoundEdge = "Formica Laminate - Round Front Edge"
    case formicaTMoldEdge = "Formica Laminate - T-Mold Bumper Edge"
    case formicaSquareEdge = "Formica Laminate - Square Cut Edge"
    case butcherBlockOiled = "Solid Butcher Block - Oiled"
    case butcherBlockLacquered = "Solid Butcher Block - Lacquered"
    case esdStaticControl = "Static Control ESD Laminate"
    case cleanroomLaminate = "Cleanroom Laminate"
    case cleanroomESD = "Cleanroom ESD Laminate"
    case stainlessSteel = "Stainless Steel"
    case paintedSteel = "Painted Steel"
    case disposableParticleboard = "Disposable Particleboard"

    var id: String { rawValue }

    var shortName: String {
        switch self {
        case .formicaRoundEdge: return "Formica (Round)"
        case .formicaTMoldEdge: return "Formica (T-Mold)"
        case .formicaSquareEdge: return "Formica (Square)"
        case .butcherBlockOiled: return "Butcher Block (Oil)"
        case .butcherBlockLacquered: return "Butcher Block (Lac.)"
        case .esdStaticControl: return "ESD / Static Control"
        case .cleanroomLaminate: return "Cleanroom"
        case .cleanroomESD: return "Cleanroom ESD"
        case .stainlessSteel: return "Stainless Steel"
        case .paintedSteel: return "Painted Steel"
        case .disposableParticleboard: return "Particleboard"
        }
    }

    var modelPrefix: String {
        switch self {
        case .formicaRoundEdge: return "KF"
        case .formicaTMoldEdge: return "KT"
        case .formicaSquareEdge: return "KE"
        case .butcherBlockOiled: return "KWR"
        case .butcherBlockLacquered: return "KWR-L"
        case .esdStaticControl: return "KD"
        case .cleanroomLaminate: return "KCR"
        case .cleanroomESD: return "KDCR"
        case .stainlessSteel: return "KN"
        case .paintedSteel: return "KM"
        case .disposableParticleboard: return "KPB"
        }
    }

    var description: String {
        switch self {
        case .formicaRoundEdge, .formicaTMoldEdge, .formicaSquareEdge:
            return "Formica laminate surface on 1.2\" solid wood core. Durable and easy to clean."
        case .butcherBlockOiled:
            return "100% solid butcher block hardwood, 1-3/4\" thick, oiled finish with round front edge."
        case .butcherBlockLacquered:
            return "100% solid butcher block hardwood, 1-3/4\" thick, lacquered finish."
        case .esdStaticControl:
            return "LisStat™ ESD static control laminate with wrist-strap jack plugs and grounding wire. Aluminum sheet undersides for maximum conductivity."
        case .cleanroomLaminate:
            return "Cleanroom-rated laminate surface designed for controlled environments."
        case .cleanroomESD:
            return "Cleanroom LisStat™ ESD static control laminate for ESD-sensitive cleanroom environments."
        case .stainlessSteel:
            return "Stainless steel top with square cut front edge. Ideal for labs and food preparation areas."
        case .paintedSteel:
            return "12-gauge painted steel top with square cut front edge. Heavy-duty industrial surface."
        case .disposableParticleboard:
            return "Heavy 45# particleboard, 1-1/8\" thick. Economical disposable top option."
        }
    }
}

// MARK: - Workbench Size

struct WorkbenchSize: Identifiable, Hashable, Codable {
    var id: String { "\(depth)x\(length)" }
    let depth: Int  // inches
    let length: Int // inches

    var displayName: String {
        "\(depth)\"D x \(length)\"L"
    }
}

// MARK: - Color Options

struct ColorOption: Identifiable, Hashable, Codable {
    var id: String { name }
    let name: String
    let hexColor: String
}

// MARK: - Price Entry (size -> price mapping)

struct PriceEntry: Identifiable, Hashable, Codable {
    var id: String { size.id }
    let size: WorkbenchSize
    let price: Double

    var formattedPrice: String {
        String(format: "$%.2f", price)
    }

    func partNumber(modelPrefix: String) -> String {
        "\(modelPrefix)\(size.depth)\(size.length)"
    }
}

// MARK: - Workbench Product

struct WorkbenchProduct: Identifiable, Hashable, Codable {
    let id: UUID
    let series: String
    let topType: TopType
    let modelPrefix: String
    let priceEntries: [PriceEntry]
    let laminateColors: [ColorOption]
    let paintColors: [ColorOption]
    let loadCapacity: String
    let coreThickness: String
    let apronSize: String
    let shipsIn: String

    init(
        id: UUID = UUID(),
        series: String,
        topType: TopType,
        modelPrefix: String,
        priceEntries: [PriceEntry],
        laminateColors: [ColorOption] = [],
        paintColors: [ColorOption] = [],
        loadCapacity: String = "Tested to 6,600 lbs",
        coreThickness: String = "1.2\" Solid Wood Core",
        apronSize: String = "2\" x 1\" Tube",
        shipsIn: String = "1-5 Business Days"
    ) {
        self.id = id
        self.series = series
        self.topType = topType
        self.modelPrefix = modelPrefix
        self.priceEntries = priceEntries
        self.laminateColors = laminateColors
        self.paintColors = paintColors
        self.loadCapacity = loadCapacity
        self.coreThickness = coreThickness
        self.apronSize = apronSize
        self.shipsIn = shipsIn
    }

    var startingPrice: Double {
        priceEntries.map(\.price).min() ?? 0
    }

    var formattedStartingPrice: String {
        String(format: "$%.2f", startingPrice)
    }

    var displayName: String {
        "\(series) - \(topType.shortName)"
    }
}
