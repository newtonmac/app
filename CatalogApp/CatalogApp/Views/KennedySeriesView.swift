import SwiftUI

struct KennedySeriesView: View {
    var body: some View {
        GenericSeriesView(series: .kennedy)
    }
}

#Preview {
    NavigationStack {
        KennedySeriesView()
    }
}
