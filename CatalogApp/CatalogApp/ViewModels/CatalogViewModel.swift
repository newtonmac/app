import Foundation

@Observable
class CatalogViewModel {
    var kennedyProducts: [WorkbenchProduct] = KennedyData.allProducts
    var selectedTopType: TopType?
    var searchText: String = ""

    var filteredProducts: [WorkbenchProduct] {
        var result = kennedyProducts

        if let topType = selectedTopType {
            result = result.filter { $0.topType == topType }
        }

        if !searchText.isEmpty {
            result = result.filter {
                $0.displayName.localizedCaseInsensitiveContains(searchText) ||
                $0.topType.rawValue.localizedCaseInsensitiveContains(searchText) ||
                $0.topType.description.localizedCaseInsensitiveContains(searchText)
            }
        }

        return result
    }

    /// Only the top types that appear in allProducts (consolidated variants)
    var topTypes: [TopType] {
        kennedyProducts.map(\.topType)
    }

    func selectTopType(_ topType: TopType?) {
        if selectedTopType == topType {
            selectedTopType = nil
        } else {
            selectedTopType = topType
        }
    }
}
