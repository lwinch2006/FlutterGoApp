import UIKit
import Flutter
import Services

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel.init(name: "github.com/lwinch2006/FlutterGoApp/Services", binaryMessenger: controller.binaryMessenger)

    channel.setMethodCallHandler({(call: FlutterMethodCall, result: FlutterResult) -> Void in
        switch call.method {
            case "getRandomNumber":
                let mathService = ServicesMathService()
                result(Int(mathService.getRandomNumber()))

            case "getGreeting":
                let greetingService = ServicesGreetingService()
                result(String(greetingService.getGreeting()))

            default:
                result(FlutterMethodNotImplemented)
        }
    });

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
