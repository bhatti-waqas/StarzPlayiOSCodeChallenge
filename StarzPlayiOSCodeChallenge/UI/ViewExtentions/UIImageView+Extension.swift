//
//  UIImageView+Extension.swift
//  StarzPlayiOSCodeChallenge
//
//  Created by Bhatti on 18/08/2018.
//  Copyright © 2018 Bhatti. All rights reserved.
//


import UIKit
import AlamofireImage

protocol ImageLazyLoading {
    
    func loadImage(withUrlString urlString:String?,placeholderImage placeholder:UIImage?)
    
}

extension UIImageView:ImageLazyLoading {
    
    func loadImage(withUrlString urlString: String?, placeholderImage placeholder: UIImage?) {
        
        image = placeholder
        
        guard
            let _urlString = urlString,
            let imageURL = URL(string:_urlString)
            else { return }
        
        af_setImage(withURL: imageURL, placeholderImage: placeholder,imageTransition: .crossDissolve(0.2))
    }
    
}
