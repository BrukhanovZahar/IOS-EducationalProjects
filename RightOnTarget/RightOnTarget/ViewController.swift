//
//  ViewController.swift
//  RightOnTarget
//
//  Created by Захар Брюханов on 14.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let slider = UISlider()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    }
    
    func setupLayout() {
        view.addSubview(slider)
        
        configureSlider()
    }
    
    func configureSlider() {
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            slider.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            slider.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            slider.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 20)
        ])
    }


}

