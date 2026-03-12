import Foundation

struct KennedyData {

    // MARK: - Common Color Options

    static let standardLaminateColors: [ColorOption] = [
        ColorOption(name: "White", hexColor: "#FFFFFF"),
        ColorOption(name: "Black", hexColor: "#1C1C1E"),
        ColorOption(name: "Beige", hexColor: "#D4C5A9"),
        ColorOption(name: "Light Gray", hexColor: "#C7C7CC"),
        ColorOption(name: "Dark Gray", hexColor: "#636366"),
    ]

    static let standardPaintColors: [ColorOption] = [
        ColorOption(name: "Blue", hexColor: "#1A5276"),
        ColorOption(name: "Gray", hexColor: "#7F8C8D"),
        ColorOption(name: "Black", hexColor: "#1C1C1E"),
        ColorOption(name: "White", hexColor: "#FFFFFF"),
        ColorOption(name: "Dark Blue", hexColor: "#0E2F56"),
        ColorOption(name: "Beige", hexColor: "#D4C5A9"),
    ]

    // MARK: - Premium Laminate Colors

    static let premiumSolidLaminateColors: [ColorOption] = [
        ColorOption(name: "Steel", hexColor: "#71797E", isPremium: true),
        ColorOption(name: "Oxygen", hexColor: "#E8F0FE", isPremium: true),
        ColorOption(name: "Dark Chocolate", hexColor: "#3B2F2F", isPremium: true),
        ColorOption(name: "Peaceful Blue", hexColor: "#A2C4E0", isPremium: true),
        ColorOption(name: "Sol", hexColor: "#F5C518", isPremium: true),
        ColorOption(name: "Grasshopper", hexColor: "#7DB46C", isPremium: true),
        ColorOption(name: "Pumpkin", hexColor: "#E8751A", isPremium: true),
        ColorOption(name: "Brite White", hexColor: "#F8F8FF", isPremium: true),
        ColorOption(name: "Ivory", hexColor: "#FFFFF0", isPremium: true),
        ColorOption(name: "Graystone", hexColor: "#928E85", isPremium: true),
        ColorOption(name: "Graphite", hexColor: "#41424C", isPremium: true),
        ColorOption(name: "Stop Red", hexColor: "#CF1020", isPremium: true),
        ColorOption(name: "Spectrum Blue", hexColor: "#1F75FE", isPremium: true),
        ColorOption(name: "Marine Blue", hexColor: "#005B8E", isPremium: true),
        ColorOption(name: "Almond", hexColor: "#EFDECD", isPremium: true),
        ColorOption(name: "Platinum", hexColor: "#E5E4E2", isPremium: true),
        ColorOption(name: "Storm", hexColor: "#555D6E", isPremium: true),
        ColorOption(name: "Champagne", hexColor: "#F7E7CE", isPremium: true),
        ColorOption(name: "Folkstone", hexColor: "#6F6A61", isPremium: true),
        ColorOption(name: "Burgundy", hexColor: "#800020", isPremium: true),
        ColorOption(name: "Hunter Green", hexColor: "#355E3B", isPremium: true),
        ColorOption(name: "Navy Blue", hexColor: "#000080", isPremium: true),
    ]

    static let premiumPatternLaminateColors: [ColorOption] = [
        ColorOption(name: "Giallo Granite", hexColor: "#C9B458", isPremium: true),
        ColorOption(name: "Perlato Granite", hexColor: "#D6CAB5", isPremium: true),
        ColorOption(name: "Labrador Granite", hexColor: "#3B3C36", isPremium: true),
        ColorOption(name: "Himalayan Slate", hexColor: "#6C7A89", isPremium: true),
        ColorOption(name: "Basalt Slate", hexColor: "#4E5754", isPremium: true),
        ColorOption(name: "Colorado Slate", hexColor: "#8B7D6B", isPremium: true),
        ColorOption(name: "Concrete Stone", hexColor: "#B0AFA7", isPremium: true),
        ColorOption(name: "Carrara Bianco", hexColor: "#E8E4E1", isPremium: true),
        ColorOption(name: "Blackstone", hexColor: "#2C2C2C", isPremium: true),
    ]

    static let premiumWoodgrainLaminateColors: [ColorOption] = [
        ColorOption(name: "Oak Woodgrain", hexColor: "#B8860B", isPremium: true),
        ColorOption(name: "Walnut Woodgrain", hexColor: "#5C4033", isPremium: true),
        ColorOption(name: "Maple Woodgrain", hexColor: "#C9A959", isPremium: true),
        ColorOption(name: "Cherry Woodgrain", hexColor: "#9B111E", isPremium: true),
        ColorOption(name: "Ash Woodgrain", hexColor: "#C4B59D", isPremium: true),
        ColorOption(name: "Mahogany Woodgrain", hexColor: "#C04000", isPremium: true),
        ColorOption(name: "Teak Woodgrain", hexColor: "#9A7B4F", isPremium: true),
        ColorOption(name: "Finnish Oak Woodgrain", hexColor: "#D4B896", isPremium: true),
        ColorOption(name: "Ebony Ribbonwood", hexColor: "#3C2415", isPremium: true),
    ]

    // MARK: - Premium Paint Colors

    static let premiumPaintColors: [ColorOption] = [
        ColorOption(name: "Dark Blue (80% Gloss)", hexColor: "#0E2F56", isPremium: true),
        ColorOption(name: "Dark Red (90% Gloss)", hexColor: "#8B0000", isPremium: true),
        ColorOption(name: "International Orange", hexColor: "#FF4F00", isPremium: true),
        ColorOption(name: "Safety Orange", hexColor: "#FF6600", isPremium: true),
        ColorOption(name: "Yellow", hexColor: "#FFD700", isPremium: true),
        ColorOption(name: "Traffic Green", hexColor: "#007B3A", isPremium: true),
        ColorOption(name: "D.O.T. Green", hexColor: "#006B3C", isPremium: true),
        ColorOption(name: "Bronze", hexColor: "#CD7F32", isPremium: true),
        ColorOption(name: "ANSI Gray #49", hexColor: "#8A8D8F", isPremium: true),
        ColorOption(name: "ANSI Gray #61", hexColor: "#6B6E70", isPremium: true),
        ColorOption(name: "Antique White", hexColor: "#FAEBD7", isPremium: true),
        ColorOption(name: "Almond Paint", hexColor: "#EFDECD", isPremium: true),
    ]

    static let esdPaintColors: [ColorOption] = [
        ColorOption(name: "Blue", hexColor: "#1A5276"),
        ColorOption(name: "Gray", hexColor: "#7F8C8D"),
        ColorOption(name: "Black", hexColor: "#1C1C1E"),
        ColorOption(name: "White", hexColor: "#FFFFFF"),
        ColorOption(name: "Dark Blue", hexColor: "#0E2F56"),
        ColorOption(name: "Beige", hexColor: "#D4C5A9"),
        ColorOption(name: "Blue ESD", hexColor: "#2E86C1"),
        ColorOption(name: "Gray ESD", hexColor: "#95A5A6"),
        ColorOption(name: "Black ESD", hexColor: "#2C3E50"),
    ]

    static let esdLaminateColors: [ColorOption] = [
        ColorOption(name: "White", hexColor: "#FFFFFF"),
        ColorOption(name: "Black", hexColor: "#1C1C1E"),
        ColorOption(name: "Light Gray", hexColor: "#C7C7CC"),
        ColorOption(name: "Dark Gray", hexColor: "#636366"),
    ]

    // MARK: - Standard Sizes

    // All Kennedy workbenches share these depth/length combinations
    static let standardSizes: [WorkbenchSize] = {
        let depths = [24, 30, 36, 48]
        let lengths = [24, 30, 36, 48, 60, 72, 96, 120]
        var sizes: [WorkbenchSize] = []
        for depth in depths {
            for length in lengths where length >= depth {
                sizes.append(WorkbenchSize(depth: depth, length: length))
            }
        }
        return sizes
    }()

    // Stainless steel uses 45" depth instead of 48", and 117" instead of 120"
    static let stainlessSteelSizes: [WorkbenchSize] = {
        let configs: [(Int, Int)] = [
            (24, 24), (24, 30), (24, 36), (24, 48), (24, 60), (24, 72), (24, 96), (24, 117),
            (30, 30), (30, 36), (30, 48), (30, 60), (30, 72), (30, 96), (30, 117),
            (36, 36), (36, 48), (36, 60), (36, 72), (36, 96), (36, 117),
            (45, 48), (45, 60), (45, 72), (45, 96), (45, 117),
        ]
        return configs.map { WorkbenchSize(depth: $0.0, length: $0.1) }
    }()

    // Painted steel uses 45" depth instead of 48"
    static let paintedSteelSizes: [WorkbenchSize] = {
        let configs: [(Int, Int)] = [
            (24, 24), (24, 30), (24, 36), (24, 48), (24, 60), (24, 72), (24, 96),
            (30, 30), (30, 36), (30, 48), (30, 60), (30, 72), (30, 96),
            (36, 36), (36, 48), (36, 60), (36, 72), (36, 96),
            (45, 48), (45, 60), (45, 72), (45, 96),
        ]
        return configs.map { WorkbenchSize(depth: $0.0, length: $0.1) }
    }()

    // Cleanroom ESD has fewer sizes
    static let cleanroomESDSizes: [WorkbenchSize] = {
        let configs: [(Int, Int)] = [
            (24, 24), (24, 30), (24, 36), (24, 48), (24, 60), (24, 72), (24, 96), (24, 120),
            (30, 30), (30, 36), (30, 48), (30, 60), (30, 72), (30, 96), (30, 120),
        ]
        return configs.map { WorkbenchSize(depth: $0.0, length: $0.1) }
    }()

    // MARK: - Kennedy Series Products

    /// Maps edge style to the matching Formica product
    static func formicaProduct(for edgeStyle: FormicaEdgeStyle) -> WorkbenchProduct {
        switch edgeStyle {
        case .square: return formicaSquareEdge
        case .round: return formicaRoundEdge
        case .tMold: return formicaTMoldEdge
        }
    }

    /// Maps thickness + finish to the matching Butcher Block product
    static func butcherBlockProduct(thickness: ButcherBlockThickness, finish: ButcherBlockFinish) -> WorkbenchProduct {
        switch (thickness, finish) {
        case (.one, .oiled): return butcherBlock1Oiled
        case (.one, .lacquered): return butcherBlock1Lacquered
        case (.oneThreeQuarter, .oiled): return butcherBlock175Oiled
        case (.oneThreeQuarter, .lacquered): return butcherBlock175Lacquered
        }
    }

    /// Maps color + thickness to the matching Resin product
    static func resinProduct(color: ResinColor, thickness: ResinThickness) -> WorkbenchProduct {
        switch (color, thickness) {
        case (.black, .one): return resinBlack1
        case (.black, .threeQuarter): return resinBlack075
        case (.white, .one): return resinWhite1
        case (.white, .threeQuarter): return resinWhite075
        }
    }

    static let allProducts: [WorkbenchProduct] = [
        formicaSquareEdge,      // Single Formica entry; edge variants selectable in detail view
        butcherBlock1Oiled,     // Single Butcher Block entry; thickness/finish selectable in detail view
        resinBlack1,            // Single Resin entry; color/thickness/edge selectable in detail view
        esdStaticControl,
        cleanroomLaminate,
        cleanroomESD,
        stainlessSteel,
        paintedSteel,
        disposableParticleboard,
    ]

    // MARK: - Combined Color Arrays (standard + premium)

    static let allLaminateColors: [ColorOption] = standardLaminateColors
        + premiumSolidLaminateColors
        + premiumPatternLaminateColors
        + premiumWoodgrainLaminateColors

    static let allPaintColors: [ColorOption] = standardPaintColors + premiumPaintColors

    // MARK: Formica Laminate - Round Front Edge (Model KF)
    static let formicaRoundEdge = WorkbenchProduct(
        series: "Kennedy",
        topType: .formicaRoundEdge,
        modelPrefix: "KF",
        sizes: standardSizes,
        laminateColors: allLaminateColors,
        paintColors: allPaintColors
    )

    // MARK: Formica Laminate - T-Mold Bumper Edge (Model KT)
    static let formicaTMoldEdge = WorkbenchProduct(
        series: "Kennedy",
        topType: .formicaTMoldEdge,
        modelPrefix: "KT",
        sizes: standardSizes,
        laminateColors: allLaminateColors,
        paintColors: allPaintColors
    )

    // MARK: Formica Laminate - Square Cut Edge (Model KE)
    static let formicaSquareEdge = WorkbenchProduct(
        series: "Kennedy",
        topType: .formicaSquareEdge,
        modelPrefix: "KE",
        sizes: standardSizes,
        laminateColors: allLaminateColors,
        paintColors: allPaintColors
    )

    // MARK: Solid Butcher Block 1" - Oiled (Model KV)
    static let butcherBlock1Oiled = WorkbenchProduct(
        series: "Kennedy",
        topType: .butcherBlock1Oiled,
        modelPrefix: "KV",
        sizes: standardSizes,
        paintColors: allPaintColors,
        coreThickness: "1\" Solid Butcher Block"
    )

    // MARK: Solid Butcher Block 1" - Lacquered (Model KVL)
    static let butcherBlock1Lacquered = WorkbenchProduct(
        series: "Kennedy",
        topType: .butcherBlock1Lacquered,
        modelPrefix: "KVL",
        sizes: standardSizes,
        paintColors: allPaintColors,
        coreThickness: "1\" Solid Butcher Block"
    )

    // MARK: Solid Butcher Block 1-3/4" - Oiled (Model KW)
    static let butcherBlock175Oiled = WorkbenchProduct(
        series: "Kennedy",
        topType: .butcherBlock175Oiled,
        modelPrefix: "KW",
        sizes: standardSizes,
        paintColors: allPaintColors,
        coreThickness: "1-3/4\" Solid Butcher Block"
    )

    // MARK: Solid Butcher Block 1-3/4" - Lacquered (Model KWL)
    static let butcherBlock175Lacquered = WorkbenchProduct(
        series: "Kennedy",
        topType: .butcherBlock175Lacquered,
        modelPrefix: "KWL",
        sizes: standardSizes,
        paintColors: allPaintColors,
        coreThickness: "1-3/4\" Solid Butcher Block"
    )

    // MARK: ESD Static Control (Model KD)
    static let esdStaticControl = WorkbenchProduct(
        series: "Kennedy",
        topType: .esdStaticControl,
        modelPrefix: "KD",
        sizes: standardSizes,
        laminateColors: esdLaminateColors,
        paintColors: esdPaintColors
    )

    // MARK: Cleanroom Laminate (Model KCR)
    static let cleanroomLaminate = WorkbenchProduct(
        series: "Kennedy",
        topType: .cleanroomLaminate,
        modelPrefix: "KCR",
        sizes: standardSizes,
        laminateColors: standardLaminateColors,
        paintColors: [
            ColorOption(name: "Blue", hexColor: "#1A5276"),
            ColorOption(name: "Gray", hexColor: "#7F8C8D"),
            ColorOption(name: "Black", hexColor: "#1C1C1E"),
            ColorOption(name: "White", hexColor: "#FFFFFF"),
            ColorOption(name: "Dark Blue", hexColor: "#0E2F56"),
        ]
    )

    // MARK: Cleanroom ESD (Model KDCR)
    static let cleanroomESD = WorkbenchProduct(
        series: "Kennedy",
        topType: .cleanroomESD,
        modelPrefix: "KDCR",
        sizes: cleanroomESDSizes,
        laminateColors: esdLaminateColors,
        paintColors: esdPaintColors
    )

    // MARK: Stainless Steel (Model KN)
    static let stainlessSteel = WorkbenchProduct(
        series: "Kennedy",
        topType: .stainlessSteel,
        modelPrefix: "KN",
        sizes: stainlessSteelSizes,
        paintColors: allPaintColors
    )

    // MARK: Painted Steel (Model KM)
    static let paintedSteel = WorkbenchProduct(
        series: "Kennedy",
        topType: .paintedSteel,
        modelPrefix: "KM",
        sizes: paintedSteelSizes,
        paintColors: allPaintColors,
        gaugeOptions: [
            GaugeOption(label: "12 Gauge", suffix: "12"),
            GaugeOption(label: "14 Gauge", suffix: "14"),
        ]
    )

    // MARK: Disposable Particleboard (Model KPB)
    static let disposableParticleboard = WorkbenchProduct(
        series: "Kennedy",
        topType: .disposableParticleboard,
        modelPrefix: "KPB",
        sizes: standardSizes,
        paintColors: allPaintColors
    )

    // MARK: Resin Top - Black 1"
    static let resinBlack1 = WorkbenchProduct(
        series: "Kennedy",
        topType: .resinBlack1,
        modelPrefix: "KY",
        sizes: standardSizes,
        paintColors: allPaintColors,
        coreThickness: "1\" Resin"
    )

    // MARK: Resin Top - Black 3/4"
    static let resinBlack075 = WorkbenchProduct(
        series: "Kennedy",
        topType: .resinBlack075,
        modelPrefix: "KZ",
        sizes: standardSizes,
        paintColors: allPaintColors,
        coreThickness: "3/4\" Resin"
    )

    // MARK: Resin Top - White 1"
    static let resinWhite1 = WorkbenchProduct(
        series: "Kennedy",
        topType: .resinWhite1,
        modelPrefix: "KYW",
        sizes: standardSizes,
        paintColors: allPaintColors,
        coreThickness: "1\" Resin"
    )

    // MARK: Resin Top - White 3/4"
    static let resinWhite075 = WorkbenchProduct(
        series: "Kennedy",
        topType: .resinWhite075,
        modelPrefix: "KZW",
        sizes: standardSizes,
        paintColors: allPaintColors,
        coreThickness: "3/4\" Resin"
    )
}
