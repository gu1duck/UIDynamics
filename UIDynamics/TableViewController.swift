//
//  TableViewController.swift
//  UIDynamics
//
//  Created by Jeremy Petter on 2016-10-12.
//  Copyright © 2016 JeremyPetter. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    let options = [
        "Gravity and Collision",
        "Snap",
        "Attach",
        "Push",
        "TweetBot Alert",
    ]

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let string = options[indexPath.row]
        cell.textLabel?.text = string

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let gravityViewController = GravityViewController()
            navigationController?.pushViewController(gravityViewController, animated: true)
        case 1:
            let snapViewController = SnapViewController()
            navigationController?.pushViewController(snapViewController, animated: true)
        case 2:
            let attachViewController = AttachViewController()
            navigationController?.pushViewController(attachViewController, animated: true)
        case 3:
            let pushViewController = PushViewController()
            navigationController?.pushViewController(pushViewController, animated: true)
        case 4:
            let tweetBotAlertViewController = TweetBotAlertViewController()
            navigationController?.pushViewController(tweetBotAlertViewController, animated: true)
        default:
            break
        }
    }
}
