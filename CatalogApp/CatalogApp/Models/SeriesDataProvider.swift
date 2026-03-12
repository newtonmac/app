import Foundation

/// Routes variant lookups (Formica edge, Butcher Block thickness/finish, Resin color/thickness)
/// to the correct series data struct based on the product's series name.
struct SeriesDataProvider {
    let series: String

    func formicaProduct(for edgeStyle: FormicaEdgeStyle) -> WorkbenchProduct {
        switch series {
        case "Kennedy": return KennedyData.formicaProduct(for: edgeStyle)
        case "Roosevelt": return RooseveltData.formicaProduct(for: edgeStyle)
        case "Harding": return HardingData.formicaProduct(for: edgeStyle)
        case "Cleveland": return ClevelandData.formicaProduct(for: edgeStyle)
        case "Dewey": return DeweyData.formicaProduct(for: edgeStyle)
        case "Pedestal": return PedestalData.formicaProduct(for: edgeStyle)
        default: return KennedyData.formicaProduct(for: edgeStyle)
        }
    }

    func butcherBlockProduct(thickness: ButcherBlockThickness, finish: ButcherBlockFinish) -> WorkbenchProduct {
        switch series {
        case "Kennedy": return KennedyData.butcherBlockProduct(thickness: thickness, finish: finish)
        case "Roosevelt": return RooseveltData.butcherBlockProduct(thickness: thickness, finish: finish)
        case "Harding": return HardingData.butcherBlockProduct(thickness: thickness, finish: finish)
        case "Cleveland": return ClevelandData.butcherBlockProduct(thickness: thickness, finish: finish)
        case "Dewey": return DeweyData.butcherBlockProduct(thickness: thickness, finish: finish)
        case "Pedestal": return PedestalData.butcherBlockProduct(thickness: thickness, finish: finish)
        default: return KennedyData.butcherBlockProduct(thickness: thickness, finish: finish)
        }
    }

    func resinProduct(color: ResinColor, thickness: ResinThickness) -> WorkbenchProduct {
        switch series {
        case "Kennedy": return KennedyData.resinProduct(color: color, thickness: thickness)
        case "Roosevelt": return RooseveltData.resinProduct(color: color, thickness: thickness)
        case "Harding": return HardingData.resinProduct(color: color, thickness: thickness)
        case "Cleveland": return ClevelandData.resinProduct(color: color, thickness: thickness)
        case "Dewey": return DeweyData.resinProduct(color: color, thickness: thickness)
        case "Pedestal": return PedestalData.resinProduct(color: color, thickness: thickness)
        default: return KennedyData.resinProduct(color: color, thickness: thickness)
        }
    }

    static func allProducts(for series: WorkbenchSeries) -> [WorkbenchProduct] {
        switch series {
        case .kennedy: return KennedyData.allProducts
        case .roosevelt: return RooseveltData.allProducts
        case .harding: return HardingData.allProducts
        case .cleveland: return ClevelandData.allProducts
        case .dewey: return DeweyData.allProducts
        case .pedestal: return PedestalData.allProducts
        }
    }
}
