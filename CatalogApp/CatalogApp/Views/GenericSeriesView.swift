import SwiftUI

struct GenericSeriesView: View {
    let series: WorkbenchSeries
    @State private var viewModel: CatalogViewModel

    init(series: WorkbenchSeries) {
        self.series = series
        self._viewModel = State(initialValue: CatalogViewModel(series: series))
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Header
                VStack(alignment: .center, spacing: 8) {
                    Image("BenchProLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 40)

                    Text(series.rawValue)
                        .font(.title3)
                        .fontWeight(.semibold)

                    Text(series.subtitle)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)

                    Text(series.loadCapacity)
                        .font(.caption)
                        .fontWeight(.medium)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 4)
                        .background(Color.blue.opacity(0.1))
                        .clipShape(Capsule())
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 8)

                // Top Count
                Text("\(viewModel.topTypes.count) Top Options")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal)

                // Product Grid
                ProductGridView(products: viewModel.filteredProducts)
            }
            .padding(.bottom)
        }
        .navigationTitle(series.rawValue)
        .navigationBarTitleDisplayMode(.inline)
        .searchable(text: $viewModel.searchText, prompt: "Search workbenches...")
    }
}

#Preview {
    NavigationStack {
        GenericSeriesView(series: .roosevelt)
    }
}
