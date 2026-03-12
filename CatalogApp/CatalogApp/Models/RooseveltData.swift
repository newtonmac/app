import Foundation

struct RooseveltData {

    // MARK: - Roosevelt Series Products
    // "Most Affordable" - Tested to 1,500 lbs
    // Uses "R" model prefix instead of "K"
    // Offers same top types but with lighter-duty frame

    static let standardSizes: [WorkbenchSize] = {
        let depths = [24, 30, 36]
        let lengths = [24, 30, 36, 48, 60, 72]
        var sizes: [WorkbenchSize] = []
        for depth in depths {
            for length in lengths where length >= depth {
                sizes.append(WorkbenchSize(depth: depth, length: length))
            }
        }
        return sizes
    }()

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
        ColorOption(name: "Beige", hexColor: "#D4C5A9"),
    ]

    static let allProducts: [WorkbenchProduct] = [
        formicaSquareEdge,
        butcherBlock1Oiled,
        resinBlack1,
        esdStaticControl,
        paintedSteel,
        disposableParticleboard,
    ]

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
        apronSize: "1-1/2\" x 1\" Tube",
        shipsIn: "1-5 Business Days"
    )

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
        apronSize: "1-1/2\" x 1\" Tube",
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
        apronSize: "1-1/2\" x 1\" Tube",
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
        apronSize: "1-1/2\" x 1\" Tube",
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
        apronSize: "1-1/2\" x 1\" Tube",
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
        apronSize: "1-1/2\" x 1\" Tube",
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
        apronSize: "1-1/2\" x 1\" Tube",
        shipsIn: "1-5 Business Days"
    )

    // MARK: ESD Static Control (Model RD)
    static let esdStaticControl = WorkbenchProduct(
        series: "Roosevelt",
        topType: .esdStaticControl,
        modelPrefix: "RD",
        sizes: standardSizes,
        laminateColors: [
            ColorOption(name: "White", hexColor: "#FFFFFF"),
            ColorOption(name: "Black", hexColor: "#1C1C1E"),
            ColorOption(name: "Light Gray", hexColor: "#C7C7CC"),
            ColorOption(name: "Dark Gray", hexColor: "#636366"),
        ],
        paintColors: [
            ColorOption(name: "Blue", hexColor: "#1A5276"),
            ColorOption(name: "Gray", hexColor: "#7F8C8D"),
            ColorOption(name: "Black", hexColor: "#1C1C1E"),
            ColorOption(name: "White", hexColor: "#FFFFFF"),
            ColorOption(name: "Beige", hexColor: "#D4C5A9"),
            ColorOption(name: "Blue ESD", hexColor: "#2E86C1"),
            ColorOption(name: "Gray ESD", hexColor: "#95A5A6"),
            ColorOption(name: "Black ESD", hexColor: "#2C3E50"),
        ],
        loadCapacity: "Tested to 1,500 lbs",
        coreThickness: "1.125\" Solid Wood Core",
        apronSize: "1-1/2\" x 1\" Tube",
        shipsIn: "1-5 Business Days"
    )

    // MARK: Painted Steel (Model RM)
    static let paintedSteel = WorkbenchProduct(
        series: "Roosevelt",
        topType: .paintedSteel,
        modelPrefix: "RM",
        sizes: standardSizes,
        paintColors: standardPaintColors,
        gaugeOptions: [
            GaugeOption(label: "14 Gauge", suffix: "14"),
        ],
        loadCapacity: "Tested to 1,500 lbs",
        coreThickness: "14 Gauge Painted Steel",
        apronSize: "1-1/2\" x 1\" Tube",
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
        apronSize: "1-1/2\" x 1\" Tube",
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
        case (.oneThreeQuarter, .oiled): return butcherBlock1Oiled
        case (.oneThreeQuarter, .lacquered): return butcherBlock1Lacquered
        }
    }

    static func resinProduct(color: ResinColor, thickness: ResinThickness) -> WorkbenchProduct {
        switch (color, thickness) {
        case (.black, _): return resinBlack1
        case (.white, _): return resinWhite1
        }
    }
}
