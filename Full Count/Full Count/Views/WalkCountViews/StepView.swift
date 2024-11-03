import SwiftUI

struct StepView: View {
    @StateObject private var pedometerManager = StepMeterService()
    @AppStorage("stepCount") var stepCount: Int = 0

        var body: some View {
            VStack {
                Button("Restart Step Count") {
                    stepCount = 0
                }
                .foregroundColor(.red)
                Text("Step Count:")
                    .font(.largeTitle)
                    .padding()
                Text("\(stepCount)")
                    .font(.system(size: 100))
                    .padding()
            }
            .onAppear {
                pedometerManager.startCountingSteps()
            }
            .onDisappear {
                pedometerManager.stopCountingSteps()
            }
        }
}

#Preview {
    StepView()
        .environmentObject(StepMeterService())
}
