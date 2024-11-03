import SwiftUI
import CoreMotion

class StepMeterService: ObservableObject {
    private var pedometer = CMPedometer()
    @AppStorage("stepCount") var stepCount: Int = 0

    func startCountingSteps() {
        if CMPedometer.isStepCountingAvailable() {
            pedometer.startUpdates(from: Date()) { [weak self] data, error in
                guard let self = self, let data = data, error == nil else { return }
                DispatchQueue.main.async {
                    self.stepCount = data.numberOfSteps.intValue
                }
            }
        }
    }

    func stopCountingSteps() {
        pedometer.stopUpdates()
    }
}
