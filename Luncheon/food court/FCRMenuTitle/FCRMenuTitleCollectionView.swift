//
//  FCRMenuTitleCollectionView.swift
//  Luncheon
//
//  Created by arshiya  on 7/23/1398 AP.
//  Copyright © 1398 AP Pouyesh system Saba. All rights reserved.
//

import UIKit

class FCRMenuTitleCollectionView: UICollectionView {
    
     private lazy var selectedMenuTitle:Int = 0
     private lazy var selectedFCRestaurant = 0
    
    
    
    var indexOfSelectedFCRestaurant: Int {
        get {
            return selectedFCRestaurant
        }
        set {
            selectedFCRestaurant = newValue
        }
    }
    
    var index: Int {
        get {
            return selectedMenuTitle
        }
        set {
            selectedMenuTitle = newValue
        }
    }

    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    

}
