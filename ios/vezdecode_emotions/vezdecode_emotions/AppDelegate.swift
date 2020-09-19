import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let rootViewController = PodcastsViewController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        initAppStyle()
        
        return true
    }
    
    private func initAppStyle() {
        UINavigationBar.appearance().run {
            $0.barTintColor = Palette.white
            $0.tintColor = Palette.primary
            $0.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: Font.headerBold]
        }

        UITabBar.appearance().run {
            $0.tintColor = Palette.primary
            $0.isTranslucent = false
        }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = rootViewController
        window!.makeKeyAndVisible()

        if #available(iOS 13.0, *) {
            window?.overrideUserInterfaceStyle = .light
        }
    }
}
