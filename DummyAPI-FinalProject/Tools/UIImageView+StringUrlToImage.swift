//
//  UIImageView+StringUrlToImage.swift
//  DummyAPI-FinalProject
//
//  Created by mona mohammed on 07/06/1443 AH.
//  Copyright © 1443 EM. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func setImageFromStringUrl(stringLink: String){
        
        if let link = URL(string: stringLink) {
            if let imageUrlToData = try? Data(contentsOf: link){
                self.image = UIImage(data: imageUrlToData)
            }
        }
    }
    
    func makeCircularImage(){
        self.layer.cornerRadius = self.frame.width / 2
    }
}
