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
    let versionLabel = UILabel()
    
    var number = 0
    var round = 1
    var points = 0
    
    override func loadView() {
        super.loadView()
        print("loadView")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        
        setupLayout()
        
        number = Int.random(in: 1...50)
        label.text = "\(number)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    func setupLayout() {
        view.addSubview(slider)
        view.addSubview(button)
        view.addSubview(label)
        view.addSubview(versionLabel)
        
        configureView()
        configureSlider()
        configureButton()
        configureLabel()
        configureVersionLabel()
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
    
    func configureVersionLabel() {
        versionLabel.translatesAutoresizingMaskIntoConstraints = false
        versionLabel.text = "Версия 1.1"
        
        NSLayoutConstraint.activate([
            versionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            versionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            versionLabel.widthAnchor.constraint(equalToConstant: 200),
            versionLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    @objc func checkNumber() {
        
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

