import Foundation

// MARK: - Product Category

enum Category: String, CaseIterable, Identifiable, Hashable, Codable {
    case workbenches = "Workbenches"
    case chairs = "Chairs"
    case cabinets = "Cabinets"
    case cleanroom = "Cleanroom Products"

    var id: String { rawValue }

    var systemImage: String {
        switch self {
        case .workbenches: return "table.furniture"
        case .chairs: return "chair"
        case .cabinets: return "cabinet"
        case .cleanroom: return "humidity"
        }
    }

    var imageName: String {
        switch self {
        case .workbenches: return "cat_workbenches"
        case .chairs: return "cat_chairs"
        case .cabinets: return "cat_cabinets"
        case .cleanroom: return "cat_cleanroom"
        }
    }
}

// MARK: - Workbench Series

enum WorkbenchSeries: String, CaseIterable, Identifiable, Hashable {
    case kennedy = "Kennedy Series"
    case roosevelt = "Roosevelt Series"
    case harding = "Harding Series"
    case cleveland = "Cleveland Series"
    case dewey = "Dewey Series"
    case pedestal = "Pedestal Leg Workbenches"

    var id: String { rawValue }

    var subtitle: String {
        switch self {
        case .kennedy: return "Our Best Seller"
        case .roosevelt: return "Most Affordable"
        case .harding: return "Super Heavy Duty"
        case .cleveland: return "Adjustable Height"
        case .dewey: return "Recessed Legs"
        case .pedestal: return "Custom Combinations"
        }
    }

    var systemImage: String {
        switch self {
        case .kennedy: return "star.fill"
        case .roosevelt: return "dollarsign.circle"
        case .harding: return "hammer.fill"
        case .cleveland: return "arrow.up.and.down"
        case .dewey: return "square.dashed"
        case .pedestal: return "rectangle.split.2x1"
        }
    }

    var imageName: String {
        switch self {
        case .kennedy: return "series_kennedy"
        case .roosevelt: return "series_roosevelt"
        case .harding: return "series_harding"
        case .cleveland: return "series_cleveland"
        case .dewey: return "series_dewey"
        case .pedestal: return "series_pedestal"
        }
    }

    var loadCapacity: String {
        switch self {
        case .kennedy: return "Tested to 6,600 lbs"
        case .roosevelt: return "Tested to 1,500 lbs"
        case .harding: return "Tested to 20,000 lbs"
        case .cleveland: return "Tested to 800 lbs"
        case .dewey: return "Tested to 5,000 lbs"
        case .pedestal: return "Varies by configuration"
        }
    }
}

// MARK: - Chair Type

enum ChairType: String, CaseIterable, Identifiable, Hashable {
    case urethane = "Urethane Cushions"
    case fabricESD = "Fabric ESD Cushions"
    case fabric = "Fabric Cushions"
    case vinylESD = "Vinyl ESD Cushions"
    case vinyl = "Vinyl Cushions"
    case cleanroom = "Cleanroom Cushions"
    case cleanroomESD = "Cleanroom ESD Cushions"
    case stools = "Stools"

    var id: String { rawValue }

    var systemImage: String {
        switch self {
        case .urethane: return "chair"
        case .fabricESD: return "bolt.shield"
        case .fabric: return "chair.lounge"
        case .vinylESD: return "bolt.shield.fill"
        case .vinyl: return "chair.fill"
        case .cleanroom: return "humidity"
        case .cleanroomESD: return "bolt.trianglebadge.exclamationmark"
        case .stools: return "figure.stand"
        }
    }

    var imageName: String {
        "chair_\(id.lowercased().replacingOccurrences(of: " ", with: "_"))"
    }

    var subtitle: String {
        switch self {
        case .urethane: return "Puncture & tear resistant"
        case .fabricESD: return "ESD safe, 10-year warranty"
        case .fabric: return "Variety of cushion colors"
        case .vinylESD: return "Antimicrobial ESD"
        case .vinyl: return "Antimicrobial vinyl"
        case .cleanroom: return "Memory foam, 3M filters"
        case .cleanroomESD: return "ESD cleanroom rated"
        case .stools: return "Desk & tall heights"
        }
    }
}

// MARK: - Cabinet Type

enum CabinetType: String, CaseIterable, Identifiable, Hashable {
    case drawer = "Drawer Cabinets"
    case overhead = "Overhead Storage Cabinets"
    case underDrawer = "Under Drawer Cabinets"
    case electronics = "Electronics Storage"
    case industrialPainted = "Industrial Cabinets (Painted)"
    case industrialStainless = "Industrial Cabinets (Stainless)"
    case medicalCleanroom = "Medical & Cleanroom Cabinets"

    var id: String { rawValue }

    var systemImage: String {
        switch self {
        case .drawer: return "archivebox"
        case .overhead: return "rectangle.split.3x1"
        case .underDrawer: return "tray.2"
        case .electronics: return "lock.shield"
        case .industrialPainted: return "cabinet"
        case .industrialStainless: return "cabinet.fill"
        case .medicalCleanroom: return "cross.case"
        }
    }

    var imageName: String {
        "cabinet_\(id.lowercased().replacingOccurrences(of: " ", with: "_"))"
    }

    var subtitle: String {
        switch self {
        case .drawer: return "100+ designs"
        case .overhead: return "Steel with drawer options"
        case .underDrawer: return "Fits beneath workbenches"
        case .electronics: return "Perforated security"
        case .industrialPainted: return "Powder-coated finish"
        case .industrialStainless: return "Premium stainless steel"
        case .medicalCleanroom: return "Medical/cleanroom rated"
        }
    }
}

// MARK: - Cleanroom Product Type

enum CleanroomProductType: String, CaseIterable, Identifiable, Hashable {
    case workbenches = "Workbenches & Tables"
    case storageCabinets = "Storage Cabinets"
    case laminarFlow = "Laminar Flow Hood"
    case medicalCabinet = "Medical Cabinet"
    case doorCabinet = "Stainless Door Cabinet"
    case sinkUnit = "Industrial Sink Unit"
    case gowningUnits = "Gowning Units"
    case gowningBenches = "Gowning Benches"
    case passThru = "Pass-Thru Cabinets"

    var id: String { rawValue }

    var systemImage: String {
        switch self {
        case .workbenches: return "table.furniture"
        case .storageCabinets: return "cabinet.fill"
        case .laminarFlow: return "wind"
        case .medicalCabinet: return "cross.case"
        case .doorCabinet: return "door.left.hand.closed"
        case .sinkUnit: return "drop"
        case .gowningUnits: return "tshirt"
        case .gowningBenches: return "chair"
        case .passThru: return "arrow.left.arrow.right"
        }
    }

    var imageName: String {
        "cleanroom_\(id.lowercased().replacingOccurrences(of: " ", with: "_"))"
    }

    var subtitle: String {
        switch self {
        case .workbenches: return "304 Steel, #4 Finish"
        case .storageCabinets: return "Stainless steel"
        case .laminarFlow: return "Fan & filter unit"
        case .medicalCabinet: return "Medical/cleanroom"
        case .doorCabinet: return "Heavy-duty stainless"
        case .sinkUnit: return "Hot air drying"
        case .gowningUnits: return "Stainless steel storage"
        case .gowningBenches: return "Gowning area seating"
        case .passThru: return "Material transfer"
        }
    }
}
