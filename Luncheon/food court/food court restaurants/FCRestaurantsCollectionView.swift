//
//  FCRestaurantsCollectionView.swift
//  Luncheon
//
//  Created by arshiya  on 7/22/1398 AP.
//  Copyright © 1398 AP Pouyesh system Saba. All rights reserved.
//

import UIKit

class FCRestaurantsCollectionView: UICollectionView {
    
    
    
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        let y = bounds.maxY - 1
        let minX = bounds.minX
        let maxX = bounds.maxX
        let lineColor = UIColor(red: 236/255, green: 235/255, blue: 235/255, alpha: 1).cgColor
        
        context.setStrokeColor(lineColor)
        context.setLineWidth(2.0)
        context.move(to: CGPoint(x: minX, y: y))
        context.addLine(to: CGPoint(x: maxX, y: y))
        context.strokePath()
        
    }
    
    
}
