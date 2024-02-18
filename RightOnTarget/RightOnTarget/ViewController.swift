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
    
    var game: Game!
    
    override func loadView() {
        super.loadView()
        print("loadView")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        
        setupLayout()
        
        game = Game(startValue: 1, endValue: 50, rounds: 5)
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
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
        versionLabel.text = "Версия 1.2"
        
        NSLayoutConstraint.activate([
            versionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            versionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            versionLabel.widthAnchor.constraint(equalToConstant: 200),
            versionLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    @objc private func checkNumber() {
        game.calculateScore(with: Int(slider.value))
        
        if game.isGameEnded {
            showAlertWith(score: game.score) { _ in
                self.game.restartGame()
                self.updateLabelWithSecretNumber(newText: String(self.game.currentSecretValue))
            }
        } else {
            game.startNewRound()
            updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
        }
    }
    
    private func updateLabelWithSecretNumber(newText: String) {
        label.text = newText
    }
    
    private func showAlertWith(score: Int, clouse: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: "Игра окончена", message: "Вы заработали \(score) очков", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: clouse))
        self.present(alert, animated: true)
    }
    
}
