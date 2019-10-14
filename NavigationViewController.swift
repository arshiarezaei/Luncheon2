//
//  NavigationViewController.swift
//  Luncheon
//
//  Created by arshiya  on 7/22/1398 AP.
//  Copyright © 1398 AP Pouyesh system Saba. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.tintColor = .luncheonLogoTextColor
        navigationBar.topItem?.titleView =  UIImageView(image: UIImage(named: "logo"))
        navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "food tray"), style: .plain, target: nil, action: nil)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
