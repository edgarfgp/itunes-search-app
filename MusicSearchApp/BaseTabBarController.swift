//
//  BaseTabBarController.swift
//  MusicSearchApp
//
//  Created by Edgar Gonzalez Pena on 07/02/2020.
//  Copyright © 2020 Edgar Gonzalez Pena. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        viewControllers = [
            createNavController(viewController: TodayVC(), title: "Today", image: SFSymbolds.today, tag: 0),
            createNavController(viewController: AppsVC(), title: "Apps", image: SFSymbolds.apps, tag: 1),
            createNavController(viewController: SearchVC(), title: "Search", image: SFSymbolds.search, tag: 2)
        ]
    }
    
    private func createNavController(viewController: UIViewController, title: String, image: UIImage?, tag: Int) -> UINavigationController {
        
        viewController.title = title
        viewController.view.backgroundColor = .systemBackground
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        navController.tabBarItem.title = title
        navController.tabBarItem = UITabBarItem(title: title, image: image, tag: tag)
        
        return navController
    }
    
}
