import SwiftUI

struct KennedySeriesView: View {
    @State private var viewModel = CatalogViewModel()

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

                    Text("Kennedy Series")
                        .font(.title3)
                        .fontWeight(.semibold)
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
        .navigationTitle("Kennedy Series")
        .navigationBarTitleDisplayMode(.inline)
        .searchable(text: $viewModel.searchText, prompt: "Search workbenches...")
    }
}

#Preview {
    NavigationStack {
        KennedySeriesView()
    }
}
