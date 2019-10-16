//
//  extention FCRFoodCollectionViewDataSource.swift
//  Luncheon
//
//  Created by arshiya  on 7/23/1398 AP.
//  Copyright © 1398 AP Pouyesh system Saba. All rights reserved.
//

import Foundation
import UIKit

extension FCRFoodCollectionView:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        assertionFailure("not implemented")
        return  10
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        assertionFailure("not implemented")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "uncustomizableFood", for: indexPath) as? FCRFoodCollectionViewCell
        
        return cell!
    }


}
