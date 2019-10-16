//
//  RateView.swift
//  Luncheon
//
//  Created by arshiya  on 7/24/1398 AP.
//  Copyright © 1398 AP Pouyesh system Saba. All rights reserved.
//

import UIKit
@IBDesignable
class RateView: UIView {
    
    private let star:UIImageView = {
        let sv = UIImageView(frame: .zero)
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.image = UIImage(named: "rate star")
        sv.contentMode = .scaleAspectFill
        
        return sv
    }()
    
    private let rateNumnberLabel:UILabel = {
        let rnl = UILabel(frame: .zero)
        rnl.translatesAutoresizingMaskIntoConstraints = false
        rnl.textAlignment = .right
        rnl.font = UIFont(name: "BYekan+", size: rnl.font.pointSize)
        rnl.adjustsFontSizeToFitWidth = true
        rnl.semanticContentAttribute = .forceLeftToRight
        return rnl
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .green
        self.addSubview(star)
        setupStar()
        
    }
    
    required init?(coder: NSCoder) {
        // fatalError("init(coder:) has not been implemented")
        super.init(coder: coder)
        self.backgroundColor = .green
        
        self.addSubview(star)
        setupStar()
        
        self.addSubview(rateNumnberLabel)
        setupRateNumber()
        //setRateNumber(rate: 4.9)
        
        
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
        
        
        
    }
    
    
    func setRateNumber(rate:Double) {
        rateNumnberLabel.text = String(rate)
    }
    
    private func setupStar()  {
        NSLayoutConstraint.activate([
            star.safeAreaLayoutGuide.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor, multiplier: 0.6),
            star.safeAreaLayoutGuide.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
            star.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,constant: 4),
            star.safeAreaLayoutGuide.widthAnchor.constraint(equalTo: star.safeAreaLayoutGuide.heightAnchor)
            
        ])
    }
    
    private func setupRateNumber() {
        NSLayoutConstraint.activate([
            rateNumnberLabel.safeAreaLayoutGuide.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            rateNumnberLabel.safeAreaLayoutGuide.centerYAnchor.constraint(equalTo: star.safeAreaLayoutGuide.centerYAnchor),
            rateNumnberLabel.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: star.safeAreaLayoutGuide.trailingAnchor, constant: 3)
        
        ])
        
    }
}
