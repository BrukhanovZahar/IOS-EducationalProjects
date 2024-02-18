//
//  SecondViewController.swift
//  RightOnTarget
//
//  Created by Захар Брюханов on 18.02.2024.
//

import UIKit

class SecondViewController: UIViewController {
    
    let button = UIButton(type: .system)
    
    override func loadView() {
        super.loadView()
        print("loadView SecondViewController")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad SecondViewController")
        
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear SecondViewController")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear SecondViewController")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear SecondViewController")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear SecondViewController")
    }
    
    func setupLayout() {
        view.addSubview(button)
        
        configureView()
        configureButton()
    }
    
    func configureView() {
        view.backgroundColor = .white
    }
    
    func configureButton() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Назад", for: .normal)
        
        button.addTarget(self, action: #selector(showMainScrean), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
    
    @objc func showMainScrean() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
