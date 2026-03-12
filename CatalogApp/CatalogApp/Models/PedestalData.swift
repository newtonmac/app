import Foundation

struct PedestalData {

    // MARK: - Pedestal Leg Workbenches
    // "Custom Combinations" - Varies by configuration
    // Configurable system: pedestal cabinets + replacement tops
    // Tops use "TR" model prefix
    // Top sizes: depths 12-48", lengths 24-120" (38 combos)
    // 4 cabinet types: 130# drawer, 200# drawer, painted door, stainless door

    static let topSizes: [WorkbenchSize] = {
        let configs: [(Int, [Int])] = [
            (12, [24, 36, 48, 60, 72, 96, 120]),
            (18, [24, 36, 48, 60, 72, 96, 120]),
            (24, [24, 36, 48, 60, 72, 96, 120]),
            (30, [36, 48, 60, 72, 96, 120]),
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

    // MARK: - Color Options

    static let standardLaminateColors: [ColorOption] = [
        ColorOption(name: "White", hexColor: "#FFFFFF"),
        ColorOption(name: "Black", hexColor: "#1C1C1E"),
        ColorOption(name: "Beige", hexColor: "#D4C5A9"),
        ColorOption(name: "Light Gray", hexColor: "#C7C7CC"),
        ColorOption(name: "Dark Gray", hexColor: "#636366"),
    ]

    static let esdLaminateColors: [ColorOption] = [
        ColorOption(name: "White", hexColor: "#FFFFFF"),
        ColorOption(name: "Black", hexColor: "#1C1C1E"),
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

    // MARK: - All Products (top styles shown in grid)

    static let allProducts: [WorkbenchProduct] = [
        formicaSquareEdge,
        butcherBlock175Oiled,
        resinBlack1,
        esdStaticControl,
        cleanroomLaminate,
        cleanroomESD,
    ]

    // MARK: Formica Laminate - Square Cut Edge (Model TRE)
    static let formicaSquareEdge = WorkbenchProduct(
        series: "Pedestal",
        topType: .formicaSquareEdge,
        modelPrefix: "TRE",
        sizes: topSizes,
        laminateColors: standardLaminateColors,
        paintColors: standardPaintColors,
        loadCapacity: "Varies by configuration",
        coreThickness: "1.2\" Particleboard Core",
        apronSize: "Pedestal Base",
        shipsIn: "5-10 Business Days"
    )

    // MARK: Formica Laminate - Round Front Edge (Model TRF)
    static let formicaRoundEdge = WorkbenchProduct(
        series: "Pedestal",
        topType: .formicaRoundEdge,
        modelPrefix: "TRF",
        sizes: topSizes,
        laminateColors: standardLaminateColors,
        paintColors: standardPaintColors,
        loadCapacity: "Varies by configuration",
        coreThickness: "1.2\" Particleboard Core",
        apronSize: "Pedestal Base",
        shipsIn: "5-10 Business Days"
    )

    // MARK: Formica Laminate - T-Mold Bumper Edge (Model TRT)
    static let formicaTMoldEdge = WorkbenchProduct(
        series: "Pedestal",
        topType: .formicaTMoldEdge,
        modelPrefix: "TRT",
        sizes: topSizes,
        laminateColors: standardLaminateColors,
        paintColors: standardPaintColors,
        loadCapacity: "Varies by configuration",
        coreThickness: "1.2\" Particleboard Core",
        apronSize: "Pedestal Base",
        shipsIn: "5-10 Business Days"
    )

    // MARK: Solid Butcher Block 1-3/4" - Oiled (Model TRM)
    static let butcherBlock175Oiled = WorkbenchProduct(
        series: "Pedestal",
        topType: .butcherBlock175Oiled,
        modelPrefix: "TRM",
        sizes: topSizes,
        paintColors: standardPaintColors,
        loadCapacity: "Varies by configuration",
        coreThickness: "1-3/4\" Solid Maple Butcher Block",
        apronSize: "Pedestal Base",
        shipsIn: "5-10 Business Days"
    )

    // MARK: Solid Butcher Block 1-3/4" - Radiused Front Edge (Model TRMR)
    static let butcherBlock175Radiused = WorkbenchProduct(
        series: "Pedestal",
        topType: .butcherBlock175Oiled,
        modelPrefix: "TRMR",
        sizes: topSizes,
        paintColors: standardPaintColors,
        loadCapacity: "Varies by configuration",
        coreThickness: "1-3/4\" Solid Maple Butcher Block",
        apronSize: "Pedestal Base",
        shipsIn: "5-10 Business Days"
    )

    // MARK: Resin Top - Black 3/4" (Model TRZ)
    static let resinBlack075 = WorkbenchProduct(
        series: "Pedestal",
        topType: .resinBlack075,
        modelPrefix: "TRZ",
        sizes: topSizes,
        paintColors: standardPaintColors,
        loadCapacity: "Varies by configuration",
        coreThickness: "3/4\" Resin",
        apronSize: "Pedestal Base",
        shipsIn: "5-10 Business Days"
    )

    // MARK: Resin Top - Black 1" (Model TRY)
    static let resinBlack1 = WorkbenchProduct(
        series: "Pedestal",
        topType: .resinBlack1,
        modelPrefix: "TRY",
        sizes: topSizes,
        paintColors: standardPaintColors,
        loadCapacity: "Varies by configuration",
        coreThickness: "1\" Resin",
        apronSize: "Pedestal Base",
        shipsIn: "5-10 Business Days"
    )

    // MARK: ESD Static Control (Model TRRD)
    static let esdStaticControl = WorkbenchProduct(
        series: "Pedestal",
        topType: .esdStaticControl,
        modelPrefix: "TRRD",
        sizes: topSizes,
        laminateColors: esdLaminateColors,
        paintColors: esdPaintColors,
        loadCapacity: "Varies by configuration",
        coreThickness: "1.2\" Particleboard Core",
        apronSize: "Pedestal Base",
        shipsIn: "5-10 Business Days"
    )

    // MARK: Cleanroom Laminate - Square Cut Edge (Model TRECR)
    static let cleanroomLaminateSquare = WorkbenchProduct(
        series: "Pedestal",
        topType: .cleanroomLaminate,
        modelPrefix: "TRECR",
        sizes: topSizes,
        laminateColors: standardLaminateColors,
        paintColors: standardPaintColors,
        loadCapacity: "Varies by configuration",
        coreThickness: "1.2\" Particleboard Core",
        apronSize: "Pedestal Base",
        shipsIn: "5-10 Business Days"
    )

    // MARK: Cleanroom Laminate - Round Front Edge (Model TRRCR)
    static let cleanroomLaminate = WorkbenchProduct(
        series: "Pedestal",
        topType: .cleanroomLaminate,
        modelPrefix: "TRRCR",
        sizes: topSizes,
        laminateColors: standardLaminateColors,
        paintColors: standardPaintColors,
        loadCapacity: "Varies by configuration",
        coreThickness: "1.2\" Particleboard Core",
        apronSize: "Pedestal Base",
        shipsIn: "5-10 Business Days"
    )

    // MARK: Cleanroom ESD (Model TRRCD)
    static let cleanroomESD = WorkbenchProduct(
        series: "Pedestal",
        topType: .cleanroomESD,
        modelPrefix: "TRRCD",
        sizes: topSizes,
        laminateColors: esdLaminateColors,
        paintColors: esdPaintColors,
        loadCapacity: "Varies by configuration",
        coreThickness: "1.2\" Particleboard Core",
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
        case (_, .oiled): return butcherBlock175Oiled
        case (_, .lacquered): return butcherBlock175Oiled
        }
    }

    static func resinProduct(color: ResinColor, thickness: ResinThickness) -> WorkbenchProduct {
        switch (color, thickness) {
        case (.black, .one): return resinBlack1
        case (.black, .threeQuarter): return resinBlack075
        case (.white, .one): return resinBlack1
        case (.white, .threeQuarter): return resinBlack075
        }
    }
}
