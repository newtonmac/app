import SwiftUI

struct WorkbenchSeriesView: View {
    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

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

                    Text("Workbench Series")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 8)

                Text("\(WorkbenchSeries.allCases.count) Series Available")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal)

                // Series Grid
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(WorkbenchSeries.allCases) { series in
                        NavigationLink(value: series) {
                            SeriesCard(series: series)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
        }
        .navigationTitle("Workbenches")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(for: WorkbenchSeries.self) { series in
            GenericSeriesView(series: series)
        }
    }
}

// MARK: - Series Card

struct SeriesCard: View {
    let series: WorkbenchSeries

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if UIImage(named: series.imageName) != nil {
                Image(series.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.bottom, -8)
            } else {
                Image(systemName: series.systemImage)
                    .font(.system(size: 28))
                    .foregroundStyle(.blue)
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .background(Color.blue.opacity(0.08))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }

            Text(series.rawValue)
                .font(.subheadline)
                .fontWeight(.medium)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .padding(.top, 2)

            Text(series.subtitle)
                .font(.caption2)
                .foregroundStyle(.secondary)
        }
        .padding(10)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: .black.opacity(0.08), radius: 4, y: 2)
    }
}

// MARK: - Coming Soon (placeholder for non-Kennedy series)

struct ComingSoonSeriesView: View {
    let series: WorkbenchSeries

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: series.systemImage)
                .font(.system(size: 60))
                .foregroundStyle(.blue)

            Text(series.rawValue)
                .font(.title2)
                .fontWeight(.bold)

            Text(series.loadCapacity)
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text("Coming Soon")
                .font(.headline)
                .foregroundStyle(.orange)
                .padding(.top, 10)
        }
        .navigationTitle(series.rawValue)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        WorkbenchSeriesView()
    }
}
