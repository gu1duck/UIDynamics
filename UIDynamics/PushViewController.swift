//
//  PushViewController.swift
//  UIDynamics
//
//  Created by Jeremy Petter on 2016-10-12.
//  Copyright © 2016 JeremyPetter. All rights reserved.
//

import UIKit

class PushViewController: UIViewController {

    var animator: UIDynamicAnimator!

    lazy var redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        animator = UIDynamicAnimator(referenceView: view)

        view.backgroundColor = .white

        view.addSubview(redView)
        redView.center = CGPoint(x: 50, y: view.bounds.height - 50)

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTap))
        view.addGestureRecognizer(tapGestureRecognizer)

        let gravityBehaviour = UIGravityBehavior(items: [redView])
        gravityBehaviour.magnitude = 0.1
        animator.addBehavior(gravityBehaviour)

        let collisionBehaviour = UICollisionBehavior(items: [redView])
        collisionBehaviour.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collisionBehaviour)

        let dynamicItemBehaviour = UIDynamicItemBehavior(items: [redView])
        dynamicItemBehaviour.addLinearVelocity(CGPoint(x:50, y:0), for: redView)
        animator.addBehavior(dynamicItemBehaviour)

//        let pushBehaviour = UIPushBehavior(items: [redView], mode: .instantaneous)
//        pushBehaviour.angle = -CGFloat.pi / 2.0
//        pushBehaviour.magnitude = 1.0
//        animator.addBehavior(pushBehaviour)

    }

    func didTap(sender: UITapGestureRecognizer) {
        let pushBehaviour = UIPushBehavior(items: [redView], mode: .instantaneous)
        pushBehaviour.angle = -CGFloat.pi / 2.0
        pushBehaviour.magnitude = 1.0
        animator.addBehavior(pushBehaviour)
    }
}
