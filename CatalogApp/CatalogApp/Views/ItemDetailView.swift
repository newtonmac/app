import SwiftUI

struct WorkbenchDetailView: View {
    let product: WorkbenchProduct

    @State private var selectedSize: PriceEntry?
    @State private var selectedLaminateColor: ColorOption?
    @State private var selectedPaintColor: ColorOption?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Hero
                VStack(spacing: 8) {
                    Image(systemName: "table.furniture")
                        .font(.system(size: 80))
                        .foregroundStyle(.blue)
                        .frame(maxWidth: .infinity)
                        .frame(height: 200)
                        .background(Color.blue.opacity(0.08))

                    Text("Kennedy Series")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 16) {
                    // Title & Price
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(product.topType.rawValue)
                                .font(.title2)
                                .fontWeight(.bold)

                            Text("Model: \(product.modelPrefix)")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }

                        Spacer()

                        VStack(alignment: .trailing, spacing: 2) {
                            if let selected = selectedSize {
                                Text(selected.formattedPrice)
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.blue)
                            } else {
                                Text("From \(product.formattedStartingPrice)")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.blue)
                            }
                        }
                    }

                    // Specs badges
                    HStack(spacing: 12) {
                        SpecBadge(icon: "scalemass", text: product.loadCapacity)
                        SpecBadge(icon: "shippingbox", text: product.shipsIn)
                    }

                    Divider()

                    // Description
                    Text(product.topType.description)
                        .font(.body)
                        .foregroundStyle(.secondary)
                        .lineSpacing(4)

                    Divider()

                    // Size Selector
                    SizeSelectorSection(
                        priceEntries: product.priceEntries,
                        selectedSize: $selectedSize
                    )

                    // Laminate Color (if available)
                    if !product.laminateColors.isEmpty {
                        Divider()
                        ColorSelectorSection(
                            title: "Laminate Color",
                            colors: product.laminateColors,
                            selectedColor: $selectedLaminateColor
                        )
                    }

                    // Paint Color
                    if !product.paintColors.isEmpty {
                        Divider()
                        ColorSelectorSection(
                            title: "Frame Paint Color",
                            colors: product.paintColors,
                            selectedColor: $selectedPaintColor
                        )
                    }

                    Divider()

                    // Specifications
                    SpecificationsSection(product: product)

                    // Contact / Quote button
                    Button(action: {}) {
                        Label("Request a Quote", systemImage: "envelope")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.blue)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                    }

                    Button(action: {}) {
                        Label("Call (888) 700-9888", systemImage: "phone")
                            .font(.subheadline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(.systemGray6))
                            .foregroundStyle(.primary)
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle(product.topType.shortName)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            selectedSize = product.priceEntries.first
            selectedLaminateColor = product.laminateColors.first
            selectedPaintColor = product.paintColors.first
        }
    }
}

// MARK: - Size Selector

struct SizeSelectorSection: View {
    let priceEntries: [PriceEntry]
    @Binding var selectedSize: PriceEntry?

    // Group by depth
    private var depths: [Int] {
        Array(Set(priceEntries.map(\.size.depth))).sorted()
    }

    private func entries(forDepth depth: Int) -> [PriceEntry] {
        priceEntries.filter { $0.size.depth == depth }.sorted { $0.size.length < $1.size.length }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Select Size")
                .font(.headline)

            ForEach(depths, id: \.self) { depth in
                VStack(alignment: .leading, spacing: 6) {
                    Text("\(depth)\" Deep")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundStyle(.secondary)

                    FlowLayout(spacing: 8) {
                        ForEach(entries(forDepth: depth)) { entry in
                            Button(action: { selectedSize = entry }) {
                                VStack(spacing: 2) {
                                    Text("\(entry.size.length)\"L")
                                        .font(.caption)
                                        .fontWeight(.medium)
                                    Text(entry.formattedPrice)
                                        .font(.caption2)
                                }
                                .padding(.horizontal, 10)
                                .padding(.vertical, 6)
                                .background(selectedSize == entry ? Color.blue : Color(.systemGray6))
                                .foregroundStyle(selectedSize == entry ? .white : .primary)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
            }
        }
    }
}

// MARK: - Color Selector

struct ColorSelectorSection: View {
    let title: String
    let colors: [ColorOption]
    @Binding var selectedColor: ColorOption?

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(title)
                    .font(.headline)
                if let color = selectedColor {
                    Text("– \(color.name)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }

            HStack(spacing: 10) {
                ForEach(colors) { color in
                    Button(action: { selectedColor = color }) {
                        Circle()
                            .fill(Color(hex: color.hexColor))
                            .frame(width: 32, height: 32)
                            .overlay(
                                Circle()
                                    .strokeBorder(
                                        selectedColor == color ? Color.blue : Color.gray.opacity(0.3),
                                        lineWidth: selectedColor == color ? 3 : 1
                                    )
                            )
                            .overlay(
                                // White swatch needs a visible border
                                Circle()
                                    .strokeBorder(Color.gray.opacity(0.2), lineWidth: 0.5)
                            )
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

// MARK: - Specifications

struct SpecificationsSection: View {
    let product: WorkbenchProduct

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Specifications")
                .font(.headline)

            SpecRow(label: "Series", value: product.series)
            SpecRow(label: "Model", value: product.modelPrefix)
            SpecRow(label: "Load Capacity", value: product.loadCapacity)
            SpecRow(label: "Core", value: product.coreThickness)
            SpecRow(label: "Apron", value: product.apronSize)
            SpecRow(label: "Ships In", value: product.shipsIn)
            SpecRow(label: "Available Sizes", value: "\(product.priceEntries.count) configurations")
        }
    }
}

struct SpecRow: View {
    let label: String
    let value: String

    var body: some View {
        HStack {
            Text(label)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            Spacer()
            Text(value)
                .font(.subheadline)
                .fontWeight(.medium)
        }
    }
}

struct SpecBadge: View {
    let icon: String
    let text: String

    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: icon)
            Text(text)
        }
        .font(.caption)
        .padding(.horizontal, 10)
        .padding(.vertical, 6)
        .background(Color(.systemGray6))
        .clipShape(Capsule())
    }
}

// MARK: - Flow Layout

struct FlowLayout: Layout {
    var spacing: CGFloat = 8

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let result = arrange(proposal: proposal, subviews: subviews)
        return result.size
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let result = arrange(proposal: proposal, subviews: subviews)
        for (index, position) in result.positions.enumerated() {
            subviews[index].place(at: CGPoint(x: bounds.minX + position.x, y: bounds.minY + position.y), proposal: .unspecified)
        }
    }

    private func arrange(proposal: ProposedViewSize, subviews: Subviews) -> (positions: [CGPoint], size: CGSize) {
        let maxWidth = proposal.width ?? .infinity
        var positions: [CGPoint] = []
        var x: CGFloat = 0
        var y: CGFloat = 0
        var rowHeight: CGFloat = 0
        var maxX: CGFloat = 0

        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
            if x + size.width > maxWidth, x > 0 {
                x = 0
                y += rowHeight + spacing
                rowHeight = 0
            }
            positions.append(CGPoint(x: x, y: y))
            rowHeight = max(rowHeight, size.height)
            x += size.width + spacing
            maxX = max(maxX, x)
        }

        return (positions, CGSize(width: maxX, height: y + rowHeight))
    }
}

// MARK: - Color Extension

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet(charactersIn: "#"))
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        let r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let b = Double(rgbValue & 0x0000FF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}

#Preview {
    NavigationStack {
        WorkbenchDetailView(product: KennedyData.formicaRoundEdge)
    }
}
