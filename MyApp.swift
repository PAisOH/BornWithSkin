import SwiftUI
import TipKit

@main
struct MyApp: App {
    @StateObject var globalVariables = GlobalVariables()
    @Environment(\.colorScheme) var colorScheme
    private let orientationPublisher = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
        .makeConnectable()
        .autoconnect()
    
    let persistence = Persistence.shared
    
    init() {

        if #available(iOS 17.0, *) {
            try? Tips.configure()
        } else {
            // Fallback on earlier versions
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistence.container.viewContext)
                .environmentObject(globalVariables)
                .onAppear {
                    print("----------launch----------")
                    print("isFirstLaunch: " + UserDefaults.standard.bool(forKey: "isFirstLaunch").description)
                    print("----------launch----------")
                    
                    globalVariables.currentDeviceSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    globalVariables.currentPrimaryColor = colorScheme == .light ? .black : .white
                    globalVariables.currentBGColor = colorScheme == .light ? .white : .black
                    globalVariables.isPortrait = UIDevice.current.orientation.isPortrait || UIDevice.current.orientation.isFlat
                    globalVariables.currentMode = colorScheme
                }
                .onReceive(orientationPublisher) { _ in
                    if UIDevice.current.orientation.isFlat {
                        print("???")
                    } else {
                        globalVariables.isPortrait = UIDevice.current.orientation.isPortrait
                        print(">>> CHANGE isPortrait: \(globalVariables.isPortrait)")
                    }
                    print("NOWWWW \(globalVariables.isEnterProductViewAbstract)")      
                }
        }
    }
}
