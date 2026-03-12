import SwiftUI

struct WorkbenchDetailView: View {
    let product: WorkbenchProduct

    @State private var selectedSize: WorkbenchSize?
    @State private var selectedGauge: GaugeOption?
    @State private var selectedLaminateColor: ColorOption?
    @State private var selectedPaintColor: ColorOption?
    @State private var selectedEdgeStyle: FormicaEdgeStyle = .square
    @State private var selectedBlockThickness: ButcherBlockThickness = .one
    @State private var selectedBlockFinish: ButcherBlockFinish = .oiled
    @State private var selectedBlockEdge: ButcherBlockEdgeStyle = .standard
    @State private var selectedResinColor: ResinColor = .black
    @State private var selectedResinThickness: ResinThickness = .one
    @State private var selectedResinEdge: ResinEdgeStyle = .square

    /// Suffix appended to part number (e.g. "-RFE" for resin round front edge)
    private var partNumberSuffix: String {
        if product.topType.isResin && selectedResinEdge == .round {
            return " - RFE"
        }
        if product.topType.isButcherBlock && selectedBlockEdge == .roundFront {
            return " - RFE"
        }
        return ""
    }

    /// Returns the correct product variant based on user selections.
    private var activeProduct: WorkbenchProduct {
        if product.topType.isFormica {
            return seriesData.formicaProduct(for: selectedEdgeStyle)
        } else if product.topType.isButcherBlock {
            return seriesData.butcherBlockProduct(thickness: selectedBlockThickness, finish: selectedBlockFinish)
        } else if product.topType.isResin {
            return seriesData.resinProduct(color: selectedResinColor, thickness: selectedResinThickness)
        }
        return product
    }

    /// Resolves the correct series data helper based on the product's series name.
    private var seriesData: SeriesDataProvider {
        SeriesDataProvider(series: product.series)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Hero
                VStack(spacing: 8) {
                    if UIImage(named: activeProduct.topType.imageName) != nil {
                        Image(activeProduct.topType.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity)
                            .frame(height: 200)
                            .clipped()
                    } else {
                        Image(systemName: "table.furniture")
                            .font(.system(size: 80))
                            .foregroundStyle(.blue)
                            .frame(maxWidth: .infinity)
                            .frame(height: 200)
                            .background(Color.blue.opacity(0.08))
                    }

                    Text("\(product.series) Series")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 16) {
                    // Title
                    Text(activeProduct.topType.gridName)
                        .font(.title2)
                        .fontWeight(.bold)

                    // Part Number display
                    if let selected = selectedSize {
                        HStack(spacing: 6) {
                            Image(systemName: "number")
                                .foregroundStyle(.blue)
                            Text("Part #: \(selected.partNumber(modelPrefix: activeProduct.modelPrefix, gaugeSuffix: selectedGauge?.suffix))\(partNumberSuffix)")
                                .fontWeight(.semibold)
                            Text("(\(selected.displayName))")
                                .foregroundStyle(.secondary)
                        }
                        .font(.subheadline)
                        .padding(10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.blue.opacity(0.08))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }

                    // Specs badges
                    HStack(spacing: 12) {
                        SpecBadge(icon: "scalemass", text: activeProduct.loadCapacity)
                    }

                    Divider()

                    // Description
                    Text(activeProduct.topType.description)
                        .font(.body)
                        .foregroundStyle(.secondary)
                        .lineSpacing(4)

                    Divider()

                    // Edge Style Selector (Formica only)
                    if product.topType.isFormica {
                        EdgeStyleSelectorSection(selectedEdgeStyle: $selectedEdgeStyle)

                        Divider()
                    }

                    // Butcher Block Options
                    if product.topType.isButcherBlock {
                        ButcherBlockSelectorSection(
                            selectedThickness: $selectedBlockThickness,
                            selectedFinish: $selectedBlockFinish,
                            selectedEdge: $selectedBlockEdge
                        )

                        Divider()
                    }

                    // Resin Options
                    if product.topType.isResin {
                        ResinSelectorSection(
                            selectedColor: $selectedResinColor,
                            selectedThickness: $selectedResinThickness,
                            selectedEdge: $selectedResinEdge
                        )

                        Divider()
                    }

                    // Gauge Selector (if available)
                    if !activeProduct.gaugeOptions.isEmpty {
                        GaugeSelectorSection(
                            gaugeOptions: activeProduct.gaugeOptions,
                            selectedGauge: $selectedGauge
                        )

                        Divider()
                    }

                    // Size Selector
                    SizeSelectorSection(
                        sizes: activeProduct.sizes,
                        modelPrefix: activeProduct.modelPrefix,
                        gaugeSuffix: selectedGauge?.suffix,
                        selectedSize: $selectedSize
                    )

                    // Laminate Color (if available)
                    if !activeProduct.laminateColors.isEmpty {
                        Divider()
                        ColorSelectorSection(
                            title: "Laminate Color",
                            colors: activeProduct.laminateColors,
                            selectedColor: $selectedLaminateColor
                        )
                    }

                    // Paint Color
                    if !activeProduct.paintColors.isEmpty {
                        Divider()
                        ColorSelectorSection(
                            title: "Frame Paint Color",
                            colors: activeProduct.paintColors,
                            selectedColor: $selectedPaintColor
                        )
                    }

                    Divider()

                    // Specifications
                    SpecificationsSection(product: activeProduct, selectedSize: selectedSize, selectedGauge: selectedGauge, partNumberSuffix: partNumberSuffix)

                    // Contact
                    Button(action: {}) {
                        Label("Call (619) 478-9400", systemImage: "phone")
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
        .navigationTitle(activeProduct.topType.gridName)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            selectedSize = activeProduct.sizes.first
            selectedGauge = activeProduct.gaugeOptions.first
            selectedLaminateColor = activeProduct.laminateColors.first
            selectedPaintColor = activeProduct.paintColors.first
        }
    }
}

// MARK: - Edge Style Selector (Formica)

struct EdgeStyleSelectorSection: View {
    @Binding var selectedEdgeStyle: FormicaEdgeStyle

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Edge Style")
                .font(.headline)

            HStack(spacing: 10) {
                ForEach(FormicaEdgeStyle.allCases) { style in
                    Button(action: { selectedEdgeStyle = style }) {
                        Text(style.rawValue)
                            .font(.subheadline)
                            .fontWeight(selectedEdgeStyle == style ? .semibold : .regular)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 10)
                            .background(selectedEdgeStyle == style ? Color.blue : Color(.systemGray6))
                            .foregroundStyle(selectedEdgeStyle == style ? .white : .primary)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

// MARK: - Butcher Block Selector

struct ButcherBlockSelectorSection: View {
    @Binding var selectedThickness: ButcherBlockThickness
    @Binding var selectedFinish: ButcherBlockFinish
    @Binding var selectedEdge: ButcherBlockEdgeStyle

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Thickness")
                .font(.headline)

            HStack(spacing: 10) {
                ForEach(ButcherBlockThickness.allCases) { thickness in
                    Button(action: { selectedThickness = thickness }) {
                        Text(thickness.rawValue)
                            .font(.subheadline)
                            .fontWeight(selectedThickness == thickness ? .semibold : .regular)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 10)
                            .background(selectedThickness == thickness ? Color.blue : Color(.systemGray6))
                            .foregroundStyle(selectedThickness == thickness ? .white : .primary)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .buttonStyle(.plain)
                }
            }

            Text("Finish")
                .font(.headline)

            HStack(spacing: 10) {
                ForEach(ButcherBlockFinish.allCases) { finish in
                    Button(action: { selectedFinish = finish }) {
                        Text(finish.rawValue)
                            .font(.subheadline)
                            .fontWeight(selectedFinish == finish ? .semibold : .regular)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 10)
                            .background(selectedFinish == finish ? Color.blue : Color(.systemGray6))
                            .foregroundStyle(selectedFinish == finish ? .white : .primary)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .buttonStyle(.plain)
                }
            }

            Text("Edge Style")
                .font(.headline)

            HStack(spacing: 10) {
                ForEach(ButcherBlockEdgeStyle.allCases) { edge in
                    Button(action: { selectedEdge = edge }) {
                        Text(edge.rawValue)
                            .font(.subheadline)
                            .fontWeight(selectedEdge == edge ? .semibold : .regular)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 10)
                            .background(selectedEdge == edge ? Color.blue : Color(.systemGray6))
                            .foregroundStyle(selectedEdge == edge ? .white : .primary)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

// MARK: - Resin Selector

struct ResinSelectorSection: View {
    @Binding var selectedColor: ResinColor
    @Binding var selectedThickness: ResinThickness
    @Binding var selectedEdge: ResinEdgeStyle

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Color")
                .font(.headline)

            HStack(spacing: 10) {
                ForEach(ResinColor.allCases) { color in
                    Button(action: { selectedColor = color }) {
                        Text(color.rawValue)
                            .font(.subheadline)
                            .fontWeight(selectedColor == color ? .semibold : .regular)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 10)
                            .background(selectedColor == color ? Color.blue : Color(.systemGray6))
                            .foregroundStyle(selectedColor == color ? .white : .primary)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .buttonStyle(.plain)
                }
            }

            Text("Thickness")
                .font(.headline)

            HStack(spacing: 10) {
                ForEach(ResinThickness.allCases) { thickness in
                    Button(action: { selectedThickness = thickness }) {
                        Text(thickness.rawValue)
                            .font(.subheadline)
                            .fontWeight(selectedThickness == thickness ? .semibold : .regular)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 10)
                            .background(selectedThickness == thickness ? Color.blue : Color(.systemGray6))
                            .foregroundStyle(selectedThickness == thickness ? .white : .primary)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .buttonStyle(.plain)
                }
            }

            Text("Edge Style")
                .font(.headline)

            HStack(spacing: 10) {
                ForEach(ResinEdgeStyle.allCases) { edge in
                    Button(action: { selectedEdge = edge }) {
                        Text(edge.rawValue)
                            .font(.subheadline)
                            .fontWeight(selectedEdge == edge ? .semibold : .regular)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 10)
                            .background(selectedEdge == edge ? Color.blue : Color(.systemGray6))
                            .foregroundStyle(selectedEdge == edge ? .white : .primary)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

// MARK: - Size Selector

struct SizeSelectorSection: View {
    let sizes: [WorkbenchSize]
    let modelPrefix: String
    var gaugeSuffix: String? = nil
    @Binding var selectedSize: WorkbenchSize?

    @State private var selectedDepth: Int?

    private var depths: [Int] {
        Array(Set(sizes.map(\.depth))).sorted()
    }

    private var lengths: [Int] {
        guard let depth = selectedDepth else { return [] }
        return sizes.filter { $0.depth == depth }.map(\.length).sorted()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Select Size")
                .font(.headline)

            // Step 1: Depth
            VStack(alignment: .leading, spacing: 6) {
                Text("Depth")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                FlowLayout(spacing: 8) {
                    ForEach(depths, id: \.self) { depth in
                        Button(action: {
                            selectedDepth = depth
                            // Auto-select first length for this depth
                            if let first = sizes.first(where: { $0.depth == depth }) {
                                selectedSize = first
                            }
                        }) {
                            Text("\(depth)\"")
                                .font(.caption)
                                .fontWeight(.semibold)
                                .padding(.horizontal, 14)
                                .padding(.vertical, 8)
                                .background(selectedDepth == depth ? Color.blue : Color(.systemGray6))
                                .foregroundStyle(selectedDepth == depth ? .white : .primary)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                        .buttonStyle(.plain)
                    }
                }
            }

            // Step 2: Length (only shown after depth is selected)
            if selectedDepth != nil {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Length")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)

                    FlowLayout(spacing: 8) {
                        ForEach(lengths, id: \.self) { length in
                            Button(action: {
                                if let depth = selectedDepth {
                                    selectedSize = sizes.first { $0.depth == depth && $0.length == length }
                                }
                            }) {
                                Text("\(length)\"")
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                    .padding(.horizontal, 14)
                                    .padding(.vertical, 8)
                                    .background(selectedSize?.length == length ? Color.blue : Color(.systemGray6))
                                    .foregroundStyle(selectedSize?.length == length ? .white : .primary)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
            }
        }
        .onAppear {
            selectedDepth = sizes.first?.depth
        }
    }
}

// MARK: - Color Selector

struct ColorSelectorSection: View {
    let title: String
    let colors: [ColorOption]
    @Binding var selectedColor: ColorOption?

    private var standardColors: [ColorOption] { colors.filter { !$0.isPremium } }
    private var premiumColors: [ColorOption] { colors.filter { $0.isPremium } }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(title)
                    .font(.headline)
                if let color = selectedColor {
                    Text("– \(color.name)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    if color.isPremium {
                        Text("Premium")
                            .font(.caption2)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(Color.orange)
                            .foregroundStyle(.white)
                            .clipShape(Capsule())
                    }
                }
            }

            // Standard colors
            colorRow(colorOptions: standardColors)

            // Premium colors
            if !premiumColors.isEmpty {
                Text("Premium Colors")
                    .font(.caption)
                    .foregroundStyle(.orange)
                    .fontWeight(.semibold)

                colorRow(colorOptions: premiumColors)

            }
        }
    }

    @ViewBuilder
    private func colorRow(colorOptions: [ColorOption]) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(colorOptions) { color in
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

// MARK: - Gauge Selector

struct GaugeSelectorSection: View {
    let gaugeOptions: [GaugeOption]
    @Binding var selectedGauge: GaugeOption?

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Select Gauge")
                .font(.headline)

            HStack(spacing: 10) {
                ForEach(gaugeOptions) { gauge in
                    Button(action: { selectedGauge = gauge }) {
                        Text(gauge.label)
                            .font(.subheadline)
                            .fontWeight(selectedGauge == gauge ? .semibold : .regular)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 10)
                            .background(selectedGauge == gauge ? Color.blue : Color(.systemGray6))
                            .foregroundStyle(selectedGauge == gauge ? .white : .primary)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
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
    let selectedSize: WorkbenchSize?
    var selectedGauge: GaugeOption? = nil
    var partNumberSuffix: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Specifications")
                .font(.headline)

            SpecRow(label: "Series", value: product.series)
            SpecRow(label: "Top", value: product.topType.topMaterial)
            SpecRow(label: "Edge", value: product.topType.edgeType)
            if let selected = selectedSize {
                SpecRow(label: "Part Number", value: selected.partNumber(modelPrefix: product.modelPrefix, gaugeSuffix: selectedGauge?.suffix) + partNumberSuffix)
                SpecRow(label: "Size", value: selected.displayName)
            }
            if let gauge = selectedGauge {
                SpecRow(label: "Gauge", value: gauge.label)
            }
            SpecRow(label: "Load Capacity", value: product.loadCapacity)
            SpecRow(label: "Core", value: product.coreThickness)
            SpecRow(label: "Steel", value: "16 Gauge Cold Rolled")
            SpecRow(label: "Apron (Top Support)", value: product.apronSize)
            SpecRow(label: "Legs", value: "2\" x 2\" Tube w/ 2\" x 1\" Spreaders")
            SpecRow(label: "Includes", value: "Levelling Glides & Hardware")
            SpecRow(label: "Assembly", value: "1 Bolt Per Leg")
            SpecRow(label: "Available Sizes", value: "\(product.sizes.count) configurations")
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
