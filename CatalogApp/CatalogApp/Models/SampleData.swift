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

    // MARK: - Common Size/Price Helpers

    static func size(_ d: Int, _ l: Int) -> WorkbenchSize {
        WorkbenchSize(depth: d, length: l)
    }

    static func entry(_ d: Int, _ l: Int, _ p: Double) -> PriceEntry {
        PriceEntry(size: size(d, l), price: p)
    }

    // MARK: - Kennedy Series Products

    static let allProducts: [WorkbenchProduct] = [
        formicaRoundEdge,
        formicaTMoldEdge,
        formicaSquareEdge,
        butcherBlockOiled,
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
        priceEntries: [
            entry(24, 24, 280.97), entry(24, 30, 298.97), entry(24, 36, 316.97),
            entry(24, 48, 350.96), entry(24, 60, 385.96), entry(24, 72, 420.96),
            entry(24, 96, 490.95), entry(24, 120, 559.95),
            entry(30, 30, 327.97), entry(30, 36, 348.96), entry(30, 48, 389.96),
            entry(30, 60, 429.96), entry(30, 72, 471.95), entry(30, 96, 553.95),
            entry(30, 120, 633.94),
            entry(36, 36, 380.96), entry(36, 48, 427.96), entry(36, 60, 474.95),
            entry(36, 72, 523.95), entry(36, 96, 618.94), entry(36, 120, 711.93),
            entry(48, 48, 494.95), entry(48, 60, 552.95), entry(48, 72, 611.94),
            entry(48, 96, 731.93), entry(48, 120, 849.92),
        ],
        laminateColors: standardLaminateColors,
        paintColors: standardPaintColors
    )

    // MARK: Formica Laminate - T-Mold Bumper Edge (Model KT)
    static let formicaTMoldEdge = WorkbenchProduct(
        series: "Kennedy",
        topType: .formicaTMoldEdge,
        modelPrefix: "KT",
        priceEntries: [
            entry(24, 24, 282.97), entry(24, 30, 300.97), entry(24, 36, 318.97),
            entry(24, 48, 352.96), entry(24, 60, 387.96), entry(24, 72, 422.96),
            entry(24, 96, 492.95), entry(24, 120, 561.95),
            entry(30, 30, 329.97), entry(30, 36, 350.96), entry(30, 48, 391.96),
            entry(30, 60, 431.96), entry(30, 72, 473.95), entry(30, 96, 555.95),
            entry(30, 120, 635.94),
            entry(36, 36, 382.96), entry(36, 48, 429.96), entry(36, 60, 476.95),
            entry(36, 72, 525.95), entry(36, 96, 620.94), entry(36, 120, 713.93),
            entry(48, 48, 496.95), entry(48, 60, 554.95), entry(48, 72, 613.94),
            entry(48, 96, 733.93), entry(48, 120, 851.92),
        ],
        laminateColors: standardLaminateColors,
        paintColors: standardPaintColors
    )

    // MARK: Formica Laminate - Square Cut Edge (Model KE)
    static let formicaSquareEdge = WorkbenchProduct(
        series: "Kennedy",
        topType: .formicaSquareEdge,
        modelPrefix: "KE",
        priceEntries: [
            entry(24, 24, 273.97), entry(24, 30, 291.97), entry(24, 36, 309.97),
            entry(24, 48, 343.96), entry(24, 60, 378.96), entry(24, 72, 413.96),
            entry(24, 96, 483.95), entry(24, 120, 552.95),
            entry(30, 30, 320.97), entry(30, 36, 341.96), entry(30, 48, 382.96),
            entry(30, 60, 422.96), entry(30, 72, 464.95), entry(30, 96, 546.95),
            entry(30, 120, 626.94),
            entry(36, 36, 373.96), entry(36, 48, 420.96), entry(36, 60, 467.95),
            entry(36, 72, 516.95), entry(36, 96, 611.94), entry(36, 120, 704.93),
            entry(48, 48, 487.95), entry(48, 60, 545.95), entry(48, 72, 604.94),
            entry(48, 96, 724.93), entry(48, 120, 842.92),
        ],
        laminateColors: standardLaminateColors,
        paintColors: standardPaintColors
    )

    // MARK: Solid Butcher Block - Oiled (Model KWR)
    static let butcherBlockOiled = WorkbenchProduct(
        series: "Kennedy",
        topType: .butcherBlockOiled,
        modelPrefix: "KWR",
        priceEntries: [
            entry(24, 24, 352.96), entry(24, 30, 392.96), entry(24, 36, 429.96),
            entry(24, 48, 504.95), entry(24, 60, 579.95), entry(24, 72, 654.94),
            entry(24, 96, 842.92), entry(24, 120, 997.90),
            entry(30, 30, 440.96), entry(30, 36, 487.95), entry(30, 48, 577.95),
            entry(30, 60, 667.94), entry(30, 72, 757.93), entry(30, 96, 979.90),
            entry(30, 120, 1161.88),
            entry(36, 36, 545.95), entry(36, 48, 650.94), entry(36, 60, 755.93),
            entry(36, 72, 862.92), entry(36, 96, 1115.89), entry(36, 120, 1329.87),
            entry(48, 48, 792.92), entry(48, 60, 920.91), entry(48, 72, 1050.90),
            entry(48, 96, 1380.86), entry(48, 120, 1684.83),
        ],
        paintColors: standardPaintColors
    )

    // MARK: ESD Static Control (Model KD-222)
    static let esdStaticControl = WorkbenchProduct(
        series: "Kennedy",
        topType: .esdStaticControl,
        modelPrefix: "KD-222",
        priceEntries: [
            entry(24, 24, 307.99), entry(24, 30, 325.99), entry(24, 36, 345.99),
            entry(24, 48, 381.99), entry(24, 60, 419.99), entry(24, 72, 455.99),
            entry(24, 96, 529.99), entry(24, 120, 601.99),
            entry(30, 30, 356.99), entry(30, 36, 379.99), entry(30, 48, 423.99),
            entry(30, 60, 466.99), entry(30, 72, 511.99), entry(30, 96, 599.99),
            entry(30, 120, 685.99),
            entry(36, 36, 413.99), entry(36, 48, 463.99), entry(36, 60, 513.99),
            entry(36, 72, 565.99), entry(36, 96, 669.99), entry(36, 120, 769.99),
            entry(48, 48, 535.99), entry(48, 60, 597.99), entry(48, 72, 661.99),
            entry(48, 96, 791.99), entry(48, 120, 917.99),
        ],
        laminateColors: esdLaminateColors,
        paintColors: esdPaintColors
    )

    // MARK: Cleanroom Laminate (Model KCR)
    static let cleanroomLaminate = WorkbenchProduct(
        series: "Kennedy",
        topType: .cleanroomLaminate,
        modelPrefix: "KCR",
        priceEntries: [
            entry(24, 24, 318.97), entry(24, 30, 339.97), entry(24, 36, 359.97),
            entry(24, 48, 399.96), entry(24, 60, 439.96), entry(24, 72, 479.96),
            entry(24, 96, 559.95), entry(24, 120, 638.94),
            entry(30, 30, 374.96), entry(30, 36, 398.96), entry(30, 48, 446.96),
            entry(30, 60, 492.95), entry(30, 72, 540.95), entry(30, 96, 634.94),
            entry(30, 120, 725.93),
            entry(36, 36, 437.96), entry(36, 48, 491.95), entry(36, 60, 545.95),
            entry(36, 72, 601.94), entry(36, 96, 711.93), entry(36, 120, 818.92),
        ],
        laminateColors: standardLaminateColors,
        paintColors: [
            ColorOption(name: "Blue", hexColor: "#1A5276"),
            ColorOption(name: "Gray", hexColor: "#7F8C8D"),
            ColorOption(name: "Black", hexColor: "#1C1C1E"),
            ColorOption(name: "White", hexColor: "#FFFFFF"),
            ColorOption(name: "Dark Blue", hexColor: "#0E2F56"),
        ]
    )

    // MARK: Cleanroom ESD (Model KDCR-222)
    static let cleanroomESD = WorkbenchProduct(
        series: "Kennedy",
        topType: .cleanroomESD,
        modelPrefix: "KDCR-222",
        priceEntries: [
            entry(24, 24, 322.99), entry(24, 30, 349.99), entry(24, 36, 378.99),
            entry(24, 48, 433.99), entry(24, 60, 488.99), entry(24, 72, 545.99),
            entry(24, 96, 655.99), entry(24, 120, 762.99),
            entry(30, 30, 399.99), entry(30, 36, 449.99), entry(30, 48, 520.99),
            entry(30, 60, 595.99), entry(30, 72, 678.99), entry(30, 96, 812.99),
            entry(30, 120, 945.99),
        ],
        laminateColors: esdLaminateColors,
        paintColors: esdPaintColors
    )

    // MARK: Stainless Steel (Model KN)
    static let stainlessSteel = WorkbenchProduct(
        series: "Kennedy",
        topType: .stainlessSteel,
        modelPrefix: "KN",
        priceEntries: [
            entry(24, 24, 385.96), entry(24, 30, 423.96), entry(24, 36, 462.95),
            entry(24, 48, 540.95), entry(24, 60, 615.94), entry(24, 72, 693.93),
            entry(24, 96, 883.91), entry(24, 117, 1029.90),
            entry(30, 30, 475.95), entry(30, 36, 522.95), entry(30, 48, 615.94),
            entry(30, 60, 706.93), entry(30, 72, 800.92), entry(30, 96, 1020.90),
            entry(30, 117, 1198.88),
            entry(36, 36, 582.94), entry(36, 48, 690.93), entry(36, 60, 797.92),
            entry(36, 72, 906.91), entry(36, 96, 1157.88), entry(36, 117, 1366.86),
            entry(45, 48, 841.92), entry(45, 60, 978.90), entry(45, 72, 1118.89),
            entry(45, 96, 1470.85), entry(45, 117, 1745.83),
        ],
        paintColors: standardPaintColors
    )

    // MARK: Painted Steel (Model KM)
    static let paintedSteel = WorkbenchProduct(
        series: "Kennedy",
        topType: .paintedSteel,
        modelPrefix: "KM",
        priceEntries: [
            entry(24, 24, 269.99), entry(24, 30, 290.99), entry(24, 36, 313.99),
            entry(24, 48, 357.99), entry(24, 60, 400.99), entry(24, 72, 445.99),
            entry(24, 96, 531.99),
            entry(30, 30, 318.99), entry(30, 36, 345.99), entry(30, 48, 397.99),
            entry(30, 60, 448.99), entry(30, 72, 500.99), entry(30, 96, 602.99),
            entry(36, 36, 377.99), entry(36, 48, 436.99), entry(36, 60, 495.99),
            entry(36, 72, 556.99), entry(36, 96, 674.99),
            entry(45, 48, 516.99), entry(45, 60, 591.99), entry(45, 72, 667.99),
            entry(45, 96, 816.99),
        ],
        paintColors: standardPaintColors
    )

    // MARK: Disposable Particleboard (Model KPB)
    static let disposableParticleboard = WorkbenchProduct(
        series: "Kennedy",
        topType: .disposableParticleboard,
        modelPrefix: "KPB",
        priceEntries: [
            entry(24, 24, 241.98), entry(24, 30, 255.97), entry(24, 36, 270.97),
            entry(24, 48, 299.97), entry(24, 60, 327.97), entry(24, 72, 357.96),
            entry(24, 96, 446.96), entry(24, 120, 498.95),
            entry(30, 30, 276.97), entry(30, 36, 293.97), entry(30, 48, 327.97),
            entry(30, 60, 358.96), entry(30, 72, 392.96), entry(30, 96, 489.95),
            entry(30, 120, 548.95),
            entry(36, 36, 317.97), entry(36, 48, 354.96), entry(36, 60, 389.96),
            entry(36, 72, 427.96), entry(36, 96, 532.95), entry(36, 120, 599.94),
            entry(48, 48, 409.96), entry(48, 60, 452.95), entry(48, 72, 497.95),
            entry(48, 96, 651.93), entry(48, 120, 738.93),
        ],
        paintColors: standardPaintColors
    )
}
