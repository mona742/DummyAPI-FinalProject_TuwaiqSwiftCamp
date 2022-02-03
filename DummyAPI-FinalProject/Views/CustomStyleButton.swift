//
//  CustomStyleButton.swift
//  DummyAPI-FinalProject
//
//  Created by mona mohammed on 16/06/1443 AH.
//  Copyright © 1443 EM. All rights reserved.
//

import UIKit

class CustomStyleButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        customShadow()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customShadow()
    }
    
    func customShadow() {
       self.layer.cornerRadius = 20
       self.layer.shadowColor = UIColor.black.cgColor
       self.layer.shadowOpacity = 0.3
       self.layer.shadowOffset = CGSize(width: 5, height: 12)
       self.layer.shadowRadius = 10
    }

}
