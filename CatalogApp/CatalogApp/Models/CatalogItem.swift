import Foundation

// MARK: - Top Type

enum TopType: String, CaseIterable, Identifiable, Hashable, Codable {
    case formicaRoundEdge = "Formica Laminate - Round Front Edge"
    case formicaTMoldEdge = "Formica Laminate - T-Mold Bumper Edge"
    case formicaSquareEdge = "Formica Laminate - Square Cut Edge"
    case butcherBlock1Oiled = "Solid Butcher Block 1\" - Oiled"
    case butcherBlock1Lacquered = "Solid Butcher Block 1\" - Lacquered"
    case butcherBlock175Oiled = "Solid Butcher Block 1-3/4\" - Oiled"
    case butcherBlock175Lacquered = "Solid Butcher Block 1-3/4\" - Lacquered"
    case esdStaticControl = "Static Control ESD Laminate"
    case cleanroomLaminate = "Cleanroom Laminate"
    case cleanroomESD = "Cleanroom ESD Laminate"
    case stainlessSteel = "Stainless Steel"
    case paintedSteel = "Painted Steel"
    case disposableParticleboard = "Disposable Particleboard"
    case resinBlack1 = "Resin Top - Black 1\""
    case resinBlack075 = "Resin Top - Black 3/4\""
    case resinWhite1 = "Resin Top - White 1\""
    case resinWhite075 = "Resin Top - White 3/4\""

    var id: String { rawValue }

    var isFormica: Bool {
        switch self {
        case .formicaRoundEdge, .formicaTMoldEdge, .formicaSquareEdge: return true
        default: return false
        }
    }

    var isResin: Bool {
        switch self {
        case .resinBlack1, .resinBlack075, .resinWhite1, .resinWhite075: return true
        default: return false
        }
    }

    var isButcherBlock: Bool {
        switch self {
        case .butcherBlock1Oiled, .butcherBlock1Lacquered,
             .butcherBlock175Oiled, .butcherBlock175Lacquered: return true
        default: return false
        }
    }

    /// Name shown on grid cards (no "Kennedy" prefix, variants consolidated)
    var gridName: String {
        switch self {
        case .formicaRoundEdge, .formicaTMoldEdge, .formicaSquareEdge: return "Formica"
        case .butcherBlock1Oiled, .butcherBlock1Lacquered,
             .butcherBlock175Oiled, .butcherBlock175Lacquered: return "Butcher Block"
        case .esdStaticControl: return "ESD / Static Control"
        case .cleanroomLaminate: return "Cleanroom"
        case .cleanroomESD: return "Cleanroom ESD"
        case .stainlessSteel: return "Stainless Steel"
        case .paintedSteel: return "Painted Steel"
        case .disposableParticleboard: return "Particleboard"
        case .resinBlack1, .resinBlack075, .resinWhite1, .resinWhite075: return "Resin"
        }
    }

    var shortName: String {
        switch self {
        case .formicaRoundEdge: return "Formica Round"
        case .formicaTMoldEdge: return "Formica T-Mold"
        case .formicaSquareEdge: return "Formica Square"
        case .butcherBlock1Oiled: return "Butcher Block 1\" Oiled"
        case .butcherBlock1Lacquered: return "Butcher Block 1\" Lacquered"
        case .butcherBlock175Oiled: return "Butcher Block 1-3/4\" Oiled"
        case .butcherBlock175Lacquered: return "Butcher Block 1-3/4\" Lacquered"
        case .esdStaticControl: return "ESD / Static Control"
        case .cleanroomLaminate: return "Cleanroom"
        case .cleanroomESD: return "Cleanroom ESD"
        case .stainlessSteel: return "Stainless Steel"
        case .paintedSteel: return "Painted Steel"
        case .disposableParticleboard: return "Particleboard"
        case .resinBlack1: return "Resin Black 1\""
        case .resinBlack075: return "Resin Black 3/4\""
        case .resinWhite1: return "Resin White 1\""
        case .resinWhite075: return "Resin White 3/4\""
        }
    }

    var modelPrefix: String {
        switch self {
        case .formicaRoundEdge: return "KF"
        case .formicaTMoldEdge: return "KT"
        case .formicaSquareEdge: return "KE"
        case .butcherBlock1Oiled: return "KV"
        case .butcherBlock1Lacquered: return "KVL"
        case .butcherBlock175Oiled: return "KW"
        case .butcherBlock175Lacquered: return "KWL"
        case .esdStaticControl: return "KD"
        case .cleanroomLaminate: return "KCR"
        case .cleanroomESD: return "KDCR"
        case .stainlessSteel: return "KN"
        case .paintedSteel: return "KM"
        case .disposableParticleboard: return "KPB"
        case .resinBlack1: return "KY"
        case .resinBlack075: return "KZ"
        case .resinWhite1: return "KYW"
        case .resinWhite075: return "KZW"
        }
    }

    var topMaterial: String {
        switch self {
        case .formicaRoundEdge, .formicaTMoldEdge, .formicaSquareEdge: return "Formica Laminate"
        case .butcherBlock1Oiled, .butcherBlock1Lacquered: return "Solid Butcher Block 1\""
        case .butcherBlock175Oiled, .butcherBlock175Lacquered: return "Solid Butcher Block 1-3/4\""
        case .esdStaticControl: return "ESD Static Control Laminate"
        case .cleanroomLaminate: return "Cleanroom Laminate"
        case .cleanroomESD: return "Cleanroom ESD Laminate"
        case .stainlessSteel: return "Stainless Steel"
        case .paintedSteel: return "Painted Steel"
        case .disposableParticleboard: return "Particleboard"
        case .resinBlack1, .resinBlack075: return "Resin - Black"
        case .resinWhite1, .resinWhite075: return "Resin - White"
        }
    }

    var edgeType: String {
        switch self {
        case .formicaRoundEdge: return "Radiused"
        case .formicaTMoldEdge: return "T-Mold Bumper"
        case .formicaSquareEdge: return "Square Cut"
        case .butcherBlock1Oiled, .butcherBlock175Oiled: return "Radiused (Oiled)"
        case .butcherBlock1Lacquered, .butcherBlock175Lacquered: return "Square Cut (Lacquered)"
        case .esdStaticControl, .cleanroomLaminate, .cleanroomESD: return "Square Cut"
        case .stainlessSteel: return "Square Cut"
        case .paintedSteel: return "Square Cut"
        case .disposableParticleboard: return "Square Cut"
        case .resinBlack1, .resinBlack075, .resinWhite1, .resinWhite075: return "Square Cut"
        }
    }

    var imageName: String {
        switch self {
        case .formicaRoundEdge: return "formica_round"
        case .formicaTMoldEdge: return "formica_tmold"
        case .formicaSquareEdge: return "formica_square"
        case .butcherBlock1Oiled: return "butcher_block_1_oiled"
        case .butcherBlock1Lacquered: return "butcher_block_1_lacquered"
        case .butcherBlock175Oiled: return "butcher_block_175_oiled"
        case .butcherBlock175Lacquered: return "butcher_block_175_lacquered"
        case .esdStaticControl: return "esd_laminate"
        case .cleanroomLaminate: return "painted_steel"
        case .cleanroomESD: return "cleanroom_esd"
        case .stainlessSteel: return "stainless_steel"
        case .paintedSteel: return "cleanroom_laminate"
        case .disposableParticleboard: return "particleboard"
        case .resinBlack1, .resinBlack075: return "phenolic_resin"
        case .resinWhite1, .resinWhite075: return "phenolic_resinw"
        }
    }

    var description: String {
        switch self {
        case .formicaRoundEdge, .formicaTMoldEdge, .formicaSquareEdge:
            return "Formica laminate surface on 1.125\" solid wood core. Durable and easy to clean."
        case .butcherBlock1Oiled:
            return "100% solid butcher block hardwood, 1\" thick, oiled finish with round front edge."
        case .butcherBlock1Lacquered:
            return "100% solid butcher block hardwood, 1\" thick, lacquered finish."
        case .butcherBlock175Oiled:
            return "100% solid butcher block hardwood, 1-3/4\" thick, oiled finish with round front edge."
        case .butcherBlock175Lacquered:
            return "100% solid butcher block hardwood, 1-3/4\" thick, lacquered finish."
        case .esdStaticControl:
            return "LisStat™ ESD static control laminate with wrist-strap jack plugs and grounding wire. Aluminum sheet undersides for maximum conductivity."
        case .cleanroomLaminate:
            return "Cleanroom-rated laminate surface designed for controlled environments."
        case .cleanroomESD:
            return "Cleanroom LisStat™ ESD static control laminate for ESD-sensitive cleanroom environments."
        case .stainlessSteel:
            return "18-gauge stainless steel top with square cut front edge. Ideal for labs and food preparation areas."
        case .paintedSteel:
            return "Painted steel top with square cut front edge. Available in 12-gauge and 14-gauge. Heavy-duty industrial surface."
        case .disposableParticleboard:
            return "Heavy 45# particleboard, 1-1/8\" thick. Economical disposable top option."
        case .resinBlack1, .resinBlack075, .resinWhite1, .resinWhite075:
            return "Chemical-resistant resin top. Available in black and white, with square cut or round front edge options."
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

    func partNumber(modelPrefix: String, gaugeSuffix: String? = nil) -> String {
        if let suffix = gaugeSuffix {
            return "\(modelPrefix)\(depth)\(length)-\(suffix)"
        }
        return "\(modelPrefix)\(depth)\(length)"
    }
}

// MARK: - Color Options

struct ColorOption: Identifiable, Hashable, Codable {
    var id: String { name }
    let name: String
    let hexColor: String
    var isPremium: Bool = false
}

// MARK: - Gauge Option

struct GaugeOption: Identifiable, Hashable, Codable {
    var id: String { suffix }
    let label: String   // e.g. "12 Gauge"
    let suffix: String  // e.g. "12" — appended to part number as -12
}

// MARK: - Workbench Product

struct WorkbenchProduct: Identifiable, Hashable, Codable {
    let id: UUID
    let series: String
    let topType: TopType
    let modelPrefix: String
    let sizes: [WorkbenchSize]
    let laminateColors: [ColorOption]
    let paintColors: [ColorOption]
    let gaugeOptions: [GaugeOption]
    let loadCapacity: String
    let coreThickness: String
    let apronSize: String
    let steelSpec: String
    let legSpec: String
    let assemblySpec: String
    let heightAdjustable: String?
    let shipsIn: String

    init(
        id: UUID = UUID(),
        series: String,
        topType: TopType,
        modelPrefix: String,
        sizes: [WorkbenchSize],
        laminateColors: [ColorOption] = [],
        paintColors: [ColorOption] = [],
        gaugeOptions: [GaugeOption] = [],
        loadCapacity: String = "Tested to 6,600 lbs",
        coreThickness: String = "1.125\" Solid Wood Core",
        apronSize: String = "2\" x 1\" Tube",
        steelSpec: String = "16 Gauge Cold Rolled",
        legSpec: String = "2\" x 2\" Tube w/ 2\" x 1\" Spreaders",
        assemblySpec: String = "1 Bolt Per Leg",
        heightAdjustable: String? = nil,
        shipsIn: String = "1-5 Business Days"
    ) {
        self.id = id
        self.series = series
        self.topType = topType
        self.modelPrefix = modelPrefix
        self.sizes = sizes
        self.laminateColors = laminateColors
        self.paintColors = paintColors
        self.gaugeOptions = gaugeOptions
        self.loadCapacity = loadCapacity
        self.coreThickness = coreThickness
        self.apronSize = apronSize
        self.steelSpec = steelSpec
        self.legSpec = legSpec
        self.assemblySpec = assemblySpec
        self.heightAdjustable = heightAdjustable
        self.shipsIn = shipsIn
    }

    var displayName: String {
        "\(series) - \(topType.shortName)"
    }
}

// MARK: - Formica Edge Style

enum FormicaEdgeStyle: String, CaseIterable, Identifiable {
    case square = "Square"
    case round = "Round"
    case tMold = "T-Mold"

    var id: String { rawValue }

    var topType: TopType {
        switch self {
        case .square: return .formicaSquareEdge
        case .round: return .formicaRoundEdge
        case .tMold: return .formicaTMoldEdge
        }
    }
}

// MARK: - Butcher Block Options

enum ButcherBlockThickness: String, CaseIterable, Identifiable {
    case one = "1\""
    case oneThreeQuarter = "1-3/4\""

    var id: String { rawValue }
}

enum ButcherBlockFinish: String, CaseIterable, Identifiable {
    case oiled = "Oiled"
    case lacquered = "Lacquered"

    var id: String { rawValue }

    func topType(thickness: ButcherBlockThickness) -> TopType {
        switch (thickness, self) {
        case (.one, .oiled): return .butcherBlock1Oiled
        case (.one, .lacquered): return .butcherBlock1Lacquered
        case (.oneThreeQuarter, .oiled): return .butcherBlock175Oiled
        case (.oneThreeQuarter, .lacquered): return .butcherBlock175Lacquered
        }
    }
}

enum ButcherBlockEdgeStyle: String, CaseIterable, Identifiable {
    case standard = "Standard"
    case roundFront = "Round Front"

    var id: String { rawValue }
}

// MARK: - Resin Options

enum ResinColor: String, CaseIterable, Identifiable {
    case black = "Black"
    case white = "White"

    var id: String { rawValue }
}

enum ResinThickness: String, CaseIterable, Identifiable {
    case one = "1\""
    case threeQuarter = "3/4\""

    var id: String { rawValue }
}

enum ResinEdgeStyle: String, CaseIterable, Identifiable {
    case square = "Square Cut"
    case round = "Round Front"

    var id: String { rawValue }
}

func resinTopType(color: ResinColor, thickness: ResinThickness) -> TopType {
    switch (color, thickness) {
    case (.black, .one): return .resinBlack1
    case (.black, .threeQuarter): return .resinBlack075
    case (.white, .one): return .resinWhite1
    case (.white, .threeQuarter): return .resinWhite075
    }
}
