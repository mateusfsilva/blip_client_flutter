import Flutter
import UIKit
import BlipChat

public class SwiftBlipClientPlugin: NSObject, FlutterPlugin {
  var viewController: UIViewController?
  var navigationController: UINavigationController?

  init(viewController: UIViewController?, navigationController: UINavigationController?) {
    self.viewController = viewController
    self.navigationController = navigationController
  }

  convenience override init() {
    self.init(viewController: nil, navigationController: nil)
  }

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "plugins.blubybs2.com/blip_client", binaryMessenger: registrar.messenger())
    let instance = SwiftBlipClientPlugin()

    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if let params = convertToDictionary(call.arguments as? String) {
      switch call.method {
      case "openBlipChat":
        openBlipChat(withParams: params)

        result(nil)
      case "closeBlipChat":
        closeBlipChat()

        result(nil)
      case "getPlatformVersion":
        result("iOS " + UIDevice.current.systemVersion)

        result(nil)
      default:
        result(nil)
      }
    } else {
      result(false)
    }
  }

  internal func openBlipChat(withParams params: [String: Any]) {
    let apiKey = getAPIKey(fromParams: params)
    let blipOptions = makeBlipOoptions(withParams: params)

    viewController = MainViewController(apiKey: apiKey, blipOptions: blipOptions)
    navigationController = UINavigationController(rootViewController: viewController!)
    navigationController!.modalPresentationStyle = .fullScreen

    if let window = UIApplication.shared.windows.first, let rootViewController = window.rootViewController {
      rootViewController.present(navigationController!, animated: true, completion: nil)
      // window.rootViewController = rootViewController
      // window.makeKeyAndVisible()
    }
  }

  internal func makeBlipOoptions(withParams params: [String: Any]) -> BlipOptions {
    let _options = params["options"] as! [String: Any]
    let _authConfig = _options["authConfig"] as! [String: Any]
    let _account = _options["account"] as? [String: Any]

    var authConfig: AuthConfig
    var account: Account

    if (_authConfig["authType"] as! Int == 0) {
      authConfig = AuthConfig(authType: .Guest)
    } else {
      authConfig = AuthConfig(
        authType: .Dev,
        userIdentity: _authConfig["userIdentity"] as! String,
        userPassword: _authConfig["userPassword"] as! String
      )
    }

    account = Account(fullname: nil, email: nil)

    if let fullName = _account?["fullName"] as? String {
      account.fullName = fullName
    }

    if let address = _account?["address"] as? String {
      account.address = address
    }

    if let city = _account?["city"] as? String {
      account.city = city
    }

    if let email = _account?["email"] as? String {
      account.email = email
    }

    if let phoneNumber = _account?["phoneNumber"] as? String {
      account.phoneNumber = phoneNumber
    }

    if let photoUri = _account?["photoUri"] as? String {
      account.photoUri = URL(string: photoUri)
    }

    if let cellPhoneNumber = _account?["cellPhoneNumber"] as? String {
      account.cellPhoneNumber = cellPhoneNumber
    }

    if let gender = _account?["gender"] as? Int {
      if gender == 0 {
        account.gender = "MALE"
      } else {
        account.gender = "FEMALE"
      }
    }

    if let culture = _account?["culture"] as? String {
      account.culture = culture
    }

    if let extras = _account?["extras"] as? [String: String] {
      account.extras = extras
    }

    if let password = _account?["password"] as? String {
      account.password = password
    }

    if let oldPassword = _account?["oldPassword"] as? String {
      account.oldPassword = oldPassword
    }

    if let isTemporary = _account?["isTemporary"] as? Bool {
      account.isTemporary = isTemporary
    }

    if let allowGuestSender = _account?["allowGuestSender"] as? Bool {
      account.allowGuestSender = allowGuestSender
    }

    if let allowUnknownSender = _account?["allowUnknownSender"] as? Bool {
      account.allowUnknownSender = allowUnknownSender
    }

    if let storeMessageContent = _account?["storeMessageContent"] as? Bool {
      account.storeMessageContent = storeMessageContent
    }

    if let encryptMessageContent = _account?["encryptMessageContent"] as? Bool {
      account.encryptMessageContent = encryptMessageContent
    }

    let blipOptions = BlipOptions(authType: authConfig, account: account)

    if let windowTitle = _options["windowTitle"] as? String {
      blipOptions.windowTitle = windowTitle
    }

    if let customCommonUrl = _options["customCommonUrl"] as? String {
      blipOptions.customCommonUrl = customCommonUrl
    }

    return blipOptions
  }

  internal func getAPIKey(fromParams params: [String: Any]) -> String {
    let apiKey = params["appKey"] as! String

    return apiKey
  }

  internal func closeBlipChat() {
    navigationController?.dismiss(animated: true)
  }

  private func convertToDictionary(_ text: String?) -> [String: Any]? {
    if let text = text, let data = text.data(using: .utf8) {
      do {
        return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
      } catch {
        //
      }
    }

    return nil
  }
}
