//
//  extention FCRMenuTitleCollectionViewDataSource.swift
//  Luncheon
//
//  Created by arshiya  on 7/23/1398 AP.
//  Copyright © 1398 AP Pouyesh system Saba. All rights reserved.
//

import Foundation
import UIKit

extension FCRMenuTitleCollectionView: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      //  assertionFailure("not Implemented")
        
     
            return index != -1 ? index : 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //assertionFailure("not Implemented")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuTitle", for: indexPath) as? FCRMenuTitleCollectionViewCell
        if FCRestaurnatManager.count != 0{
            let menu = FCRestaurnatManager.getRest(index: 1)[indexPath.item].getMenuPersianName
                   cell?.setTitle(menuTitle: menu)
                   return cell!
               }
        
        return cell!
    }
}
