import UIKit
import BlipChat

class MainViewController: UIViewController {
  private let apiKey: String
  private let blipOptions: BlipOptions

  init(apiKey: String, blipOptions: BlipOptions) {
    self.apiKey = apiKey
    self.blipOptions = blipOptions

    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidAppear(_ animated: Bool) {
    do {
      try BlipClient.openBlipThread(
        myView: self,
        appKey: apiKey,
        options: blipOptions
      )
    } catch {
      print (error.localizedDescription)
    }
  }
}