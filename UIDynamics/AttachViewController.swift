//
//  AttachViewController.swift
//  UIDynamics
//
//  Created by Jeremy Petter on 2016-10-12.
//  Copyright © 2016 JeremyPetter. All rights reserved.
//

import UIKit

class AttachViewController: UIViewController {

    var animator: UIDynamicAnimator!

    var attachmentBehaviour: UIAttachmentBehavior?

    lazy var redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        return view
    }()

    lazy var blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        animator = UIDynamicAnimator(referenceView: view)

        view.backgroundColor = .white

        view.addSubview(redView)
        view.addSubview(blueView)
        redView.center = view.center
        blueView.center = CGPoint(x: view.center.x + 100, y: view.center.y)

        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(snapView))
        redView.addGestureRecognizer(panGestureRecognizer)

        attachmentBehaviour = UIAttachmentBehavior(item: blueView, attachedToAnchor: redView.center)
        animator.addBehavior(attachmentBehaviour!)

        let gravityBrhaviour = UIGravityBehavior(items: [blueView])
        animator.addBehavior(gravityBrhaviour)

        let collisionBehaviour = UICollisionBehavior(items: [blueView])
        collisionBehaviour.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collisionBehaviour)
    }

    func snapView(sender: UIPanGestureRecognizer) {
        let center = sender.location(in: view)

            redView.center = center
            attachmentBehaviour?.anchorPoint = redView.center
    }

}
