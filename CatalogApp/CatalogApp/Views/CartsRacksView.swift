import SwiftUI

struct CartsRacksView: View {
    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .center, spacing: 8) {
                    Image("BenchProLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 40)

                    Text("Carts & Racks")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 8)

                Text("\(CartRackType.allCases.count) Options")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal)

                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(CartRackType.allCases) { cart in
                        SubcategoryCard(
                            title: cart.rawValue,
                            subtitle: cart.subtitle,
                            systemImage: cart.systemImage,
                            imageName: cart.imageName
                        )
                    }
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
        }
        .navigationTitle("Carts & Racks")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        CartsRacksView()
    }
}
