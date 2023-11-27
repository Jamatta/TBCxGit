//
//  TabBarController.swift
//  catFact
//
//  Created by Nika Jamatashvili on 28.11.23.
//

import UIKit

final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()
    }
    
    private func setupTabs() {
        let factsViewController = FactsListViewController()
        let catFacts = createNavBar(with: "Facts", and: UIImage(systemName: "list.bullet"), vc: factsViewController)

        let breedsViewController = BreedsListViewController()
        let breeds = createNavBar(with: "Breeds", and: UIImage(systemName: "pawprint.fill"), vc: breedsViewController)

        self.setViewControllers([catFacts, breeds], animated: false)
    }

    private func createNavBar(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        vc.title = title
        return nav
    }
}
