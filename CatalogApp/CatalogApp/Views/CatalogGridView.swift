import SwiftUI

struct ProductGridView: View {
    let products: [WorkbenchProduct]

    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            if products.isEmpty {
                ContentUnavailableView(
                    "No Workbenches Found",
                    systemImage: "magnifyingglass",
                    description: Text("Try adjusting your search or filters.")
                )
                .padding(.top, 40)
            } else {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(products) { product in
                        NavigationLink(value: product.id) {
                            ProductCard(product: product)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal)
                .navigationDestination(for: UUID.self) { id in
                    if let product = products.first(where: { $0.id == id }) {
                        WorkbenchDetailView(product: product)
                    }
                }
            }
        }
    }
}

struct ProductCard: View {
    let product: WorkbenchProduct

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Product image
            if UIImage(named: product.topType.imageName) != nil {
                Image(product.topType.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            } else {
                Image(systemName: "table.furniture")
                    .font(.system(size: 28))
                    .foregroundStyle(.blue)
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(Color.blue.opacity(0.08))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }

            Text("\(product.series) \(product.topType.shortName)")
                .font(.subheadline)
                .fontWeight(.medium)
                .lineLimit(2)
                .multilineTextAlignment(.leading)

            Text("\(product.sizes.count) sizes available")
                .font(.caption2)
                .foregroundStyle(.secondary)

}
        .padding(10)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: .black.opacity(0.08), radius: 4, y: 2)
    }
}

#Preview {
    NavigationStack {
        ScrollView {
            ProductGridView(products: KennedyData.allProducts)
        }
    }
}
