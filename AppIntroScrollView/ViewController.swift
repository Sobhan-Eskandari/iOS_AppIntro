//
//  ViewController.swift
//  AppIntroScrollView
//
//  Created by Sobhan Eskandari on 12/9/16.
//  Copyright © 2016 Sobhan Eskandari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageController: UIPageControl!
    
    let imageNames = ["introtour01","introtour02","introtour03","introtour04"]
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        setUpImageViews()
    }

    func setUpImageViews(){
        var totalWidth: CGFloat = 0
        
        for imageName in imageNames {
            let image = UIImage(named: imageName)
            let imageView = UIImageView(image: image)
            imageView.frame = CGRect(origin: CGPoint(x:totalWidth,y:0), size: view.bounds.size)
            imageView.contentMode = .scaleAspectFit
            scrollView.addSubview(imageView)
            totalWidth += imageView.bounds.size.width
        }
        
        scrollView.contentSize = CGSize(width: totalWidth, height: scrollView.bounds.size.height)
    }

}

extension ViewController : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = Int(scrollView.contentSize.width) / imageNames.count
        pageController.currentPage = Int(scrollView.contentOffset.x) / pageWidth
    }
}

