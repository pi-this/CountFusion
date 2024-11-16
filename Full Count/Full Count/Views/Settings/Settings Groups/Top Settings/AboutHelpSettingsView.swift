import SwiftUI

struct AboutHelpSettingsView: View {
    var appVersion: String {
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            return "Version \(version)"
        }
        return "Version not found"
    }

    var body: some View {
        Text("App Version: \(appVersion)")
            .foregroundColor(.gray)
    }
}

struct AboutHelpSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AboutHelpSettingsView()
    }
}
#Preview {
    AboutHelpSettingsView()
}
