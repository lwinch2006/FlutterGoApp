import Cocoa
import FlutterMacOS
import Services

@NSApplicationMain
class AppDelegate: FlutterAppDelegate {
    override func applicationDidFinishLaunching(_ notification: Notification) {
        let controller : FlutterViewController = mainFlutterWindow?.contentViewController as! FlutterViewController
        let channel = FlutterMethodChannel.init(name: "github.com/lwinch2006/FlutterGoApp/Services", binaryMessenger: controller.engine.binaryMessenger)

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
    }

  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return true
  }
}
