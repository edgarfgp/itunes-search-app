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
                
        viewControllers = [createTodayVC(), createAppsVC(), createSearchVC()]
    }
    
    private func createTodayVC () -> UINavigationController {
        let todayVC = TodayVC()
        todayVC.title = "Today"
        todayVC.tabBarItem = UITabBarItem(tabBarSystemItem: .recents, tag: 0)
        
        return UINavigationController(rootViewController: todayVC)
    }
    
    private func createAppsVC () -> UINavigationController {
        let appsVC = AppsVC()
        appsVC.title = "Apps"
        appsVC.tabBarItem = UITabBarItem(title: "Apps", image: SFSymbolds.search, tag: 1)
        
        return UINavigationController(rootViewController: appsVC)
    }
    
    private func createSearchVC () -> UINavigationController {
        let searchVC = SearchVC()
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 2)
        
        return UINavigationController(rootViewController: searchVC)
    }
    
}
