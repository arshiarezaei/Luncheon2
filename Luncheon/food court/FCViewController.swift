//
//  FCViewController.swift
//  Luncheon
//
//  Created by arshiya  on 7/22/1398 AP.
//  Copyright © 1398 AP Pouyesh system Saba. All rights reserved.
//

import UIKit

class FCViewController: UIViewController {
    
    private let fCRestaurantCollectionView:UICollectionView! = {
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
        fcrcv.showsHorizontalScrollIndicator = false
        return fcrcv

    }()
    
    
    let fCRMenuTitleCollectionView :FCRMenuTitleCollectionView! = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let fcrmtcv = FCRMenuTitleCollectionView(frame: .zero, collectionViewLayout: layout)
        fcrmtcv.translatesAutoresizingMaskIntoConstraints = false
        fcrmtcv.semanticContentAttribute = .forceRightToLeft
        fcrmtcv.backgroundColor = .white
        fcrmtcv.dataSource = fcrmtcv.self
        fcrmtcv.delegate = fcrmtcv.self
        fcrmtcv.register(FCRMenuTitleCollectionViewCell.self, forCellWithReuseIdentifier: "menuTitle")
        fcrmtcv.showsHorizontalScrollIndicator = false
        
        return fcrmtcv
    }()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSelf()
        
        self.view.addSubview(fCRestaurantCollectionView)
        setupFCRestaurantCollectionView()
        
        self.view.addSubview(fCRMenuTitleCollectionView)
        setupFCRMenuTitleCollectionView()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    func setupSelf()  {
        self.view.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
    }
    
    private func setupFCRestaurantCollectionView() {
        NSLayoutConstraint.activate([
            fCRestaurantCollectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            fCRestaurantCollectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            fCRestaurantCollectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            fCRestaurantCollectionView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.22)
        ])
    }
    
    private func setupFCRMenuTitleCollectionView() {
        NSLayoutConstraint.activate([
            fCRMenuTitleCollectionView.topAnchor.constraint(equalTo: fCRestaurantCollectionView.bottomAnchor),
            fCRMenuTitleCollectionView.leadingAnchor.constraint(equalTo: fCRestaurantCollectionView.leadingAnchor),
            fCRMenuTitleCollectionView.trailingAnchor.constraint(equalTo: fCRestaurantCollectionView.trailingAnchor),
            fCRMenuTitleCollectionView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1),
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
