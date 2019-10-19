//
//  FCRFoodCollectionViewCell.swift
//  Luncheon
//
//  Created by arshiya  on 7/23/1398 AP.
//  Copyright © 1398 AP Pouyesh system Saba. All rights reserved.
//

import UIKit

class FCRFoodCollectionViewCell: UICollectionViewCell {
    
    private let foodImage:UIImageView = {
        let fi = UIImageView(frame: .zero)
        fi.translatesAutoresizingMaskIntoConstraints = false
        
        return fi
    }()
    
    private let foodRateView:RateView = {
        let rv = RateView(frame: .zero)
        rv.translatesAutoresizingMaskIntoConstraints = false
        rv.alpha = 0.7
        return rv
        
    }()
    
    private let foodNameLabel:UILabel = {
        let fnl = UILabel(frame: .zero)
        fnl.translatesAutoresizingMaskIntoConstraints = false
        fnl.textColor = .black
        fnl.font = UIFont(name: "BYekan+", size: 15)
        fnl.textAlignment = .right
        fnl.semanticContentAttribute = .forceRightToLeft
        fnl.numberOfLines = 1
        return fnl
    }()
    private let foodDescriptionLabel:UILabel = {
        let fdl = UILabel(frame: .zero)
        fdl.translatesAutoresizingMaskIntoConstraints = false
        fdl.textColor = .grayTextColor
        fdl.textAlignment = .right
        fdl.font = UIFont(name: "BYekan+", size: 11)
        fdl.semanticContentAttribute = .forceRightToLeft
        fdl.numberOfLines = 1
        return fdl
    }()
    
    private let foodPriceLabel:UILabel = {
        let fpl = UILabel(frame: .zero)
        fpl.translatesAutoresizingMaskIntoConstraints = false
        fpl.textColor = .grayTextColor
        fpl.font = UIFont(name: "BYekan+", size: 15)
        fpl.textAlignment = .right
        fpl.semanticContentAttribute = .forceLeftToRight
//        fpl.layer.borderColor = UIColor.black.cgColor
//        fpl.layer.borderWidth = 2
        return fpl
    }()
    
    private let foodPriceAfterDiscountLabel:UILabel = {
        let fdpl = UILabel(frame: .zero)
        fdpl.translatesAutoresizingMaskIntoConstraints = false
        fdpl.textAlignment = .right
        fdpl.semanticContentAttribute = .forceLeftToRight
        fdpl.font = UIFont(name: "BYekan+", size: 15)
        fdpl.textColor = .grayTextColor
        return fdpl
        
    }()
    
    
    private let plusBuuton:UIButton = {
        let pb = UIButton(frame: .zero)
        pb.translatesAutoresizingMaskIntoConstraints = false
        pb.setImage(UIImage(named: "plus"), for: .init())
        return pb
    }()
    
    private let minusButton : UIButton = {
        let mb = UIButton(frame: .zero)
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.setImage(UIImage(named: "minus"), for: .init())
        return mb
    }()
    
    private let orderedCountLabel:UILabel = {
        let odl = UILabel(frame: .zero)
        odl.translatesAutoresizingMaskIntoConstraints = false
        odl.font = UIFont(name: "BYekan+", size: 15)
        odl.textAlignment = .center
        odl.semanticContentAttribute = .forceLeftToRight
        odl.textColor = .black
        odl.sizeToFit()
        
        return odl
    }()
    private lazy var orderedCout:Int = 0
    
    private lazy var plusButtonInitialLayoutSetup:[NSLayoutConstraint] = [
        plusBuuton.safeAreaLayoutGuide.centerYAnchor.constraint(equalTo: foodPriceLabel.safeAreaLayoutGuide.centerYAnchor, constant: 0),
        plusBuuton.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant:-8),
        plusBuuton.safeAreaLayoutGuide.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.11, constant: 0),
        plusBuuton.safeAreaLayoutGuide.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor, multiplier: 0.07, constant: 0),
    ]
    private lazy var plusButtonLayoutAfterbeingTapped:[NSLayoutConstraint] = [
        plusBuuton.safeAreaLayoutGuide.centerYAnchor.constraint(equalTo: foodPriceLabel.safeAreaLayoutGuide.centerYAnchor, constant: 0),
        plusBuuton.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant:-40),
        plusBuuton.safeAreaLayoutGuide.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.11, constant: 0),
        plusBuuton.safeAreaLayoutGuide.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor, multiplier: 0.07, constant: 0),
    ]
    
    private lazy var minusButtonInitialLayoutSetup:[NSLayoutConstraint] = [
        minusButton.safeAreaLayoutGuide.centerYAnchor.constraint(equalTo: foodPriceLabel.safeAreaLayoutGuide.centerYAnchor, constant: 0),
        minusButton.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: orderedCountLabel.safeAreaLayoutGuide.trailingAnchor, constant:4),
        minusButton.safeAreaLayoutGuide.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.11, constant: 0),
        minusButton.safeAreaLayoutGuide.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor, multiplier: 0.07, constant: 0),
        minusButton.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -4)
        
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        self.layer.cornerRadius = 16
        self.layer.masksToBounds = true
        self.backgroundColor = .white
        
        
        self.addSubview(foodImage)
        setupFoodImage()
        
        self.addSubview(foodRateView)
        setupFoodRateView()
        
        self.addSubview(foodNameLabel)
        setupFoodNameLabel()
        
        self.addSubview(foodDescriptionLabel)
        setupFoodDescriptionLabel()
        
        self.addSubview(foodPriceLabel)
        setupFoodPriceLabel()
        
        self.addSubview(foodPriceAfterDiscountLabel)
        setupfoodPriceAfterDiscountLabel()
        
        self.addSubview(plusBuuton)
        setupPlusButton()
        
        
        
        
        
        setupCell(foodName: "اسم غذا", foodDescription: "این غذا شامل توضیحات خاصی نمی باشد", foodPrice: 20000, foodPriceAfterDiscount: 18000, foodRate: 4.2)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(foodName:String , foodDescription:String,foodPrice:Int,foodPriceAfterDiscount:Int!,foodImage:UIImage=UIImage(named: "foodCell")!,foodRate:Double) {
        let foodPriceInPersinaNumberFormate :String = Utilities.convertToPersianNumber(number: foodPrice) + "ت"
        self.foodNameLabel.text = foodName
        self.foodPriceLabel.text = foodPriceInPersinaNumberFormate
        self.foodDescriptionLabel.text = foodDescription
        self.foodImage.image = foodImage
        
        if let fpad = foodPriceAfterDiscount{
            let fpadInPersianNumberFormat:String = Utilities.convertToPersianNumber(number: fpad)
            self.foodPriceAfterDiscountLabel.text = fpadInPersianNumberFormat + "ت"
            self.foodPriceLabel.text?.removeLast()
            let attributedString = NSMutableAttributedString(string: foodPriceInPersinaNumberFormate)
            attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributedString.length))
            foodPriceLabel.font = UIFont(name: "BYekan+", size:11)
            self.foodPriceLabel.attributedText = attributedString
        }
        foodRateView.setRateNumber(rate: foodRate)
        
    }
    
    private func setupFoodRateView() {
        NSLayoutConstraint.activate([
            foodRateView.safeAreaLayoutGuide.topAnchor.constraint(equalTo: foodImage.safeAreaLayoutGuide.topAnchor, constant: 8),
            foodRateView.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            foodRateView.safeAreaLayoutGuide.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.31)
        ])
        
        
    }
    
    
    private func setupFoodImage()  {
        NSLayoutConstraint.activate([
            foodImage.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            foodImage.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            foodImage.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            foodImage.safeAreaLayoutGuide.heightAnchor.constraint(equalTo: self.heightAnchor,multiplier: 0.5),
        ])
    }
    private func setupFoodNameLabel() {
        NSLayoutConstraint.activate([
            foodNameLabel.safeAreaLayoutGuide.topAnchor.constraint(equalTo: foodImage.safeAreaLayoutGuide.bottomAnchor, constant: 8),
            foodNameLabel.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            foodNameLabel.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            foodNameLabel.safeAreaLayoutGuide.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1, constant: 10),
            
        ])
    }
    private func setupFoodDescriptionLabel()  {
        NSLayoutConstraint.activate([
            foodDescriptionLabel.safeAreaLayoutGuide.topAnchor.constraint(equalTo: foodNameLabel.safeAreaLayoutGuide.bottomAnchor,constant: 0),
            foodDescriptionLabel.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            foodDescriptionLabel.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            foodDescriptionLabel.safeAreaLayoutGuide.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor, multiplier: 0.06, constant: 12),
        ])
    }
    private func setupFoodPriceLabel() {
        NSLayoutConstraint.activate([
            foodPriceLabel.safeAreaLayoutGuide.topAnchor.constraint(equalTo: foodDescriptionLabel.safeAreaLayoutGuide.bottomAnchor,constant: 0),
            foodPriceLabel.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            foodPriceLabel.safeAreaLayoutGuide.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor, multiplier: 0.055, constant: 15)
        ])
    }
    private func setupfoodPriceAfterDiscountLabel() {
        NSLayoutConstraint.activate([
            foodPriceAfterDiscountLabel.safeAreaLayoutGuide.topAnchor.constraint(equalTo: foodDescriptionLabel.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            foodPriceAfterDiscountLabel.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: foodPriceLabel.safeAreaLayoutGuide.trailingAnchor, constant: 4),
            foodPriceAfterDiscountLabel.safeAreaLayoutGuide.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor,multiplier: 0.055, constant: 15),
        ])
    }
    
    private func setupPlusButton() {
        plusBuuton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        NSLayoutConstraint.activate(plusButtonInitialLayoutSetup)
        
    }
    
    private func setupMinusButton()  {
        minusButton.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
                
    }
    @objc private func plusButtonTapped() {
        debugPrint("plusButton tapped")
        NSLayoutConstraint.deactivate(plusButtonInitialLayoutSetup)
        NSLayoutConstraint.activate(plusButtonLayoutAfterbeingTapped)
        orderedCout += 1
        orderedCountLabel.text = Utilities.convertToPersianNumber(number: orderedCout)
        self.addSubview(orderedCountLabel)
        NSLayoutConstraint.activate([
            orderedCountLabel.safeAreaLayoutGuide.centerYAnchor.constraint(equalTo: plusBuuton.safeAreaLayoutGuide.centerYAnchor),
            orderedCountLabel.safeAreaLayoutGuide.heightAnchor.constraint(equalToConstant: 17),
            orderedCountLabel.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: plusBuuton.safeAreaLayoutGuide.trailingAnchor,constant: 4)
        ])
        self.addSubview(minusButton)
        setupMinusButton()
        NSLayoutConstraint.activate(minusButtonInitialLayoutSetup)
        
    }
    
    @objc private func minusButtonTapped(){
        debugPrint("minuseButtonTapped")
        orderedCout -= 1
        orderedCountLabel.text = Utilities.convertToPersianNumber(number: orderedCout)
        
    }
    
}
