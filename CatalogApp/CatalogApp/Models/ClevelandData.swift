import Foundation

struct ClevelandData {

    // MARK: - Cleveland Series Products
    // "Adjustable Height" - Tested to 2,000 lbs (3,000 lbs Cleveland Plus)
    // Uses "C" model prefix with "-2" suffix
    // Depths: 24/30/36/48 (stainless uses 45 instead of 48)
    // 22 size combos per model, max length 96"

    static let standardSizes: [WorkbenchSize] = {
        let configs: [(Int, [Int])] = [
            (24, [24, 30, 36, 48, 60, 72, 96]),
            (30, [30, 36, 48, 60, 72, 96]),
            (36, [36, 48, 60, 72, 96]),
            (48, [48, 60, 72, 96]),
        ]
        var sizes: [WorkbenchSize] = []
        for (depth, lengths) in configs {
            for length in lengths {
                sizes.append(WorkbenchSize(depth: depth, length: length))
            }
        }
        return sizes
    }()

    static let stainlessSteelSizes: [WorkbenchSize] = {
        let configs: [(Int, [Int])] = [
            (24, [24, 30, 36, 48, 60, 72, 96]),
            (30, [30, 36, 48, 60, 72, 96]),
            (36, [36, 48, 60, 72, 96]),
            (45, [48, 60, 72, 96]),
        ]
        var sizes: [WorkbenchSize] = []
        for (depth, lengths) in configs {
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
        disposableParticleboard,
    ]

    // MARK: Formica Laminate - Square Cut Edge (Model CE-2)
    static let formicaSquareEdge = WorkbenchProduct(
        series: "Cleveland",
        topType: .formicaSquareEdge,
        modelPrefix: "CE",
        sizes: standardSizes,
        laminateColors: standardLaminateColors,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 2,000 lbs",
        coreThickness: "1.125\" Solid Wood Core",
        apronSize: "2\" x 1\" Tube",
        heightAdjustable: "6\"",
        shipsIn: "5-10 Business Days"
    )

    // MARK: Formica Laminate - Round Front Edge (Model CF-2)
    static let formicaRoundEdge = WorkbenchProduct(
        series: "Cleveland",
        topType: .formicaRoundEdge,
        modelPrefix: "CF",
        sizes: standardSizes,
        laminateColors: standardLaminateColors,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 2,000 lbs",
        coreThickness: "1.125\" Solid Wood Core",
        apronSize: "2\" x 1\" Tube",
        heightAdjustable: "6\"",
        shipsIn: "5-10 Business Days"
    )

    // MARK: Formica Laminate - T-Mold Bumper Edge (Model CT-2)
    static let formicaTMoldEdge = WorkbenchProduct(
        series: "Cleveland",
        topType: .formicaTMoldEdge,
        modelPrefix: "CT",
        sizes: standardSizes,
        laminateColors: standardLaminateColors,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 2,000 lbs",
        coreThickness: "1.125\" Solid Wood Core",
        apronSize: "2\" x 1\" Tube",
        heightAdjustable: "6\"",
        shipsIn: "5-10 Business Days"
    )

    // MARK: Solid Butcher Block 1" - Oiled (Model CV-2)
    static let butcherBlock1Oiled = WorkbenchProduct(
        series: "Cleveland",
        topType: .butcherBlock1Oiled,
        modelPrefix: "CV",
        sizes: standardSizes,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 2,000 lbs",
        coreThickness: "1\" Solid Butcher Block",
        apronSize: "2\" x 1\" Tube",
        heightAdjustable: "6\"",
        shipsIn: "5-10 Business Days"
    )

    // MARK: Solid Butcher Block 1" - Lacquered (Model CVL-2)
    static let butcherBlock1Lacquered = WorkbenchProduct(
        series: "Cleveland",
        topType: .butcherBlock1Lacquered,
        modelPrefix: "CVL",
        sizes: standardSizes,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 2,000 lbs",
        coreThickness: "1\" Solid Butcher Block",
        apronSize: "2\" x 1\" Tube",
        heightAdjustable: "6\"",
        shipsIn: "5-10 Business Days"
    )

    // MARK: Solid Butcher Block 1-3/4" - Oiled (Model CW-2)
    static let butcherBlock175Oiled = WorkbenchProduct(
        series: "Cleveland",
        topType: .butcherBlock175Oiled,
        modelPrefix: "CW",
        sizes: standardSizes,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 2,000 lbs",
        coreThickness: "1-3/4\" Solid Butcher Block",
        apronSize: "2\" x 1\" Tube",
        heightAdjustable: "6\"",
        shipsIn: "5-10 Business Days"
    )

    // MARK: Solid Butcher Block 1-3/4" - Lacquered (Model CWL-2)
    static let butcherBlock175Lacquered = WorkbenchProduct(
        series: "Cleveland",
        topType: .butcherBlock175Lacquered,
        modelPrefix: "CWL",
        sizes: standardSizes,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 2,000 lbs",
        coreThickness: "1-3/4\" Solid Butcher Block",
        apronSize: "2\" x 1\" Tube",
        heightAdjustable: "6\"",
        shipsIn: "5-10 Business Days"
    )

    // MARK: Resin Top - Black 3/4" (Model CZ-2)
    static let resinBlack075 = WorkbenchProduct(
        series: "Cleveland",
        topType: .resinBlack075,
        modelPrefix: "CZ",
        sizes: standardSizes,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 2,000 lbs",
        coreThickness: "3/4\" Resin",
        apronSize: "2\" x 1\" Tube",
        heightAdjustable: "6\"",
        shipsIn: "5-10 Business Days"
    )

    // MARK: Resin Top - Black 1" (Model CY-2)
    static let resinBlack1 = WorkbenchProduct(
        series: "Cleveland",
        topType: .resinBlack1,
        modelPrefix: "CY",
        sizes: standardSizes,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 2,000 lbs",
        coreThickness: "1\" Resin",
        apronSize: "2\" x 1\" Tube",
        heightAdjustable: "6\"",
        shipsIn: "5-10 Business Days"
    )

    // MARK: Resin Top - White 3/4" (Model CZW-2)
    static let resinWhite075 = WorkbenchProduct(
        series: "Cleveland",
        topType: .resinWhite075,
        modelPrefix: "CZW",
        sizes: standardSizes,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 2,000 lbs",
        coreThickness: "3/4\" Resin",
        apronSize: "2\" x 1\" Tube",
        heightAdjustable: "6\"",
        shipsIn: "5-10 Business Days"
    )

    // MARK: Resin Top - White 1" (Model CYW-2)
    static let resinWhite1 = WorkbenchProduct(
        series: "Cleveland",
        topType: .resinWhite1,
        modelPrefix: "CYW",
        sizes: standardSizes,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 2,000 lbs",
        coreThickness: "1\" Resin",
        apronSize: "2\" x 1\" Tube",
        heightAdjustable: "6\"",
        shipsIn: "5-10 Business Days"
    )

    // MARK: ESD Static Control (Model CD-222)
    static let esdStaticControl = WorkbenchProduct(
        series: "Cleveland",
        topType: .esdStaticControl,
        modelPrefix: "CD",
        sizes: standardSizes,
        laminateColors: esdLaminateColors,
        paintColors: esdPaintColors,
        loadCapacity: "Tested to 2,000 lbs",
        coreThickness: "1.125\" Solid Wood Core",
        apronSize: "2\" x 1\" Tube",
        heightAdjustable: "6\"",
        shipsIn: "5-10 Business Days"
    )

    // MARK: Cleanroom Laminate - Round Front Edge (Model CCR-2)
    static let cleanroomLaminate = WorkbenchProduct(
        series: "Cleveland",
        topType: .cleanroomLaminate,
        modelPrefix: "CCR",
        sizes: standardSizes,
        laminateColors: standardLaminateColors,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 2,000 lbs",
        coreThickness: "1.125\" Solid Wood Core",
        apronSize: "2\" x 1\" Tube",
        heightAdjustable: "6\"",
        shipsIn: "5-10 Business Days"
    )

    // MARK: Cleanroom ESD (Model CDCR-222)
    static let cleanroomESD = WorkbenchProduct(
        series: "Cleveland",
        topType: .cleanroomESD,
        modelPrefix: "CDCR",
        sizes: standardSizes,
        laminateColors: esdLaminateColors,
        paintColors: esdPaintColors,
        loadCapacity: "Tested to 2,000 lbs",
        coreThickness: "1.125\" Solid Wood Core",
        apronSize: "2\" x 1\" Tube",
        heightAdjustable: "6\"",
        shipsIn: "5-10 Business Days"
    )

    // MARK: Stainless Steel (Model CN-2)
    static let stainlessSteel = WorkbenchProduct(
        series: "Cleveland",
        topType: .stainlessSteel,
        modelPrefix: "CN",
        sizes: stainlessSteelSizes,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 2,000 lbs",
        coreThickness: "18 Gauge Stainless Steel",
        apronSize: "2\" x 1\" Tube",
        heightAdjustable: "6\"",
        shipsIn: "5-10 Business Days"
    )

    // MARK: Disposable Particleboard (Model CPB-2)
    static let disposableParticleboard = WorkbenchProduct(
        series: "Cleveland",
        topType: .disposableParticleboard,
        modelPrefix: "CPB",
        sizes: standardSizes,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 2,000 lbs",
        coreThickness: "1\" Particleboard",
        apronSize: "2\" x 1\" Tube",
        heightAdjustable: "6\"",
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
