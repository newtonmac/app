import Foundation

struct HardingData {

    // MARK: - Harding Series Products
    // "Super Heavy Duty" - Tested to 20,000 lbs
    // Uses "H" model prefix
    // Heavy-duty frame with reinforced legs, all top types available

    static let standardSizes: [WorkbenchSize] = {
        let depths = [24, 30, 36, 48]
        let lengths = [36, 48, 60, 72, 96, 120]
        var sizes: [WorkbenchSize] = []
        for depth in depths {
            for length in lengths where length >= depth {
                sizes.append(WorkbenchSize(depth: depth, length: length))
            }
        }
        return sizes
    }()

    static let stainlessSteelSizes: [WorkbenchSize] = {
        let configs: [(Int, Int)] = [
            (24, 36), (24, 48), (24, 60), (24, 72), (24, 96), (24, 117),
            (30, 36), (30, 48), (30, 60), (30, 72), (30, 96), (30, 117),
            (36, 36), (36, 48), (36, 60), (36, 72), (36, 96), (36, 117),
            (45, 48), (45, 60), (45, 72), (45, 96), (45, 117),
        ]
        return configs.map { WorkbenchSize(depth: $0.0, length: $0.1) }
    }()

    static let paintedSteelSizes: [WorkbenchSize] = {
        let configs: [(Int, Int)] = [
            (24, 36), (24, 48), (24, 60), (24, 72), (24, 96),
            (30, 36), (30, 48), (30, 60), (30, 72), (30, 96),
            (36, 36), (36, 48), (36, 60), (36, 72), (36, 96),
            (45, 48), (45, 60), (45, 72), (45, 96),
        ]
        return configs.map { WorkbenchSize(depth: $0.0, length: $0.1) }
    }()

    static let standardLaminateColors: [ColorOption] = [
        ColorOption(name: "White", hexColor: "#FFFFFF"),
        ColorOption(name: "Black", hexColor: "#1C1C1E"),
        ColorOption(name: "Beige", hexColor: "#D4C5A9"),
        ColorOption(name: "Light Gray", hexColor: "#C7C7CC"),
        ColorOption(name: "Dark Gray", hexColor: "#636366"),
    ]

    static let allLaminateColors: [ColorOption] = standardLaminateColors + [
        ColorOption(name: "Steel", hexColor: "#71797E", isPremium: true),
        ColorOption(name: "Graphite", hexColor: "#41424C", isPremium: true),
        ColorOption(name: "Graystone", hexColor: "#928E85", isPremium: true),
        ColorOption(name: "Platinum", hexColor: "#E5E4E2", isPremium: true),
        ColorOption(name: "Storm", hexColor: "#555D6E", isPremium: true),
    ]

    static let standardPaintColors: [ColorOption] = [
        ColorOption(name: "Blue", hexColor: "#1A5276"),
        ColorOption(name: "Gray", hexColor: "#7F8C8D"),
        ColorOption(name: "Black", hexColor: "#1C1C1E"),
        ColorOption(name: "White", hexColor: "#FFFFFF"),
        ColorOption(name: "Dark Blue", hexColor: "#0E2F56"),
        ColorOption(name: "Beige", hexColor: "#D4C5A9"),
    ]

    static let allPaintColors: [ColorOption] = standardPaintColors + [
        ColorOption(name: "International Orange", hexColor: "#FF4F00", isPremium: true),
        ColorOption(name: "Safety Orange", hexColor: "#FF6600", isPremium: true),
        ColorOption(name: "Yellow", hexColor: "#FFD700", isPremium: true),
        ColorOption(name: "Traffic Green", hexColor: "#007B3A", isPremium: true),
    ]

    static let esdPaintColors: [ColorOption] = [
        ColorOption(name: "Blue", hexColor: "#1A5276"),
        ColorOption(name: "Gray", hexColor: "#7F8C8D"),
        ColorOption(name: "Black", hexColor: "#1C1C1E"),
        ColorOption(name: "White", hexColor: "#FFFFFF"),
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

    static let allProducts: [WorkbenchProduct] = [
        formicaSquareEdge,
        butcherBlock175Oiled,
        resinBlack1,
        esdStaticControl,
        stainlessSteel,
        paintedSteel,
        disposableParticleboard,
    ]

    // MARK: Formica Laminate - Square Cut Edge (Model HE)
    static let formicaSquareEdge = WorkbenchProduct(
        series: "Harding",
        topType: .formicaSquareEdge,
        modelPrefix: "HE",
        sizes: standardSizes,
        laminateColors: allLaminateColors,
        paintColors: allPaintColors,
        loadCapacity: "Tested to 20,000 lbs",
        coreThickness: "1.125\" Solid Wood Core",
        apronSize: "3\" x 3\" Tube",
        shipsIn: "3-7 Business Days"
    )

    // MARK: Formica Laminate - Round Front Edge (Model HF)
    static let formicaRoundEdge = WorkbenchProduct(
        series: "Harding",
        topType: .formicaRoundEdge,
        modelPrefix: "HF",
        sizes: standardSizes,
        laminateColors: allLaminateColors,
        paintColors: allPaintColors,
        loadCapacity: "Tested to 20,000 lbs",
        coreThickness: "1.125\" Solid Wood Core",
        apronSize: "3\" x 3\" Tube",
        shipsIn: "3-7 Business Days"
    )

    // MARK: Formica Laminate - T-Mold Bumper Edge (Model HT)
    static let formicaTMoldEdge = WorkbenchProduct(
        series: "Harding",
        topType: .formicaTMoldEdge,
        modelPrefix: "HT",
        sizes: standardSizes,
        laminateColors: allLaminateColors,
        paintColors: allPaintColors,
        loadCapacity: "Tested to 20,000 lbs",
        coreThickness: "1.125\" Solid Wood Core",
        apronSize: "3\" x 3\" Tube",
        shipsIn: "3-7 Business Days"
    )

    // MARK: Solid Butcher Block 1-3/4" - Oiled (Model HW)
    static let butcherBlock175Oiled = WorkbenchProduct(
        series: "Harding",
        topType: .butcherBlock175Oiled,
        modelPrefix: "HW",
        sizes: standardSizes,
        paintColors: allPaintColors,
        loadCapacity: "Tested to 20,000 lbs",
        coreThickness: "1-3/4\" Solid Butcher Block",
        apronSize: "3\" x 3\" Tube",
        shipsIn: "3-7 Business Days"
    )

    // MARK: Solid Butcher Block 1-3/4" - Lacquered (Model HWL)
    static let butcherBlock175Lacquered = WorkbenchProduct(
        series: "Harding",
        topType: .butcherBlock175Lacquered,
        modelPrefix: "HWL",
        sizes: standardSizes,
        paintColors: allPaintColors,
        loadCapacity: "Tested to 20,000 lbs",
        coreThickness: "1-3/4\" Solid Butcher Block",
        apronSize: "3\" x 3\" Tube",
        shipsIn: "3-7 Business Days"
    )

    // MARK: Resin Top - Black 1" (Model HY)
    static let resinBlack1 = WorkbenchProduct(
        series: "Harding",
        topType: .resinBlack1,
        modelPrefix: "HY",
        sizes: standardSizes,
        paintColors: allPaintColors,
        loadCapacity: "Tested to 20,000 lbs",
        coreThickness: "1\" Resin",
        apronSize: "3\" x 3\" Tube",
        shipsIn: "3-7 Business Days"
    )

    // MARK: Resin Top - White 1" (Model HYW)
    static let resinWhite1 = WorkbenchProduct(
        series: "Harding",
        topType: .resinWhite1,
        modelPrefix: "HYW",
        sizes: standardSizes,
        paintColors: allPaintColors,
        loadCapacity: "Tested to 20,000 lbs",
        coreThickness: "1\" Resin",
        apronSize: "3\" x 3\" Tube",
        shipsIn: "3-7 Business Days"
    )

    // MARK: ESD Static Control (Model HD)
    static let esdStaticControl = WorkbenchProduct(
        series: "Harding",
        topType: .esdStaticControl,
        modelPrefix: "HD",
        sizes: standardSizes,
        laminateColors: esdLaminateColors,
        paintColors: esdPaintColors,
        loadCapacity: "Tested to 20,000 lbs",
        coreThickness: "1.125\" Solid Wood Core",
        apronSize: "3\" x 3\" Tube",
        shipsIn: "3-7 Business Days"
    )

    // MARK: Stainless Steel (Model HN)
    static let stainlessSteel = WorkbenchProduct(
        series: "Harding",
        topType: .stainlessSteel,
        modelPrefix: "HN",
        sizes: stainlessSteelSizes,
        paintColors: allPaintColors,
        loadCapacity: "Tested to 20,000 lbs",
        coreThickness: "18 Gauge Stainless Steel",
        apronSize: "3\" x 3\" Tube",
        shipsIn: "3-7 Business Days"
    )

    // MARK: Painted Steel (Model HM)
    static let paintedSteel = WorkbenchProduct(
        series: "Harding",
        topType: .paintedSteel,
        modelPrefix: "HM",
        sizes: paintedSteelSizes,
        paintColors: allPaintColors,
        gaugeOptions: [
            GaugeOption(label: "12 Gauge", suffix: "12"),
        ],
        loadCapacity: "Tested to 20,000 lbs",
        coreThickness: "12 Gauge Painted Steel",
        apronSize: "3\" x 3\" Tube",
        shipsIn: "3-7 Business Days"
    )

    // MARK: Disposable Particleboard (Model HPB)
    static let disposableParticleboard = WorkbenchProduct(
        series: "Harding",
        topType: .disposableParticleboard,
        modelPrefix: "HPB",
        sizes: standardSizes,
        paintColors: allPaintColors,
        loadCapacity: "Tested to 20,000 lbs",
        coreThickness: "1-1/8\" Particleboard",
        apronSize: "3\" x 3\" Tube",
        shipsIn: "3-7 Business Days"
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
        case (_, .oiled): return butcherBlock175Oiled
        case (_, .lacquered): return butcherBlock175Lacquered
        }
    }

    static func resinProduct(color: ResinColor, thickness: ResinThickness) -> WorkbenchProduct {
        switch (color, thickness) {
        case (.black, _): return resinBlack1
        case (.white, _): return resinWhite1
        }
    }
}
