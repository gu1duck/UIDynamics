//
//  TweetBotAlertViewController.swift
//  UIDynamics
//
//  Created by Jeremy Petter on 2016-10-13.
//  Copyright © 2016 JeremyPetter. All rights reserved.
//

import UIKit

class TweetBotAlertViewController: UIViewController {

    lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ShowAlert", for: .normal)
        button.setTitleColor(.red, for: .normal)
        return button
    }()

    lazy var alertButton: UIButton = {
        let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("DismissAlert", for: .normal)
        button.setTitleColor(.red, for: .normal)
        return button
    }()

    var alertView: UIView?

    lazy var animator: UIDynamicAnimator = {
        return UIDynamicAnimator()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        view.addSubview(button)
        button.center = view.center
        let origin = CGPoint(
            x: view.center.x - button.intrinsicContentSize.width / 2,
            y: view.center.y - button.intrinsicContentSize.width / 2)
        button.frame = CGRect(origin: origin, size: button.intrinsicContentSize)

//        NSLayoutConstraint.activate([
//            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            ])

        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }

    func buttonPressed(sender: UIButton) {

        alertView = createAlertView()

        view.addSubview(alertView!)
        alertView!.center = view.center
        alertView!.alpha = 1.0

        alertView!.addSubview(alertButton)
        alertButton.center = alertView!.center
        let origin = CGPoint(
            x: alertView!.frame.origin.x + alertView!.bounds.size.width / 2 - alertButton.intrinsicContentSize.width / 2,
            y: alertView!.frame.origin.y + alertView!.bounds.size.height / 2 - alertButton.intrinsicContentSize.width / 2
        )
        button.frame = CGRect(origin: origin, size: alertButton.intrinsicContentSize)
//        NSLayoutConstraint.activate([
//            alertButton.centerXAnchor.constraint(equalTo: alertView!.centerXAnchor),
//            alertButton.centerYAnchor.constraint(equalTo: alertView!.centerYAnchor),
//            ])

        alertButton.addTarget(self, action: #selector(alertButtonPressed), for: .touchUpInside)
    }

    func alertButtonPressed(sender: UIButton) {

        let gravityBehaviour = UIGravityBehavior(items: [alertView!])
        animator.addBehavior(gravityBehaviour)

        let dynamicItemBehaviour = UIDynamicItemBehavior(items: [alertView!])
        dynamicItemBehaviour.addAngularVelocity(1, for: alertView!)
        animator.addBehavior(dynamicItemBehaviour)

        UIView.animate(withDuration: 0.5, animations: {
            self.alertView!.alpha = 0
            }) { (success) in
                self.alertView!.removeFromSuperview()
                self.animator.removeAllBehaviors()
                self.alertView = nil
        }



        alertButton.removeTarget(self, action: #selector(alertButtonPressed), for: .touchUpInside)
    }

    func createAlertView() -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        view.frame = CGRect(x: 0, y: 0, width: 300, height: 200)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 20
        return view
    }
}
