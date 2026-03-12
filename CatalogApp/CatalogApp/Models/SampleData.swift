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

    static let allProducts: [WorkbenchProduct] = [
        formicaRoundEdge,
        formicaTMoldEdge,
        formicaSquareEdge,
        butcherBlockOiled,
        butcherBlockLacquered,
        esdStaticControl,
        cleanroomLaminate,
        cleanroomESD,
        stainlessSteel,
        paintedSteel,
        disposableParticleboard,
    ]

    // MARK: Formica Laminate - Round Front Edge (Model KF)
    static let formicaRoundEdge = WorkbenchProduct(
        series: "Kennedy",
        topType: .formicaRoundEdge,
        modelPrefix: "KF",
        sizes: standardSizes,
        laminateColors: standardLaminateColors,
        paintColors: standardPaintColors
    )

    // MARK: Formica Laminate - T-Mold Bumper Edge (Model KT)
    static let formicaTMoldEdge = WorkbenchProduct(
        series: "Kennedy",
        topType: .formicaTMoldEdge,
        modelPrefix: "KT",
        sizes: standardSizes,
        laminateColors: standardLaminateColors,
        paintColors: standardPaintColors
    )

    // MARK: Formica Laminate - Square Cut Edge (Model KE)
    static let formicaSquareEdge = WorkbenchProduct(
        series: "Kennedy",
        topType: .formicaSquareEdge,
        modelPrefix: "KE",
        sizes: standardSizes,
        laminateColors: standardLaminateColors,
        paintColors: standardPaintColors
    )

    // MARK: Solid Butcher Block - Oiled (Model KWR)
    static let butcherBlockOiled = WorkbenchProduct(
        series: "Kennedy",
        topType: .butcherBlockOiled,
        modelPrefix: "KWR",
        sizes: standardSizes,
        paintColors: standardPaintColors
    )

    // MARK: Solid Butcher Block - Lacquered (Model KWR-L)
    static let butcherBlockLacquered = WorkbenchProduct(
        series: "Kennedy",
        topType: .butcherBlockLacquered,
        modelPrefix: "KWR-L",
        sizes: standardSizes,
        paintColors: standardPaintColors
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
        paintColors: standardPaintColors
    )

    // MARK: Painted Steel (Model KM)
    static let paintedSteel = WorkbenchProduct(
        series: "Kennedy",
        topType: .paintedSteel,
        modelPrefix: "KM",
        sizes: paintedSteelSizes,
        paintColors: standardPaintColors
    )

    // MARK: Disposable Particleboard (Model KPB)
    static let disposableParticleboard = WorkbenchProduct(
        series: "Kennedy",
        topType: .disposableParticleboard,
        modelPrefix: "KPB",
        sizes: standardSizes,
        paintColors: standardPaintColors
    )
}
