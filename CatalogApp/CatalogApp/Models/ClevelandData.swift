import Foundation

struct ClevelandData {

    // MARK: - Cleveland Series Products
    // "Adjustable Height" - Tested to 800 lbs
    // Uses "C" model prefix
    // Electric or hand-crank height adjustment, lighter top options

    static let standardSizes: [WorkbenchSize] = {
        let depths = [24, 30, 36]
        let lengths = [36, 48, 60, 72]
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
        ColorOption(name: "Oxygen", hexColor: "#E8F0FE", isPremium: true),
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
        ColorOption(name: "Blue ESD", hexColor: "#2E86C1"),
        ColorOption(name: "Gray ESD", hexColor: "#95A5A6"),
        ColorOption(name: "Black ESD", hexColor: "#2C3E50"),
    ]

    static let allProducts: [WorkbenchProduct] = [
        formicaSquareEdge,
        butcherBlock1Oiled,
        resinBlack1,
        esdStaticControl,
        disposableParticleboard,
    ]

    // MARK: Formica Laminate - Square Cut Edge (Model CE)
    static let formicaSquareEdge = WorkbenchProduct(
        series: "Cleveland",
        topType: .formicaSquareEdge,
        modelPrefix: "CE",
        sizes: standardSizes,
        laminateColors: allLaminateColors,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 800 lbs",
        coreThickness: "1.125\" Solid Wood Core",
        apronSize: "2\" x 1\" Tube",
        shipsIn: "5-10 Business Days"
    )

    // MARK: Formica Laminate - Round Front Edge (Model CF)
    static let formicaRoundEdge = WorkbenchProduct(
        series: "Cleveland",
        topType: .formicaRoundEdge,
        modelPrefix: "CF",
        sizes: standardSizes,
        laminateColors: allLaminateColors,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 800 lbs",
        coreThickness: "1.125\" Solid Wood Core",
        apronSize: "2\" x 1\" Tube",
        shipsIn: "5-10 Business Days"
    )

    // MARK: Formica Laminate - T-Mold Bumper Edge (Model CT)
    static let formicaTMoldEdge = WorkbenchProduct(
        series: "Cleveland",
        topType: .formicaTMoldEdge,
        modelPrefix: "CT",
        sizes: standardSizes,
        laminateColors: allLaminateColors,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 800 lbs",
        coreThickness: "1.125\" Solid Wood Core",
        apronSize: "2\" x 1\" Tube",
        shipsIn: "5-10 Business Days"
    )

    // MARK: Solid Butcher Block 1" - Oiled (Model CV)
    static let butcherBlock1Oiled = WorkbenchProduct(
        series: "Cleveland",
        topType: .butcherBlock1Oiled,
        modelPrefix: "CV",
        sizes: standardSizes,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 800 lbs",
        coreThickness: "1\" Solid Butcher Block",
        apronSize: "2\" x 1\" Tube",
        shipsIn: "5-10 Business Days"
    )

    // MARK: Solid Butcher Block 1" - Lacquered (Model CVL)
    static let butcherBlock1Lacquered = WorkbenchProduct(
        series: "Cleveland",
        topType: .butcherBlock1Lacquered,
        modelPrefix: "CVL",
        sizes: standardSizes,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 800 lbs",
        coreThickness: "1\" Solid Butcher Block",
        apronSize: "2\" x 1\" Tube",
        shipsIn: "5-10 Business Days"
    )

    // MARK: Resin Top - Black 1" (Model CY)
    static let resinBlack1 = WorkbenchProduct(
        series: "Cleveland",
        topType: .resinBlack1,
        modelPrefix: "CY",
        sizes: standardSizes,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 800 lbs",
        coreThickness: "1\" Resin",
        apronSize: "2\" x 1\" Tube",
        shipsIn: "5-10 Business Days"
    )

    // MARK: Resin Top - White 1" (Model CYW)
    static let resinWhite1 = WorkbenchProduct(
        series: "Cleveland",
        topType: .resinWhite1,
        modelPrefix: "CYW",
        sizes: standardSizes,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 800 lbs",
        coreThickness: "1\" Resin",
        apronSize: "2\" x 1\" Tube",
        shipsIn: "5-10 Business Days"
    )

    // MARK: ESD Static Control (Model CD)
    static let esdStaticControl = WorkbenchProduct(
        series: "Cleveland",
        topType: .esdStaticControl,
        modelPrefix: "CD",
        sizes: standardSizes,
        laminateColors: esdLaminateColors,
        paintColors: esdPaintColors,
        loadCapacity: "Tested to 800 lbs",
        coreThickness: "1.125\" Solid Wood Core",
        apronSize: "2\" x 1\" Tube",
        shipsIn: "5-10 Business Days"
    )

    // MARK: Disposable Particleboard (Model CPB)
    static let disposableParticleboard = WorkbenchProduct(
        series: "Cleveland",
        topType: .disposableParticleboard,
        modelPrefix: "CPB",
        sizes: standardSizes,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 800 lbs",
        coreThickness: "1-1/8\" Particleboard",
        apronSize: "2\" x 1\" Tube",
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
