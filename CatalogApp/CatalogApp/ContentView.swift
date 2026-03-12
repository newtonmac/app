import SwiftUI

struct ContentView: View {
    @State private var viewModel = CatalogViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Header
                    VStack(alignment: .center, spacing: 8) {
                        Image("BenchProLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 40)

                        Text("Kennedy Series")
                            .font(.title3)
                            .fontWeight(.semibold)

                        Text("Our best-selling workbench • Tested to 6,600 lbs")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 8)

                    // Top Type Filter
                    TopTypeFilterView(
                        topTypes: viewModel.topTypes,
                        selectedTopType: viewModel.selectedTopType,
                        onSelect: { viewModel.selectTopType($0) }
                    )

                    // Product Grid
                    ProductGridView(products: viewModel.filteredProducts)
                }
                .padding(.bottom)
            }
            .searchable(text: $viewModel.searchText, prompt: "Search workbenches...")
        }
    }
}

// MARK: - Top Type Filter

struct TopTypeFilterView: View {
    let topTypes: [TopType]
    let selectedTopType: TopType?
    let onSelect: (TopType) -> Void

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(topTypes) { topType in
                    Button(action: { onSelect(topType) }) {
                        Text(topType.shortName)
                            .font(.caption)
                            .fontWeight(selectedTopType == topType ? .semibold : .regular)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(selectedTopType == topType ? Color.blue : Color(.systemGray6))
                            .foregroundStyle(selectedTopType == topType ? .white : .primary)
                            .clipShape(Capsule())
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    ContentView()
}
