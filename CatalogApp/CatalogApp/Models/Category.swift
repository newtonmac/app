import Foundation

enum Category: String, CaseIterable, Identifiable, Hashable, Codable {
    case workbenches = "Workbenches"
    case chairs = "Chairs"
    case cabinets = "Cabinets"
    case accessories = "Accessories"
    case cleanroom = "Cleanroom Products"

    var id: String { rawValue }

    var systemImage: String {
        switch self {
        case .workbenches: return "table.furniture"
        case .chairs: return "chair"
        case .cabinets: return "cabinet"
        case .accessories: return "wrench.and.screwdriver"
        case .cleanroom: return "humidity"
        }
    }
}
