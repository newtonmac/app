import Foundation

struct RooseveltData {

    // MARK: - Roosevelt Series Products
    // "Most Affordable" - Tested to 1,500 lbs
    // Standard sizes: 24/30/36 depth x 48/60/72/96/120 length (15 combos)
    // Stainless uses 117 instead of 120, painted steel max 96

    static let standardSizes: [WorkbenchSize] = {
        let depths = [24, 30, 36]
        let lengths = [48, 60, 72, 96, 120]
        var sizes: [WorkbenchSize] = []
        for depth in depths {
            for length in lengths {
                sizes.append(WorkbenchSize(depth: depth, length: length))
            }
        }
        return sizes
    }()

    static let stainlessSteelSizes: [WorkbenchSize] = {
        let depths = [24, 30, 36]
        let lengths = [48, 60, 72, 96, 117]
        var sizes: [WorkbenchSize] = []
        for depth in depths {
            for length in lengths {
                sizes.append(WorkbenchSize(depth: depth, length: length))
            }
        }
        return sizes
    }()

    static let paintedSteelSizes: [WorkbenchSize] = {
        let depths = [24, 30, 36]
        let lengths = [48, 60, 72, 96]
        var sizes: [WorkbenchSize] = []
        for depth in depths {
            for length in lengths {
                sizes.append(WorkbenchSize(depth: depth, length: length))
            }
        }
        return sizes
    }()

    // MARK: - Color Options

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

    static let stainlessPaintColors: [ColorOption] = [
        ColorOption(name: "Blue", hexColor: "#1A5276"),
        ColorOption(name: "Gray", hexColor: "#7F8C8D"),
        ColorOption(name: "Black", hexColor: "#1C1C1E"),
        ColorOption(name: "White", hexColor: "#FFFFFF"),
    ]

    static let esdLaminateColors: [ColorOption] = [
        ColorOption(name: "White", hexColor: "#FFFFFF"),
        ColorOption(name: "Black", hexColor: "#1C1C1E"),
        ColorOption(name: "Light Gray", hexColor: "#C7C7CC"),
        ColorOption(name: "Dark Gray", hexColor: "#636366"),
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

    // MARK: - All Products (shown in grid)

    static let allProducts: [WorkbenchProduct] = [
        formicaSquareEdge,
        butcherBlock1Oiled,
        resinBlack1,
        esdStaticControl,
        cleanroomLaminate,
        cleanroomESD,
        stainlessSteel,
        paintedSteel,
        disposableParticleboard,
    ]

    // MARK: Formica Laminate - Round Front Edge (Model RF)
    static let formicaRoundEdge = WorkbenchProduct(
        series: "Roosevelt",
        topType: .formicaRoundEdge,
        modelPrefix: "RF",
        sizes: standardSizes,
        laminateColors: standardLaminateColors,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 1,500 lbs",
        coreThickness: "1.125\" Solid Wood Core",
        apronSize: "Channel Top Support",
        steelSpec: "14 & 16 Gauge Cold Rolled",
        legSpec: "Formed Steel, Adjustable 30\"-36\"",
        assemblySpec: "Predrilled Holes & Preassembled Legs",
        shipsIn: "1-5 Business Days"
    )

    // MARK: Formica Laminate - T-Mold Bumper Edge (Model RT)
    static let formicaTMoldEdge = WorkbenchProduct(
        series: "Roosevelt",
        topType: .formicaTMoldEdge,
        modelPrefix: "RT",
        sizes: standardSizes,
        laminateColors: standardLaminateColors,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 1,500 lbs",
        coreThickness: "1.125\" Solid Wood Core",
        apronSize: "Channel Top Support",
        steelSpec: "14 & 16 Gauge Cold Rolled",
        legSpec: "Formed Steel, Adjustable 30\"-36\"",
        assemblySpec: "Predrilled Holes & Preassembled Legs",
        shipsIn: "1-5 Business Days"
    )

    // MARK: Formica Laminate - Square Cut Edge (Model RE)
    static let formicaSquareEdge = WorkbenchProduct(
        series: "Roosevelt",
        topType: .formicaSquareEdge,
        modelPrefix: "RE",
        sizes: standardSizes,
        laminateColors: standardLaminateColors,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 1,500 lbs",
        coreThickness: "1.125\" Solid Wood Core",
        apronSize: "Channel Top Support",
        steelSpec: "14 & 16 Gauge Cold Rolled",
        legSpec: "Formed Steel, Adjustable 30\"-36\"",
        assemblySpec: "Predrilled Holes & Preassembled Legs",
        shipsIn: "1-5 Business Days"
    )

    // MARK: Solid Butcher Block 1" - Oiled (Model RV)
    static let butcherBlock1Oiled = WorkbenchProduct(
        series: "Roosevelt",
        topType: .butcherBlock1Oiled,
        modelPrefix: "RV",
        sizes: standardSizes,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 1,500 lbs",
        coreThickness: "1\" Solid Butcher Block",
        apronSize: "Channel Top Support",
        steelSpec: "14 & 16 Gauge Cold Rolled",
        legSpec: "Formed Steel, Adjustable 30\"-36\"",
        assemblySpec: "Predrilled Holes & Preassembled Legs",
        shipsIn: "1-5 Business Days"
    )

    // MARK: Solid Butcher Block 1" - Lacquered (Model RVL)
    static let butcherBlock1Lacquered = WorkbenchProduct(
        series: "Roosevelt",
        topType: .butcherBlock1Lacquered,
        modelPrefix: "RVL",
        sizes: standardSizes,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 1,500 lbs",
        coreThickness: "1\" Solid Butcher Block",
        apronSize: "Channel Top Support",
        steelSpec: "14 & 16 Gauge Cold Rolled",
        legSpec: "Formed Steel, Adjustable 30\"-36\"",
        assemblySpec: "Predrilled Holes & Preassembled Legs",
        shipsIn: "1-5 Business Days"
    )

    // MARK: Solid Butcher Block 1-3/4" - Oiled (Model RW)
    static let butcherBlock175Oiled = WorkbenchProduct(
        series: "Roosevelt",
        topType: .butcherBlock175Oiled,
        modelPrefix: "RW",
        sizes: standardSizes,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 1,500 lbs",
        coreThickness: "1-3/4\" Solid Butcher Block",
        apronSize: "Channel Top Support",
        steelSpec: "14 & 16 Gauge Cold Rolled",
        legSpec: "Formed Steel, Adjustable 30\"-36\"",
        assemblySpec: "Predrilled Holes & Preassembled Legs",
        shipsIn: "1-5 Business Days"
    )

    // MARK: Solid Butcher Block 1-3/4" - Lacquered (Model RWL)
    static let butcherBlock175Lacquered = WorkbenchProduct(
        series: "Roosevelt",
        topType: .butcherBlock175Lacquered,
        modelPrefix: "RWL",
        sizes: standardSizes,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 1,500 lbs",
        coreThickness: "1-3/4\" Solid Butcher Block",
        apronSize: "Channel Top Support",
        steelSpec: "14 & 16 Gauge Cold Rolled",
        legSpec: "Formed Steel, Adjustable 30\"-36\"",
        assemblySpec: "Predrilled Holes & Preassembled Legs",
        shipsIn: "1-5 Business Days"
    )

    // MARK: Resin Top - Black 1" (Model RY)
    static let resinBlack1 = WorkbenchProduct(
        series: "Roosevelt",
        topType: .resinBlack1,
        modelPrefix: "RY",
        sizes: standardSizes,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 1,500 lbs",
        coreThickness: "1\" Resin",
        apronSize: "Channel Top Support",
        steelSpec: "14 & 16 Gauge Cold Rolled",
        legSpec: "Formed Steel, Adjustable 30\"-36\"",
        assemblySpec: "Predrilled Holes & Preassembled Legs",
        shipsIn: "1-5 Business Days"
    )

    // MARK: Resin Top - Black 3/4" (Model RZ)
    static let resinBlack075 = WorkbenchProduct(
        series: "Roosevelt",
        topType: .resinBlack075,
        modelPrefix: "RZ",
        sizes: standardSizes,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 1,500 lbs",
        coreThickness: "3/4\" Resin",
        apronSize: "Channel Top Support",
        steelSpec: "14 & 16 Gauge Cold Rolled",
        legSpec: "Formed Steel, Adjustable 30\"-36\"",
        assemblySpec: "Predrilled Holes & Preassembled Legs",
        shipsIn: "1-5 Business Days"
    )

    // MARK: Resin Top - White 1" (Model RYW)
    static let resinWhite1 = WorkbenchProduct(
        series: "Roosevelt",
        topType: .resinWhite1,
        modelPrefix: "RYW",
        sizes: standardSizes,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 1,500 lbs",
        coreThickness: "1\" Resin",
        apronSize: "Channel Top Support",
        steelSpec: "14 & 16 Gauge Cold Rolled",
        legSpec: "Formed Steel, Adjustable 30\"-36\"",
        assemblySpec: "Predrilled Holes & Preassembled Legs",
        shipsIn: "1-5 Business Days"
    )

    // MARK: Resin Top - White 3/4" (Model RZW)
    static let resinWhite075 = WorkbenchProduct(
        series: "Roosevelt",
        topType: .resinWhite075,
        modelPrefix: "RZW",
        sizes: standardSizes,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 1,500 lbs",
        coreThickness: "3/4\" Resin",
        apronSize: "Channel Top Support",
        steelSpec: "14 & 16 Gauge Cold Rolled",
        legSpec: "Formed Steel, Adjustable 30\"-36\"",
        assemblySpec: "Predrilled Holes & Preassembled Legs",
        shipsIn: "1-5 Business Days"
    )

    // MARK: ESD Static Control (Model RD)
    static let esdStaticControl = WorkbenchProduct(
        series: "Roosevelt",
        topType: .esdStaticControl,
        modelPrefix: "RD",
        sizes: standardSizes,
        laminateColors: esdLaminateColors,
        paintColors: esdPaintColors,
        loadCapacity: "Tested to 1,500 lbs",
        coreThickness: "1.125\" Solid Wood Core",
        apronSize: "Channel Top Support",
        steelSpec: "14 & 16 Gauge Cold Rolled",
        legSpec: "Formed Steel, Adjustable 30\"-36\"",
        assemblySpec: "Predrilled Holes & Preassembled Legs",
        shipsIn: "1-5 Business Days"
    )

    // MARK: Cleanroom Laminate (Model RCR)
    static let cleanroomLaminate = WorkbenchProduct(
        series: "Roosevelt",
        topType: .cleanroomLaminate,
        modelPrefix: "RCR",
        sizes: standardSizes,
        laminateColors: standardLaminateColors,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 1,500 lbs",
        coreThickness: "1.125\" Solid Wood Core",
        apronSize: "Channel Top Support",
        steelSpec: "14 & 16 Gauge Cold Rolled",
        legSpec: "Formed Steel, Adjustable 30\"-36\"",
        assemblySpec: "Predrilled Holes & Preassembled Legs",
        shipsIn: "1-5 Business Days"
    )

    // MARK: Cleanroom ESD (Model RDCR)
    static let cleanroomESD = WorkbenchProduct(
        series: "Roosevelt",
        topType: .cleanroomESD,
        modelPrefix: "RDCR",
        sizes: standardSizes,
        laminateColors: esdLaminateColors,
        paintColors: esdPaintColors,
        loadCapacity: "Tested to 1,500 lbs",
        coreThickness: "1.125\" Solid Wood Core",
        apronSize: "Channel Top Support",
        steelSpec: "14 & 16 Gauge Cold Rolled",
        legSpec: "Formed Steel, Adjustable 30\"-36\"",
        assemblySpec: "Predrilled Holes & Preassembled Legs",
        shipsIn: "1-5 Business Days"
    )

    // MARK: Stainless Steel (Model RN)
    static let stainlessSteel = WorkbenchProduct(
        series: "Roosevelt",
        topType: .stainlessSteel,
        modelPrefix: "RN",
        sizes: stainlessSteelSizes,
        paintColors: stainlessPaintColors,
        loadCapacity: "Tested to 1,500 lbs",
        coreThickness: "18 Gauge Stainless Steel",
        apronSize: "Channel Top Support",
        steelSpec: "14 & 16 Gauge Cold Rolled",
        legSpec: "Formed Steel, Adjustable 30\"-36\"",
        assemblySpec: "Predrilled Holes & Preassembled Legs",
        shipsIn: "1-5 Business Days"
    )

    // MARK: Painted Steel 12 Gauge (Model RM)
    static let paintedSteel = WorkbenchProduct(
        series: "Roosevelt",
        topType: .paintedSteel,
        modelPrefix: "RM",
        sizes: paintedSteelSizes,
        paintColors: standardPaintColors,
        gaugeOptions: [
            GaugeOption(label: "12 Gauge", suffix: "12"),
        ],
        loadCapacity: "Tested to 1,500 lbs",
        coreThickness: "12 Gauge Painted Steel",
        apronSize: "Channel Top Support",
        steelSpec: "14 & 16 Gauge Cold Rolled",
        legSpec: "Formed Steel, Adjustable 30\"-36\"",
        assemblySpec: "Predrilled Holes & Preassembled Legs",
        shipsIn: "1-5 Business Days"
    )

    // MARK: Disposable Particleboard (Model RPB)
    static let disposableParticleboard = WorkbenchProduct(
        series: "Roosevelt",
        topType: .disposableParticleboard,
        modelPrefix: "RPB",
        sizes: standardSizes,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 1,500 lbs",
        coreThickness: "1-1/8\" Particleboard",
        apronSize: "Channel Top Support",
        steelSpec: "14 & 16 Gauge Cold Rolled",
        legSpec: "Formed Steel, Adjustable 30\"-36\"",
        assemblySpec: "Predrilled Holes & Preassembled Legs",
        shipsIn: "1-5 Business Days"
    )

    // MARK: - Helper Functions

    static func formicaProduct(for edgeStyle: FormicaEdgeStyle) -> WorkbenchProduct {
        switch edgeStyle {
        case .square: return formicaSquareEdge
        case .round: return formicaRoundEdge
        case .tMold: return formicaTMoldEdge
        }
    }

    static func butcherBlockProduct(thickness: ButcherBlockThickness, finish: ButcherBlockFinish) -> WorkbenchProduct {
        switch (thickness, finish) {
        case (.one, .oiled): return butcherBlock1Oiled
        case (.one, .lacquered): return butcherBlock1Lacquered
        case (.oneThreeQuarter, .oiled): return butcherBlock175Oiled
        case (.oneThreeQuarter, .lacquered): return butcherBlock175Lacquered
        }
    }

    static func resinProduct(color: ResinColor, thickness: ResinThickness) -> WorkbenchProduct {
        switch (color, thickness) {
        case (.black, .one): return resinBlack1
        case (.black, .threeQuarter): return resinBlack075
        case (.white, .one): return resinWhite1
        case (.white, .threeQuarter): return resinWhite075
        }
    }
}
