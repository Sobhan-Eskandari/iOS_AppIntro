//
//  IntroController.swift
//  AppIntroScrollView
//
//  Created by Sobhan Eskandari on 12/10/16.
//  Copyright © 2016 Sobhan Eskandari. All rights reserved.
//

import UIKit

class IntroController: UIView {
    @IBOutlet weak var introImage: UIImageView!
    @IBOutlet weak var introTitle: UILabel!

    class func loadFromNib() -> IntroController {
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: "IntroView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! IntroController
        return view
    }
    
    func configure(data : [String:String]){
        introTitle.text = data["title"]
        let image = UIImage(named: data["image"]!)
        introImage.image = image
    }
}
