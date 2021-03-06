// Copyright © 2018 Conicoin LLC. All rights reserved.
// Created by Artur Guseinov

import UIKit
import Lottie

class PopupViewController: UIViewController {
  @IBOutlet var imageView: UIImageView!
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var descriptionLabel: UILabel!
  @IBOutlet var skipButton: UIButton!
  @IBOutlet var confirmButton: UIButton!
  
  private var animationView: LOTAnimationView?

  var output: PopupViewOutput!


  // MARK: Life cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.hidesBackButton = true
    output.viewIsReady()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    animationView?.play()
  }
  
  // MARK: Privates
  
  private func insertResource(_ resource: PopupResource) {
    switch resource {
    case .image(let name):
      imageView.image = UIImage(named: name)
    case .animation(let name):
      animationView = {
        let animationView = LOTAnimationView(name: name)
        animationView.frame = imageView.frame
        animationView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        animationView.contentMode = .scaleAspectFit
        view.addSubview(animationView)
        return animationView
      }()
    }
  }
  
  // MARK: Actions
  
  @IBAction func confirmPressed(_ sender: UIButton) {
    output.didConfirmPressed()
  }
  
  @IBAction func skipPressed(_ sender: UIButton) {
    output.didSkipPressed()
  }

}


// MARK: - PopupViewInput

extension PopupViewController: PopupViewInput {
    
  func setupInitialState() {

  }
  
  func setState(_ state: PopupStateProtocol) {
    titleLabel.text = state.title
    descriptionLabel.text = state.description
    skipButton.setTitle(state.skipTitle, for: .normal)
    confirmButton.setTitle(state.confirmTitle, for: .normal)
    skipButton.isHidden = !state.isSkipActive
    insertResource(state.resource)
  }

}
