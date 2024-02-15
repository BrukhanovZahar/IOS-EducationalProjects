//
//  ViewController.swift
//  RightOnTarget
//
//  Created by Захар Брюханов on 14.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let slider = UISlider()
    let button = UIButton()
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    }
    
    func setupLayout() {
        view.addSubview(slider)
        view.addSubview(button)
        view.addSubview(label)
        
        configureView()
        configureSlider()
        configureButton()
        configureLabel()
    }
    
    func configureView() {
        view.backgroundColor = .systemYellow
    }
    
    func configureSlider() {
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumTrackTintColor = .systemPink
        slider.thumbTintColor = .systemPink
        slider.tintColor = .systemPurple
        slider.minimumValueImage = UIImage(systemName: "01.square.fill")
        slider.maximumValueImage = UIImage(systemName: "50.square.fill")
        slider.minimumValue = 1
        slider.maximumValue = 50
        slider.value = 25
                
        NSLayoutConstraint.activate([
            slider.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            slider.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            slider.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 20)
        ])
    }
    
    func configureButton() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Проверить", for: .normal)
        button.setTitleColor(.systemIndigo, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            button.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 30)
        ])
    }
    
    func configureLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            label.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 30)
        ])
    }


}

