//
//  extention FCRestaurantsCollectionViewDataSource.swift
//  Luncheon
//
//  Created by arshiya  on 7/22/1398 AP.
//  Copyright © 1398 AP Pouyesh system Saba. All rights reserved.
//

import Foundation
import UIKit

extension FCRestaurantsCollectionView:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FCRestaurnatManager.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "restaurants", for: indexPath) as? FCRestaurantsCollectionViewCell
    //    cell?.backgroundColor = .red
        let res = FCRestaurnatManager.getRest(index: indexPath.item)
        cell?.setupCell(restaurantName: res!.getPersianName,restaurantLogo: res!.fCRestaurantLogo)
        return cell!
    }
    
    
}
