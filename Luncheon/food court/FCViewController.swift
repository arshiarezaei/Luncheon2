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
        layout.itemSize = CGSize(width: 56, height: 90)
//        layout.estimatedItemSize =
//        layout.minimumLineSpacing = 10
//        layout.minimumInteritemSpacing = 40
        
        let fcrcv = FCRestaurantsCollectionView(frame: .zero, collectionViewLayout: layout)
        fcrcv.translatesAutoresizingMaskIntoConstraints = false
        fcrcv.semanticContentAttribute = .forceRightToLeft
        fcrcv.backgroundColor = .white
        fcrcv.dataSource = fcrcv.self
//        fcrcv.delegate = fcrcv.self
        fcrcv.register(FCRestaurantsCollectionViewCell.self, forCellWithReuseIdentifier: "restaurants")
        fcrcv.showsHorizontalScrollIndicator = false
        fcrcv.showsHorizontalScrollIndicator = false
        return fcrcv
        
    }()
    
    
    private let fCRMenuTitleCollectionView :FCRMenuTitleCollectionView! = {
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
    
    let fCRFoodCollectionView : FCRFoodCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let fcrfcv = FCRFoodCollectionView(frame: .zero, collectionViewLayout: layout)
        fcrfcv.translatesAutoresizingMaskIntoConstraints = false
        fcrfcv.semanticContentAttribute = .forceRightToLeft
        fcrfcv.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        fcrfcv.showsVerticalScrollIndicator = true
        fcrfcv.bounces = false
        fcrfcv.dataSource = fcrfcv.self
        fcrfcv.delegate = fcrfcv.self
        fcrfcv.register(FCRFoodCollectionViewCell.self, forCellWithReuseIdentifier: "uncustomizableFood")
        return fcrfcv
        
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(fCRestaurantCollectionView)
        setupFCRestaurantCollectionView()
        
        self.view.addSubview(fCRMenuTitleCollectionView)
        setupFCRMenuTitleCollectionView()
        
        self.view.addSubview(fCRFoodCollectionView)
        setupFCRFoodCollectionView()
        let index:IndexPath = IndexPath(row: 0, section: 0)
                
        FCRestaurnatManager.getRestaurantsOfAFC(fCid: "test"){
            self.fCRestaurantCollectionView.reloadData()
            self.fCRestaurantCollectionView.selectItem(at: index, animated: true, scrollPosition: .init())
            self.fCRMenuTitleCollectionView.reloadData()
//            self.fCRMenuTitleCollectionView.index = 1
//            self.fCRMenuTitleCollectionView.reloadData()
//            self.fCRMenuTitleCollectionView.selectItem(at: index, animated: true, scrollPosition: UICollectionView.ScrollPosition.init())
            if FCRestaurnatManager.count==1 {
                self.fCRMenuTitleCollectionView.index  = FCRestaurnatManager.getRest(index: 0)!.getCountOfMenus
                self.fCRMenuTitleCollectionView.reloadData()
                self.fCRMenuTitleCollectionView.selectItem(at: index, animated: true, scrollPosition: UICollectionView.ScrollPosition.init())
                
            }
            
        }
     //   Networking.getMenusOfAFCRestaurant(fCRestaurantid: "92b78e08-d2e2-476b-881d-2cee415eeb8d")
        
    }
    
    
    
     static func setupSelf()  {
        //        self.view.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        print("farnaz")
        
        
    }
    func reloadFCRestaurantCollectionView() {
        fCRFoodCollectionView.reloadData()
    }
    
    
    private func setupFCRestaurantCollectionView() {
       fCRestaurantCollectionView.delegate = self
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
    private func setupFCRFoodCollectionView() {
        NSLayoutConstraint.activate([
            fCRFoodCollectionView.safeAreaLayoutGuide.topAnchor.constraint(equalTo: fCRMenuTitleCollectionView.safeAreaLayoutGuide.bottomAnchor),
            fCRFoodCollectionView.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            fCRFoodCollectionView.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            fCRFoodCollectionView.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
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
extension FCViewController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView.self {
        case fCRestaurantCollectionView:
            fCRestaurantCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: UICollectionView.ScrollPosition.init())
            fCRMenuTitleCollectionView.index = FCRestaurnatManager.getRest(index: indexPath.item)!.getCountOfMenus
            fCRMenuTitleCollectionView.indexOfSelectedFCRestaurant = indexPath.item
            let preseledtedIndex:IndexPath = IndexPath(row: 0, section: 0)
            fCRMenuTitleCollectionView.reloadData()
            fCRMenuTitleCollectionView.selectItem(at: preseledtedIndex, animated: true, scrollPosition: UICollectionView.ScrollPosition.init())
            


        default:
            debugPrint("default")
        }
    }
}
