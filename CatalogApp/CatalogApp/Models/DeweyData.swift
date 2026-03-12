import Foundation

struct DeweyData {

    // MARK: - Dewey Series Products
    // "Recessed Legs" - Tested to 5,000 lbs (1,200 lbs for white resin)
    // Uses "D" model prefix
    // 16-gauge cold rolled steel frame, welded construction
    // Depths: 24/30/36 standard, stainless adds 45"
    // 18 size combos standard, 22 for stainless

    static let standardSizes: [WorkbenchSize] = {
        let configs: [(Int, [Int])] = [
            (24, [24, 30, 36, 48, 60, 72, 96]),
            (30, [30, 36, 48, 60, 72, 96]),
            (36, [36, 48, 60, 72, 96]),
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
        butcherBlock175Oiled,
        resinBlack1,
        esdStaticControl,
        cleanroomLaminate,
        cleanroomESD,
        stainlessSteel,
        disposableParticleboard,
    ]

    // MARK: Formica Laminate - Square Cut Edge (Model DE)
    static let formicaSquareEdge = WorkbenchProduct(
        series: "Dewey",
        topType: .formicaSquareEdge,
        modelPrefix: "DE",
        sizes: standardSizes,
        laminateColors: standardLaminateColors,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 5,000 lbs",
        coreThickness: "1.125\" Solid Wood Core",
        apronSize: "2\" x 2\" Tube",
        shipsIn: "3-7 Business Days"
    )

    // MARK: Formica Laminate - Round Front Edge (Model DF)
    static let formicaRoundEdge = WorkbenchProduct(
        series: "Dewey",
        topType: .formicaRoundEdge,
        modelPrefix: "DF",
        sizes: standardSizes,
        laminateColors: standardLaminateColors,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 5,000 lbs",
        coreThickness: "1.125\" Solid Wood Core",
        apronSize: "2\" x 2\" Tube",
        shipsIn: "3-7 Business Days"
    )

    // MARK: Formica Laminate - T-Mold Bumper Edge (Model DT)
    static let formicaTMoldEdge = WorkbenchProduct(
        series: "Dewey",
        topType: .formicaTMoldEdge,
        modelPrefix: "DT",
        sizes: standardSizes,
        laminateColors: standardLaminateColors,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 5,000 lbs",
        coreThickness: "1.125\" Solid Wood Core",
        apronSize: "2\" x 2\" Tube",
        shipsIn: "3-7 Business Days"
    )

    // MARK: Solid Butcher Block 1-3/4" - Oiled (Model DW)
    static let butcherBlock175Oiled = WorkbenchProduct(
        series: "Dewey",
        topType: .butcherBlock175Oiled,
        modelPrefix: "DW",
        sizes: standardSizes,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 5,000 lbs",
        coreThickness: "1-3/4\" Solid Butcher Block",
        apronSize: "2\" x 2\" Tube",
        shipsIn: "3-7 Business Days"
    )

    // MARK: Solid Butcher Block 1-3/4" - Lacquered (Model DWL)
    static let butcherBlock175Lacquered = WorkbenchProduct(
        series: "Dewey",
        topType: .butcherBlock175Lacquered,
        modelPrefix: "DWL",
        sizes: standardSizes,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 5,000 lbs",
        coreThickness: "1-3/4\" Solid Butcher Block",
        apronSize: "2\" x 2\" Tube",
        shipsIn: "3-7 Business Days"
    )

    // MARK: Resin Top - Black 3/4" (Model DZ)
    static let resinBlack075 = WorkbenchProduct(
        series: "Dewey",
        topType: .resinBlack075,
        modelPrefix: "DZ",
        sizes: standardSizes,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 5,000 lbs",
        coreThickness: "3/4\" Resin",
        apronSize: "2\" x 2\" Tube",
        shipsIn: "3-7 Business Days"
    )

    // MARK: Resin Top - Black 1" (Model DY)
    static let resinBlack1 = WorkbenchProduct(
        series: "Dewey",
        topType: .resinBlack1,
        modelPrefix: "DY",
        sizes: standardSizes,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 5,000 lbs",
        coreThickness: "1\" Resin",
        apronSize: "2\" x 2\" Tube",
        shipsIn: "3-7 Business Days"
    )

    // MARK: Resin Top - White 3/4" (Model DZW)
    static let resinWhite075 = WorkbenchProduct(
        series: "Dewey",
        topType: .resinWhite075,
        modelPrefix: "DZW",
        sizes: standardSizes,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 1,200 lbs",
        coreThickness: "3/4\" Resin",
        apronSize: "2\" x 2\" Tube",
        shipsIn: "3-7 Business Days"
    )

    // MARK: Resin Top - White 1" (Model DYW)
    static let resinWhite1 = WorkbenchProduct(
        series: "Dewey",
        topType: .resinWhite1,
        modelPrefix: "DYW",
        sizes: standardSizes,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 1,200 lbs",
        coreThickness: "1\" Resin",
        apronSize: "2\" x 2\" Tube",
        shipsIn: "3-7 Business Days"
    )

    // MARK: ESD Static Control (Model DD)
    static let esdStaticControl = WorkbenchProduct(
        series: "Dewey",
        topType: .esdStaticControl,
        modelPrefix: "DD",
        sizes: standardSizes,
        laminateColors: esdLaminateColors,
        paintColors: esdPaintColors,
        loadCapacity: "Tested to 5,000 lbs",
        coreThickness: "1.125\" Solid Wood Core",
        apronSize: "2\" x 2\" Tube",
        shipsIn: "3-7 Business Days"
    )

    // MARK: Cleanroom Laminate - Round Front Edge (Model DCR)
    static let cleanroomLaminate = WorkbenchProduct(
        series: "Dewey",
        topType: .cleanroomLaminate,
        modelPrefix: "DCR",
        sizes: standardSizes,
        laminateColors: standardLaminateColors,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 5,000 lbs",
        coreThickness: "1.125\" Solid Wood Core",
        apronSize: "2\" x 2\" Tube",
        shipsIn: "3-7 Business Days"
    )

    // MARK: Cleanroom ESD (Model DDCR)
    static let cleanroomESD = WorkbenchProduct(
        series: "Dewey",
        topType: .cleanroomESD,
        modelPrefix: "DDCR",
        sizes: standardSizes,
        laminateColors: esdLaminateColors,
        paintColors: esdPaintColors,
        loadCapacity: "Tested to 5,000 lbs",
        coreThickness: "1.125\" Solid Wood Core",
        apronSize: "2\" x 2\" Tube",
        shipsIn: "3-7 Business Days"
    )

    // MARK: Stainless Steel (Model DN)
    static let stainlessSteel = WorkbenchProduct(
        series: "Dewey",
        topType: .stainlessSteel,
        modelPrefix: "DN",
        sizes: stainlessSteelSizes,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 5,000 lbs",
        coreThickness: "18 Gauge Stainless Steel",
        apronSize: "2\" x 2\" Tube",
        shipsIn: "3-7 Business Days"
    )

    // MARK: Disposable Particleboard (Model DPB)
    static let disposableParticleboard = WorkbenchProduct(
        series: "Dewey",
        topType: .disposableParticleboard,
        modelPrefix: "DPB",
        sizes: standardSizes,
        paintColors: standardPaintColors,
        loadCapacity: "Tested to 5,000 lbs",
        coreThickness: "1-1/8\" Particleboard",
        apronSize: "2\" x 2\" Tube",
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
        case (.black, .one): return resinBlack1
        case (.black, .threeQuarter): return resinBlack075
        case (.white, .one): return resinWhite1
        case (.white, .threeQuarter): return resinWhite075
        }
    }
}
