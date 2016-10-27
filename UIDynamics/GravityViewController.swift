//
//  GravityViewController.swift
//  UIDynamics
//
//  Created by Jeremy Petter on 2016-10-12.
//  Copyright © 2016 JeremyPetter. All rights reserved.
//

import UIKit

class GravityViewController: UIViewController {

    var animator: UIDynamicAnimator!

    lazy var redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        view.layer.cornerRadius = 50.0
//        view.layer.masksToBounds = true
        return view
    }()

    lazy var blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        view.layer.cornerRadius = 50.0
//        view.layer.masksToBounds = true
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        animator = UIDynamicAnimator(referenceView: view)

        view.backgroundColor = .white

        view.addSubview(redView)
        redView.center = view.center

        view.addSubview(blueView)
        blueView.center = CGPoint(x: view.center.x - 50, y: view.center.y - 150)

        let gravityBehaviour = UIGravityBehavior(items: [redView, blueView])
        // animator.addBehavior(gravityBehaviour)

        let collisionBehaviour = UICollisionBehavior(items: [redView, blueView])
        collisionBehaviour.translatesReferenceBoundsIntoBoundary = true
        // animator.addBehavior(collisionBehaviour)

        let dynamicItemBehaviour = UIDynamicItemBehavior(items: [blueView])
        dynamicItemBehaviour.addAngularVelocity(50, for: blueView)
        // animator.addBehavior(dynamicItemBehaviour)

        let jeremyBehaviour = UIDynamicBehavior()
        jeremyBehaviour.addChildBehavior(gravityBehaviour)
        jeremyBehaviour.addChildBehavior(collisionBehaviour)
        jeremyBehaviour.addChildBehavior(dynamicItemBehaviour)

        animator.addBehavior(jeremyBehaviour)

    }
}
