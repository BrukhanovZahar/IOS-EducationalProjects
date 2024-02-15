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
    
    var number = 0
    var round = 0
    var points = 0

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
        
        button.addTarget(self, action: #selector(checkNumber), for: .touchUpInside)
        
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
    
    @objc func checkNumber() {
        
        if round == 0 {
            number = Int.random(in: 1...50)
            label.text = "\(number)"
            round = 1
        } else {
            let numberOnSlider = Int(slider.value.rounded())
            
            if numberOnSlider > number {
                points += 50 - numberOnSlider + number
            } else if numberOnSlider < number {
                points += 50 - number + numberOnSlider
            } else {
                points += 50
            }
            
            if round == 5 {
                let alert = UIAlertController(title: "Игра окончена", message: "Вы заработали \(points) очков", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: { _ in
                    self.number = Int.random(in: 1...50)
                    self.label.text = "\(self.number)"
                }))
                present(alert, animated: true)
                round = 1
                points = 0
            } else {
                round += 1
                
                number = Int.random(in: 1...50)
                label.text = "\(number)"
            }
        }
    }

}

