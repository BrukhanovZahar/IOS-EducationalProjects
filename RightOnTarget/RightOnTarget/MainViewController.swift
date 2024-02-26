//
//  MainViewController.swift
//  RightOnTarget
//
//  Created by Захар Брюханов on 25.02.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    lazy var colorViewController = ColorViewController()
    lazy var numberViewController = NumberViewController()
    
    let label = UILabel()
    let versionLabel = UILabel()
    let colorButton = UIButton(type: .system)
    let numberButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Main viewDidLoad")
        setupLayout()
    }
    
    private func setupLayout() {
        view.addSubview(label)
        view.addSubview(colorButton)
        view.addSubview(numberButton)
        view.addSubview(versionLabel)
        
        configureView()
        configureLabel()
        configureColorButton()
        configureNumberButton()
        configureVersionLabel()
    }
    
    private func configureView() {
        view.backgroundColor = .systemGreen
        navigationController?.navigationBar.tintColor = .black
    }
    
    private func configureLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.text = "Выберите вариант игры"
        label.numberOfLines = 0
        label.textAlignment = .center
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            label.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.2)
        ])
    }
    
    private func configureColorButton() {
        colorButton.translatesAutoresizingMaskIntoConstraints = false
        colorButton.setTitle("Цвета", for: .normal)
        colorButton.titleLabel?.font = .systemFont(ofSize: 24)
        colorButton.setTitleColor(.black, for: .normal)
        
        colorButton.addTarget(self, action: #selector(openColorViewController), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            colorButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            colorButton.trailingAnchor.constraint(equalTo: label.leadingAnchor, constant: -50)
        ])
    }
    
    private func configureNumberButton() {
        numberButton.translatesAutoresizingMaskIntoConstraints = false
        numberButton.setTitle("Числа", for: .normal)
        numberButton.titleLabel?.font = .systemFont(ofSize: 24)
        numberButton.setTitleColor(.black, for: .normal)
        
        numberButton.addTarget(self, action: #selector(openNumberViewController), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            numberButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            numberButton.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 50)
        ])
    }
    
    private func configureVersionLabel() {
        versionLabel.translatesAutoresizingMaskIntoConstraints = false
        versionLabel.text = "Версия 1.4"
        
        NSLayoutConstraint.activate([
            versionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            versionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            versionLabel.widthAnchor.constraint(equalToConstant: 200),
            versionLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    @objc private func openColorViewController() {
        navigationController?.pushViewController(colorViewController, animated: true)
    }
    
    @objc private func openNumberViewController() {
        navigationController?.pushViewController(numberViewController, animated: true)
    }
}
