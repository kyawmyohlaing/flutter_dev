import UIKit
import Flutter
import GoogleMaps
import Firebase
import FirebaseMessaging

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    Firebase.App.configure()
    GMSServices.provideAPIKey("AIzaSyAUOnSYglo2CTc4kP6n0FSroKL5hmayZqM")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: data){

    Message.messaging().apnsToken = deviceToken
    print("Token: \(deviceToken)")
    super.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
  }
}
