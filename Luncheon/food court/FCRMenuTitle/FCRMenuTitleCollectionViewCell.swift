//
//  FCRMenuTitleCollectionViewCell.swift
//  Luncheon
//
//  Created by arshiya  on 7/23/1398 AP.
//  Copyright © 1398 AP Pouyesh system Saba. All rights reserved.
//

import UIKit

class FCRMenuTitleCollectionViewCell: UICollectionViewCell {

    override var isSelected: Bool{
        didSet{
            setNeedsDisplay()
        }
    }
    
    private let menuTitleLabel :UILabel = {
        
        let mtl = UILabel(frame: .zero)
        mtl.translatesAutoresizingMaskIntoConstraints = false
        mtl.textColor = .grayTextColor
        mtl.textAlignment = .right
        mtl.font = UIFont(name: "BYekan+", size: 15)
        
        return mtl
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(menuTitleLabel)
        setupMenuTitleLabel()
        setTitle(menuTitle: "عنوان منو")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setNeedsDisplay() {
        menuTitleLabel.textColor = isSelected ? UIColor.luncheonLogoTextColor : UIColor.grayTextColor
    }
    
    func setTitle(menuTitle:String) {
        menuTitleLabel.text = menuTitle
    }
    private func setupMenuTitleLabel() {
        NSLayoutConstraint.activate([
            menuTitleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            menuTitleLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            menuTitleLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            menuTitleLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant:-2)
            
        ])
    }
    
}
