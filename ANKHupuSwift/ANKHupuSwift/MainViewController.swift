//
//  ViewController.swift
//  Example
//
//  Created by Hirohisa Kawasaki on 6/24/15.
//  Copyright (c) 2015 Hirohisa Kawasaki. All rights reserved.
//

import UIKit

let controllersTitle = ["推荐","NBA","绝对求生","英雄联盟"]

class MainViewController: PageController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuBar.backgroundColor = UIColor.white.withAlphaComponent(0.9)
        menuBar.register(UINib(nibName: "CustomMenuBarCell", bundle: nil))
        menuBar.isAutoSelectDidEndUserInteractionEnabled = false

        viewControllers = createViewControllers()
        
        
    }
    
    override var frameForMenuBar: CGRect {
        let frame = super.frameForMenuBar

        return CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: 64)
    }
    

}

extension MainViewController {

    func createViewControllers() -> [UIViewController] {
        
        return controllersTitle.map { name -> UIViewController in
            let viewController = NormalNewsListViewController()
            viewController.title = name
            return viewController
        }
    }
}

