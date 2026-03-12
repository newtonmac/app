import SwiftUI

struct LandingPageView: View {
    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

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

                        Text("Product Catalog")
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 8)

                    // Category Grid
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(Category.allCases) { category in
                            NavigationLink(value: category) {
                                CategoryCard(category: category)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom)
            }
            .navigationDestination(for: Category.self) { category in
                switch category {
                case .workbenches:
                    WorkbenchSeriesView()
                case .chairs:
                    ChairsView()
                case .cabinets:
                    CabinetsView()
                case .cleanroom:
                    CleanroomProductsView()
                }
            }
        }
    }
}

// MARK: - Category Card

struct CategoryCard: View {
    let category: Category

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if UIImage(named: category.imageName) != nil {
                Image(category.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            } else {
                Image(systemName: category.systemImage)
                    .font(.system(size: 36))
                    .foregroundStyle(.blue)
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .background(Color.blue.opacity(0.08))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }

            Text(category.rawValue)
                .font(.subheadline)
                .fontWeight(.semibold)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
        }
        .padding(10)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: .black.opacity(0.08), radius: 4, y: 2)
    }
}

#Preview {
    LandingPageView()
}
