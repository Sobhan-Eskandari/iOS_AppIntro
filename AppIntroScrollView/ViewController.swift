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
    
    let tourData = [
        [
            "image" : "home",
            "title" : "I also had the same issue.Actually, I had created an outlet connection for a text. I named it , for some reasons i later decided to change the name and I deleted the declaration from the header.",
            ],
        [
            "image" : "topstores",
            "title" : "Over 150 courses and growing",
            ],
        [
            "image" : "allstores",
            "title" : "Write actual code",
            ],
        [
            "image" : "introtour04",
            "title" : "Track your success",
            ]
    ]
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        //setUpImageViews()
        setupPageViews()
    }
    
    func creatPageView(data: [String:String]) -> IntroController{
        let introView = IntroController.loadFromNib()
        introView.configure(data: data)
        return introView
    }
    
    func setupPageViews(){
        var totalWidth: CGFloat = 0
        
        for data in tourData{
            let introView = creatPageView(data: data)
            introView.frame = CGRect(origin: CGPoint(x:totalWidth,y:0), size: view.bounds.size)
            scrollView.addSubview(introView)
            totalWidth += introView.bounds.size.width

        }
        scrollView.contentSize = CGSize(width: totalWidth, height: scrollView.bounds.size.height)

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

