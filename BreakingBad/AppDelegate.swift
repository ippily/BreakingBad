//
//  AppDelegate.swift
//  BreakingBad
//
//  Created by Emily Ip on 25/07/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        self.window = window

        let charactersViewController = CharactersViewController()
        let episodesViewController = EpisodesViewController()
        let quotesViewController = QuotesViewController()

        charactersViewController.tabBarItem.image = .checkmark
        episodesViewController.tabBarItem.image = .checkmark
        quotesViewController.tabBarItem.image = .checkmark

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [charactersViewController, episodesViewController, quotesViewController]
        tabBarController.selectedIndex = 0

        let navController = UINavigationController(rootViewController: tabBarController)
        window.rootViewController = navController

        return true
    }
}
