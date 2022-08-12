import UIKit
import BlipChat

class MainViewController: UIViewController {
  private let apiKey: String
  private let blipOptions: BlipOptions
  private let backgroundColor: UIColor

  private var chatWasOpened: Bool = false

  init(apiKey: String, blipOptions: BlipOptions, backgroundColor: UIColor) {
    self.apiKey = apiKey
    self.blipOptions = blipOptions
    self.backgroundColor = backgroundColor

    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    let newView = UIView();
    newView.backgroundColor = backgroundColor

    view.addSubview(newView)

    newView.translatesAutoresizingMaskIntoConstraints = false
    view.addConstraints([
      newView.topAnchor.constraint(equalTo: view.topAnchor),
      newView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      newView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      newView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
    ])
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

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

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)

    // if (chatWasOpened) {
    //   self.presentingViewController?.dismiss(animated: true, completion: nil)
    // } else {
    //   chatWasOpened = true
    // }
  }

  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
  }
}
