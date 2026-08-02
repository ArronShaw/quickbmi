import SwiftUI

struct ContentView: View {
    @State private var unitSystem: UnitSystem = .imperial

    @State private var heightFeetText = ""
    @State private var heightInchesText = ""
    @State private var heightCentimetersText = ""
    @State private var weightPoundsText = ""
    @State private var weightKilogramsText = ""

    @State private var result: Double?
    @State private var showError = false

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Units", selection: $unitSystem) {
                        ForEach(UnitSystem.allCases) { system in
                            Text(system.rawValue).tag(system)
                        }
                    }
                    .pickerStyle(.segmented)
                }

                Section("Height") {
                    if unitSystem == .imperial {
                        HStack {
                            TextField("Feet", text: $heightFeetText)
                                .keyboardType(.numberPad)
                            Text("ft")
                                .foregroundStyle(.secondary)
                            TextField("Inches", text: $heightInchesText)
                                .keyboardType(.numberPad)
                            Text("in")
                                .foregroundStyle(.secondary)
                        }
                    } else {
                        HStack {
                            TextField("Centimeters", text: $heightCentimetersText)
                                .keyboardType(.decimalPad)
                            Text("cm")
                                .foregroundStyle(.secondary)
                        }
                    }
                }

                Section("Weight") {
                    if unitSystem == .imperial {
                        HStack {
                            TextField("Pounds", text: $weightPoundsText)
                                .keyboardType(.decimalPad)
                            Text("lb")
                                .foregroundStyle(.secondary)
                        }
                    } else {
                        HStack {
                            TextField("Kilograms", text: $weightKilogramsText)
                                .keyboardType(.decimalPad)
                            Text("kg")
                                .foregroundStyle(.secondary)
                        }
                    }
                }

                Section {
                    Button("Calculate") {
                        calculate()
                    }
                }

                if let result {
                    let category = BMICategory(bmi: result)
                    Section("Result") {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(String(format: "%.1f", result))
                                .font(.system(size: 40, weight: .bold, design: .rounded))
                            Text(category.rawValue)
                                .font(.headline)
                                .foregroundStyle(color(for: category))
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("QuickBMI")
            .alert("Enter a valid height and weight", isPresented: $showError) {
                Button("OK", role: .cancel) {}
            }
        }
    }

    private func calculate() {
        let bmi = BMICalculator.bmi(
            unitSystem: unitSystem,
            heightFeet: Double(heightFeetText) ?? 0,
            heightInches: Double(heightInchesText) ?? 0,
            heightCentimeters: Double(heightCentimetersText) ?? 0,
            weightPounds: Double(weightPoundsText) ?? 0,
            weightKilograms: Double(weightKilogramsText) ?? 0
        )

        guard let bmi, bmi.isFinite, bmi > 0 else {
            result = nil
            showError = true
            return
        }

        result = bmi
    }

    private func color(for category: BMICategory) -> Color {
        switch category {
        case .underweight: return .blue
        case .normal: return .green
        case .overweight: return .orange
        case .obese: return .red
        }
    }
}

#Preview {
    ContentView()
}
