//
//  SnapViewController.swift
//  UIDynamics
//
//  Created by Jeremy Petter on 2016-10-12.
//  Copyright © 2016 JeremyPetter. All rights reserved.
//

import UIKit

class SnapViewController: UIViewController {

    lazy var animator: UIDynamicAnimator = {
        return UIDynamicAnimator()
    }()

    lazy var redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(snapView))
        view.addGestureRecognizer(tapGestureRecognizer)

        view.addSubview(redView)
        redView.center = view.center

    }

    func snapView(sender: UITapGestureRecognizer) {
        let center = sender.location(in: view)

        animator.removeAllBehaviors()

        let snapBehaviour = UISnapBehavior(item: redView, snapTo: center)
        snapBehaviour.damping = 0.0
        animator.addBehavior(snapBehaviour)
        //redView.center = center
    }
}
