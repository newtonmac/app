import Foundation

struct HardingData {

    // MARK: - Harding Series Products
    // "Super Heavy Duty" - Tested to 20,000 lbs
    // Uses "H" model prefix
    // Depths: 24/30/36/48, Formica up to 168", Resin up to 144"
    // Stainless uses 43" depth (not 48) and 115" max length

    static let formicaSizes: [WorkbenchSize] = {
        let configs: [(Int, [Int])] = [
            (24, [24, 30, 36, 48, 60, 72, 96, 120, 144, 168]),
            (30, [30, 36, 48, 60, 72, 96, 120, 144, 168]),
            (36, [36, 48, 60, 72, 96, 120, 144, 168]),
            (48, [48, 60, 72, 96, 120, 144, 168]),
        ]
        var sizes: [WorkbenchSize] = []
        for (depth, lengths) in configs {
            for length in lengths {
                sizes.append(WorkbenchSize(depth: depth, length: length))
            }
        }
        return sizes
    }()

    static let butcherBlockSizes: [WorkbenchSize] = {
        let configs: [(Int, [Int])] = [
            (24, [24, 30, 36, 48, 60, 72, 96, 120]),
            (30, [30, 36, 48, 60, 72, 96, 120]),
            (36, [36, 48, 60, 72, 96, 120]),
            (48, [48, 60, 72, 96, 120]),
        ]
        var sizes: [WorkbenchSize] = []
        for (depth, lengths) in configs {
            for length in lengths {
                sizes.append(WorkbenchSize(depth: depth, length: length))
            }
        }
        return sizes
    }()

    static let resinSizes: [WorkbenchSize] = {
        let configs: [(Int, [Int])] = [
            (24, [24, 30, 36, 48, 60, 72, 96, 120, 144]),
            (30, [30, 36, 48, 60, 72, 96, 120, 144]),
            (36, [36, 48, 60, 72, 96, 120, 144]),
            (48, [48, 60, 72, 96, 120, 144]),
        ]
        var sizes: [WorkbenchSize] = []
        for (depth, lengths) in configs {
            for length in lengths {
                sizes.append(WorkbenchSize(depth: depth, length: length))
            }
        }
        return sizes
    }()

    static let esdSizes: [WorkbenchSize] = butcherBlockSizes

    static let stainlessSteelSizes: [WorkbenchSize] = {
        let configs: [(Int, [Int])] = [
            (24, [24, 30, 36, 48, 60, 72, 96, 115]),
            (30, [30, 36, 48, 60, 72, 96, 115]),
            (36, [36, 48, 60, 72, 96, 115]),
            (43, [48, 60, 72, 96, 115]),
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
        butcherBlock175Oiled,
        resinBlack1,
        esdStaticControl,
        stainlessSteel,
    ]

    // MARK: Formica Laminate - Round Front Edge (Model HF)
    static let formicaRoundEdge = WorkbenchProduct(
        series: "Harding",
        topType: .formicaRoundEdge,
        modelPrefix: "HF",
        sizes: formicaSizes,
        laminateColors: standardLaminateColors,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 20,000 lbs",
        coreThickness: "2.5\" Solid Wood Core",
        apronSize: "3\" x 2\" Tube",
        steelSpec: "14 Gauge Cold Rolled",
        legSpec: "3\" x 3\" Tube w/ 3\" x 2\" Spreaders",
        assemblySpec: "2 Bolts Per Leg",
        shipsIn: "3-7 Business Days"
    )

    // MARK: Formica Laminate - T-Mold Bumper Edge (Model HT)
    static let formicaTMoldEdge = WorkbenchProduct(
        series: "Harding",
        topType: .formicaTMoldEdge,
        modelPrefix: "HT",
        sizes: formicaSizes,
        laminateColors: standardLaminateColors,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 20,000 lbs",
        coreThickness: "2.5\" Solid Wood Core",
        apronSize: "3\" x 2\" Tube",
        steelSpec: "14 Gauge Cold Rolled",
        legSpec: "3\" x 3\" Tube w/ 3\" x 2\" Spreaders",
        assemblySpec: "2 Bolts Per Leg",
        shipsIn: "3-7 Business Days"
    )

    // MARK: Formica Laminate - Square Cut Edge (Model HE)
    static let formicaSquareEdge = WorkbenchProduct(
        series: "Harding",
        topType: .formicaSquareEdge,
        modelPrefix: "HE",
        sizes: formicaSizes,
        laminateColors: standardLaminateColors,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 20,000 lbs",
        coreThickness: "2.5\" Solid Wood Core",
        apronSize: "3\" x 2\" Tube",
        steelSpec: "14 Gauge Cold Rolled",
        legSpec: "3\" x 3\" Tube w/ 3\" x 2\" Spreaders",
        assemblySpec: "2 Bolts Per Leg",
        shipsIn: "3-7 Business Days"
    )

    // MARK: Solid Butcher Block 1-3/4" - Oiled (Model HW)
    static let butcherBlock175Oiled = WorkbenchProduct(
        series: "Harding",
        topType: .butcherBlock175Oiled,
        modelPrefix: "HW",
        sizes: butcherBlockSizes,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 20,000 lbs",
        coreThickness: "1-3/4\" Solid Butcher Block",
        apronSize: "3\" x 2\" Tube",
        steelSpec: "14 Gauge Cold Rolled",
        legSpec: "3\" x 3\" Tube w/ 3\" x 2\" Spreaders",
        assemblySpec: "2 Bolts Per Leg",
        shipsIn: "3-7 Business Days"
    )

    // MARK: Solid Butcher Block 1-3/4" - Lacquered (Model HWL)
    static let butcherBlock175Lacquered = WorkbenchProduct(
        series: "Harding",
        topType: .butcherBlock175Lacquered,
        modelPrefix: "HWL",
        sizes: butcherBlockSizes,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 20,000 lbs",
        coreThickness: "1-3/4\" Solid Butcher Block",
        apronSize: "3\" x 2\" Tube",
        steelSpec: "14 Gauge Cold Rolled",
        legSpec: "3\" x 3\" Tube w/ 3\" x 2\" Spreaders",
        assemblySpec: "2 Bolts Per Leg",
        shipsIn: "3-7 Business Days"
    )

    // MARK: Resin Top - Black 1" (Model HY)
    static let resinBlack1 = WorkbenchProduct(
        series: "Harding",
        topType: .resinBlack1,
        modelPrefix: "HY",
        sizes: resinSizes,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 20,000 lbs",
        coreThickness: "1\" Resin",
        apronSize: "3\" x 2\" Tube",
        steelSpec: "14 Gauge Cold Rolled",
        legSpec: "3\" x 3\" Tube w/ 3\" x 2\" Spreaders",
        assemblySpec: "2 Bolts Per Leg",
        shipsIn: "3-7 Business Days"
    )

    // MARK: Resin Top - White 1" (Model HYW)
    static let resinWhite1 = WorkbenchProduct(
        series: "Harding",
        topType: .resinWhite1,
        modelPrefix: "HYW",
        sizes: resinSizes,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 20,000 lbs",
        coreThickness: "1\" Resin",
        apronSize: "3\" x 2\" Tube",
        steelSpec: "14 Gauge Cold Rolled",
        legSpec: "3\" x 3\" Tube w/ 3\" x 2\" Spreaders",
        assemblySpec: "2 Bolts Per Leg",
        shipsIn: "3-7 Business Days"
    )

    // MARK: ESD Static Control (Model HD)
    static let esdStaticControl = WorkbenchProduct(
        series: "Harding",
        topType: .esdStaticControl,
        modelPrefix: "HD",
        sizes: esdSizes,
        laminateColors: esdLaminateColors,
        paintColors: esdPaintColors,
        loadCapacity: "Tested to 20,000 lbs",
        coreThickness: "2.5\" Solid Wood Core",
        apronSize: "3\" x 2\" Tube",
        steelSpec: "14 Gauge Cold Rolled",
        legSpec: "3\" x 3\" Tube w/ 3\" x 2\" Spreaders",
        assemblySpec: "2 Bolts Per Leg",
        shipsIn: "3-7 Business Days"
    )

    // MARK: Stainless Steel (Model HN)
    static let stainlessSteel = WorkbenchProduct(
        series: "Harding",
        topType: .stainlessSteel,
        modelPrefix: "HN",
        sizes: stainlessSteelSizes,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 20,000 lbs",
        coreThickness: "18 Gauge Stainless Steel",
        apronSize: "3\" x 2\" Tube",
        steelSpec: "14 Gauge Cold Rolled",
        legSpec: "3\" x 3\" Tube w/ 3\" x 2\" Spreaders",
        assemblySpec: "2 Bolts Per Leg",
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
