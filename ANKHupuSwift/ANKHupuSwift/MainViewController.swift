//
//  ViewController.swift
//  Example
//
//  Created by Hirohisa Kawasaki on 6/24/15.
//  Copyright (c) 2015 Hirohisa Kawasaki. All rights reserved.
//

import UIKit
import SwiftUI

let controllersTitle = ["NBA","推荐","绝对求生","英雄联盟"]

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
            
            let swiftUIView = NewsList(tag: name) // swiftUIView is View
            let viewController = UIHostingController(rootView: swiftUIView)
            viewController.title = name
            return viewController
        }
    }
}

