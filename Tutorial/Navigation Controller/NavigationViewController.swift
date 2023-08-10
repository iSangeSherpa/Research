//
//  NavigationViewController.swift
//  Tutorial
//
//  Created by Sange Sherpa on 08/08/2023.
//

import UIKit

class NavigationViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let height: CGFloat = 150
        let bounds = self.navigationController!.navigationBar.bounds
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height + height)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let leftImageButton = UIImage(systemName: "cursorarrow.click")
        let leftBarButton = UIBarButtonItem(image: leftImageButton, style: .plain, target: .none, action: .none)
        
        let rightImageButton = UIImage(systemName: "paperplane")
        let rightBarButton = UIBarButtonItem(image: rightImageButton, style: .plain, target: .none, action: .none)
        
        self.navigationItem.title = "Navigation Controller"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.yellow]
        self.navigationItem.rightBarButtonItem = rightBarButton
        self.navigationItem.leftBarButtonItem = leftBarButton
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.backgroundColor = UIColor.black
    }
}
