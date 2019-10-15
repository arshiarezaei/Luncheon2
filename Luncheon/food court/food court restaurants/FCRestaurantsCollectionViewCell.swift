//
//  FCRestaurantsCollectionViewCell.swift
//  Luncheon
//
//  Created by arshiya  on 7/22/1398 AP.
//  Copyright © 1398 AP Pouyesh system Saba. All rights reserved.
//

import UIKit

class FCRestaurantsCollectionViewCell: UICollectionViewCell {
    
    override var isSelected: Bool {
        didSet{
            setNeedsDisplay()
        }
    }
    
    private let unselecetedModeColor : UIColor = .lightGray
    
    
    private let restaurantLogoImage:UIImageView = {
        let rli = UIImageView(frame: .zero)
        rli.translatesAutoresizingMaskIntoConstraints = false
        rli.image? = (rli.image?.withRenderingMode(.alwaysTemplate))!
        rli.tintColor = .luncheonLogoTextColor
        rli.contentMode = .scaleAspectFit
        rli.layer.borderWidth = 2
        rli.layer.borderColor = UIColor.black.cgColor
        rli.layer.cornerRadius = rli.frame.width/2
        rli.layer.masksToBounds = true
        
        
        
        return rli
    }()
    
    private let restaurantNameLabel:UILabel = {
        let rnl = UILabel(frame: .zero)
        rnl.translatesAutoresizingMaskIntoConstraints = false
        rnl.textAlignment = .right
        rnl.semanticContentAttribute = .forceRightToLeft
        rnl.font = UIFont(name: "BYekan+", size: 15)
        return rnl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell(restaurantName: "رستوران")
        
        addSubview(restaurantLogoImage)
        setupRestaurantLogoImage()
        
        addSubview(restaurantNameLabel)
        setupRestaurantNameLabel()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func setNeedsDisplay() {
        super.setNeedsDisplay()
        restaurantNameLabel.textColor = isSelected ? UIColor.luncheonLogoTextColor : self.unselecetedModeColor
        restaurantLogoImage.tintColor = isSelected ? UIColor.luncheonLogoTextColor : self.unselecetedModeColor
        restaurantLogoImage.layer.borderColor = isSelected ? UIColor.luncheonLogoTextColor.cgColor : self.unselecetedModeColor.cgColor
        
    }
    
    
    
    func setupCell(restaurantName:String,restaurantLogo:UIImage=UIImage(named: "restaurant")!) {
          restaurantNameLabel.text = restaurantName
          restaurantLogoImage.image = restaurantLogo
      }
    
    private func setupRestaurantLogoImage()  {
        let logoWidth = min(self.frame.width, self.frame.height * 0.7)
        NSLayoutConstraint.activate([
            restaurantLogoImage.topAnchor.constraint(equalTo: self.topAnchor,constant: 8),
            restaurantLogoImage.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            restaurantLogoImage.safeAreaLayoutGuide.widthAnchor.constraint(equalToConstant: logoWidth),
            restaurantLogoImage.safeAreaLayoutGuide.heightAnchor.constraint(equalToConstant: logoWidth)
        ])
        restaurantLogoImage.layer.borderWidth = 2
        restaurantLogoImage.layer.borderColor = unselecetedModeColor.cgColor
        restaurantLogoImage.layer.cornerRadius = logoWidth/2
        restaurantLogoImage.layer.masksToBounds = true
    }
    
    private func setupRestaurantNameLabel()  {
        NSLayoutConstraint.activate([
            restaurantNameLabel.topAnchor.constraint(equalTo: restaurantLogoImage.bottomAnchor, constant: 8),
            restaurantNameLabel.centerXAnchor.constraint(equalTo: restaurantLogoImage.centerXAnchor),
        ])
    }
  
}
