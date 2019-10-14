//
//  FCViewController.swift
//  Luncheon
//
//  Created by arshiya  on 7/22/1398 AP.
//  Copyright © 1398 AP Pouyesh system Saba. All rights reserved.
//

import UIKit

class FCViewController: UIViewController {
    
    private let fCRestaurantCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let fcrcv = FCRestaurantsCollectionView(frame: .zero, collectionViewLayout: layout)
        fcrcv.translatesAutoresizingMaskIntoConstraints = false
        fcrcv.semanticContentAttribute = .forceRightToLeft
        fcrcv.backgroundColor = .white
        fcrcv.dataSource = fcrcv.self
        fcrcv.delegate = fcrcv.self
        fcrcv.register(FCRestaurantsCollectionViewCell.self, forCellWithReuseIdentifier: "restaurants")
        fcrcv.showsHorizontalScrollIndicator = false
        return fcrcv

    }()
    
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.addSubview(fCRestaurantCollectionView)
        setupFCRestaurantCollectionView()
        
        // Do any additional setup after loading the view.
    }
    
    
    private func setupFCRestaurantCollectionView() {
        NSLayoutConstraint.activate([
            fCRestaurantCollectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            fCRestaurantCollectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            fCRestaurantCollectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            fCRestaurantCollectionView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.2)
        ])
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
