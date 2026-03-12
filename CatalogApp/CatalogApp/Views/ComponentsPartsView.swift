import SwiftUI

struct ComponentsPartsView: View {
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

                    Text("Components & Parts")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 8)

                Text("\(ComponentPartType.allCases.count) Options")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal)

                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(ComponentPartType.allCases) { part in
                        SubcategoryCard(
                            title: part.rawValue,
                            subtitle: part.subtitle,
                            systemImage: part.systemImage,
                            imageName: part.imageName
                        )
                    }
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
        }
        .navigationTitle("Components & Parts")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ComponentsPartsView()
    }
}
