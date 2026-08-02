import Foundation

enum UnitSystem: String, CaseIterable, Identifiable {
    case imperial = "Imperial"
    case metric = "Metric"

    var id: String { rawValue }
}

enum BMICategory: String {
    case underweight = "Underweight"
    case normal = "Normal"
    case overweight = "Overweight"
    case obese = "Obese"

    init(bmi: Double) {
        switch bmi {
        case ..<18.5: self = .underweight
        case 18.5..<25: self = .normal
        case 25..<30: self = .overweight
        default: self = .obese
        }
    }
}

enum BMICalculator {
    /// - Parameters:
    ///   - heightFeet/heightInches: used when unitSystem is .imperial
    ///   - heightCentimeters: used when unitSystem is .metric
    ///   - weightPounds: used when unitSystem is .imperial
    ///   - weightKilograms: used when unitSystem is .metric
    static func bmi(
        unitSystem: UnitSystem,
        heightFeet: Double,
        heightInches: Double,
        heightCentimeters: Double,
        weightPounds: Double,
        weightKilograms: Double
    ) -> Double? {
        switch unitSystem {
        case .imperial:
            let totalInches = heightFeet * 12 + heightInches
            guard totalInches > 0, weightPounds > 0 else { return nil }
            return (weightPounds / (totalInches * totalInches)) * 703
        case .metric:
            let heightMeters = heightCentimeters / 100
            guard heightMeters > 0, weightKilograms > 0 else { return nil }
            return weightKilograms / (heightMeters * heightMeters)
        }
    }
}
