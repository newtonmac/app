import Foundation

struct PedestalData {

    // MARK: - Pedestal Leg Workbenches
    // "Custom Combinations" - Varies by configuration
    // Uses "P" model prefix
    // Pedestal leg base with cabinet/drawer combinations

    static let standardSizes: [WorkbenchSize] = {
        let depths = [24, 30, 36]
        let lengths = [48, 60, 72, 96]
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

    static let allLaminateColors: [ColorOption] = standardLaminateColors + [
        ColorOption(name: "Steel", hexColor: "#71797E", isPremium: true),
        ColorOption(name: "Graphite", hexColor: "#41424C", isPremium: true),
        ColorOption(name: "Platinum", hexColor: "#E5E4E2", isPremium: true),
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
    ]

    static let allProducts: [WorkbenchProduct] = [
        formicaSquareEdge,
        butcherBlock1Oiled,
        resinBlack1,
        paintedSteel,
        disposableParticleboard,
    ]

    // MARK: Formica Laminate - Square Cut Edge (Model PE)
    static let formicaSquareEdge = WorkbenchProduct(
        series: "Pedestal",
        topType: .formicaSquareEdge,
        modelPrefix: "PE",
        sizes: standardSizes,
        laminateColors: allLaminateColors,
        paintColors: allPaintColors,
        loadCapacity: "Varies by configuration",
        coreThickness: "1.125\" Solid Wood Core",
        apronSize: "Pedestal Base",
        shipsIn: "5-10 Business Days"
    )

    // MARK: Formica Laminate - Round Front Edge (Model PF)
    static let formicaRoundEdge = WorkbenchProduct(
        series: "Pedestal",
        topType: .formicaRoundEdge,
        modelPrefix: "PF",
        sizes: standardSizes,
        laminateColors: allLaminateColors,
        paintColors: allPaintColors,
        loadCapacity: "Varies by configuration",
        coreThickness: "1.125\" Solid Wood Core",
        apronSize: "Pedestal Base",
        shipsIn: "5-10 Business Days"
    )

    // MARK: Formica Laminate - T-Mold Bumper Edge (Model PT)
    static let formicaTMoldEdge = WorkbenchProduct(
        series: "Pedestal",
        topType: .formicaTMoldEdge,
        modelPrefix: "PT",
        sizes: standardSizes,
        laminateColors: allLaminateColors,
        paintColors: allPaintColors,
        loadCapacity: "Varies by configuration",
        coreThickness: "1.125\" Solid Wood Core",
        apronSize: "Pedestal Base",
        shipsIn: "5-10 Business Days"
    )

    // MARK: Solid Butcher Block 1" - Oiled (Model PV)
    static let butcherBlock1Oiled = WorkbenchProduct(
        series: "Pedestal",
        topType: .butcherBlock1Oiled,
        modelPrefix: "PV",
        sizes: standardSizes,
        paintColors: allPaintColors,
        loadCapacity: "Varies by configuration",
        coreThickness: "1\" Solid Butcher Block",
        apronSize: "Pedestal Base",
        shipsIn: "5-10 Business Days"
    )

    // MARK: Solid Butcher Block 1" - Lacquered (Model PVL)
    static let butcherBlock1Lacquered = WorkbenchProduct(
        series: "Pedestal",
        topType: .butcherBlock1Lacquered,
        modelPrefix: "PVL",
        sizes: standardSizes,
        paintColors: allPaintColors,
        loadCapacity: "Varies by configuration",
        coreThickness: "1\" Solid Butcher Block",
        apronSize: "Pedestal Base",
        shipsIn: "5-10 Business Days"
    )

    // MARK: Resin Top - Black 1" (Model PY)
    static let resinBlack1 = WorkbenchProduct(
        series: "Pedestal",
        topType: .resinBlack1,
        modelPrefix: "PY",
        sizes: standardSizes,
        paintColors: allPaintColors,
        loadCapacity: "Varies by configuration",
        coreThickness: "1\" Resin",
        apronSize: "Pedestal Base",
        shipsIn: "5-10 Business Days"
    )

    // MARK: Resin Top - White 1" (Model PYW)
    static let resinWhite1 = WorkbenchProduct(
        series: "Pedestal",
        topType: .resinWhite1,
        modelPrefix: "PYW",
        sizes: standardSizes,
        paintColors: allPaintColors,
        loadCapacity: "Varies by configuration",
        coreThickness: "1\" Resin",
        apronSize: "Pedestal Base",
        shipsIn: "5-10 Business Days"
    )

    // MARK: Painted Steel (Model PM)
    static let paintedSteel = WorkbenchProduct(
        series: "Pedestal",
        topType: .paintedSteel,
        modelPrefix: "PM",
        sizes: standardSizes,
        paintColors: allPaintColors,
        gaugeOptions: [
            GaugeOption(label: "14 Gauge", suffix: "14"),
        ],
        loadCapacity: "Varies by configuration",
        coreThickness: "14 Gauge Painted Steel",
        apronSize: "Pedestal Base",
        shipsIn: "5-10 Business Days"
    )

    // MARK: Disposable Particleboard (Model PPB)
    static let disposableParticleboard = WorkbenchProduct(
        series: "Pedestal",
        topType: .disposableParticleboard,
        modelPrefix: "PPB",
        sizes: standardSizes,
        paintColors: allPaintColors,
        loadCapacity: "Varies by configuration",
        coreThickness: "1-1/8\" Particleboard",
        apronSize: "Pedestal Base",
        shipsIn: "5-10 Business Days"
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
        case (_, .oiled): return butcherBlock1Oiled
        case (_, .lacquered): return butcherBlock1Lacquered
        }
    }

    static func resinProduct(color: ResinColor, thickness: ResinThickness) -> WorkbenchProduct {
        switch (color, thickness) {
        case (.black, _): return resinBlack1
        case (.white, _): return resinWhite1
        }
    }
}
