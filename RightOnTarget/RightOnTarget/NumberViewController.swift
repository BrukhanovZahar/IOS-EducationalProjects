//
//  ViewController.swift
//  RightOnTarget
//
//  Created by Захар Брюханов on 14.02.2024.
//

import UIKit

class NumberViewController: UIViewController {
    
    let slider = UISlider()
    let button = UIButton()
    let label = UILabel()
    
    var game: Game<SecretNumericValue>!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Number viewDidLoad")
        setupLayout()
        
        game = (GameFactory.getNumericGame() as! Game<SecretNumericValue>)
        updateLabelWithSecretNumber(newText: String(game.secretValue.value))
    }
    
    private func setupLayout() {
        view.addSubview(slider)
        view.addSubview(button)
        view.addSubview(label)
        
        configureView()
        configureSlider()
        configureButton()
        configureLabel()
    }
    
    private func configureView() {
        view.backgroundColor = .systemYellow
    }
    
    private func configureSlider() {
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
    
    private func configureButton() {
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
    
    private func configureLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            label.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 30)
        ])
    }
    
    @objc private func checkNumber() {
        var userSecretValue = game.secretValue
        userSecretValue.value = Int(slider.value)
        game.calculateScore(secretValue: game.secretValue, userValue: userSecretValue)
        
        if game.isGameEnded {
            showAlertWith(score: game.score) { _ in
                self.game.restartGame()
                self.updateLabelWithSecretNumber(newText: String(self.game.secretValue.value))
            }
        } else {
            game.startNewRound()
            updateLabelWithSecretNumber(newText: String(game.secretValue.value))
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
