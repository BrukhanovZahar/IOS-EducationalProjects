//
//  ColorViewController.swift
//  RightOnTarget
//
//  Created by Захар Брюханов on 25.02.2024.
//

import UIKit

class ColorViewController: UIViewController {
    
    let hexLabel = UILabel()
    let buttonColor1 = UIButton()
    let buttonColor2 = UIButton()
    let buttonColor3 = UIButton()
    let buttonColor4 = UIButton()
    
    var game: Game<SecretColorValue>!
    var correctButtonTag: Int = 0
    var buttonsCollection: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Color viewDidLoad")
        setupLayout()
        
        game = (GameFactory.getColorGame() as! Game<SecretColorValue>)
        buttonsCollection = [buttonColor1, buttonColor2, buttonColor3, buttonColor4]
        
        updateScene()
    }
    
    private func setupLayout() {
        view.addSubview(hexLabel)
        view.addSubview(buttonColor1)
        view.addSubview(buttonColor2)
        view.addSubview(buttonColor3)
        view.addSubview(buttonColor4)
        
        configureView()
        configureHexLabel()
        configureButtonColor1()
        configureButtonColor2()
        configureButtonColor3()
        configureButtonColor4()
    }
    
    private func configureView() {
        view.backgroundColor = .systemBlue
    }
    
    private func configureHexLabel() {
        hexLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            hexLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            hexLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25)
        ])
    }
    
    private func configureButtonColor1() {
        buttonColor1.translatesAutoresizingMaskIntoConstraints = false
        buttonColor1.setTitle("Вариант 1", for: .normal)
        buttonColor1.setTitleColor(.black, for: .normal)
        buttonColor1.tag = 1
        
        buttonColor1.addTarget(self, action: #selector(compareValue), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            buttonColor1.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            buttonColor1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60)
        ])
    }
    
    private func configureButtonColor2() {
        buttonColor2.translatesAutoresizingMaskIntoConstraints = false
        buttonColor2.setTitle("Вариант 2", for: .normal)
        buttonColor2.setTitleColor(.black, for: .normal)
        buttonColor2.tag = 2
        
        buttonColor2.addTarget(self, action: #selector(compareValue), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            buttonColor2.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            buttonColor2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -60)
        ])
    }
    
    private func configureButtonColor3() {
        buttonColor3.translatesAutoresizingMaskIntoConstraints = false
        buttonColor3.setTitle("Вариант 3", for: .normal)
        buttonColor3.setTitleColor(.black, for: .normal)
        buttonColor3.tag = 3
        
        buttonColor3.addTarget(self, action: #selector(compareValue), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            buttonColor3.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            buttonColor3.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 60)
        ])
    }
    
    private func configureButtonColor4() {
        buttonColor4.translatesAutoresizingMaskIntoConstraints = false
        buttonColor4.setTitle("Вариант 4", for: .normal)
        buttonColor4.setTitleColor(.black, for: .normal)
        buttonColor4.tag = 4
        
        buttonColor4.addTarget(self, action: #selector(compareValue), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            buttonColor4.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            buttonColor4.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60)
        ])
    }
    
    private func updateScene() {
        let secretColorString = game.secretValue.value.getByHEXString()
        updateSecretColorLabel(withText: secretColorString)
        updateButtons(withRightSecretValue: game.secretValue)
    }
    
    private func updateSecretColorLabel(withText newHexColorText: String) {
        hexLabel.text = "#\(newHexColorText)"
    }
    
    private func updateButtons(withRightSecretValue secretValue: SecretColorValue) {
        correctButtonTag = Array(1...4).randomElement()!
        
        buttonsCollection.forEach { button in
            if button.tag == correctButtonTag {
                button.backgroundColor = secretValue.value.getByUIColor()
            } else {
                var copySecretValueForButton = secretValue
                copySecretValueForButton.setRandomValue()
                button.backgroundColor = copySecretValueForButton.value.getByUIColor()
            }
        }
    }
    
    @objc private func compareValue(sender: UIButton) {
        var userValue = game.secretValue
        userValue.value = Color(from: sender.backgroundColor!)
        game.calculateScore(secretValue: game.secretValue, userValue: userValue)
        
        if game.isGameEnded {
            showAlertWith(score: game.score) { _ in
                self.game.restartGame()
                self.updateScene()
            }
        } else {
            game.startNewRound()
            updateScene()
        }
    }
    
    private func showAlertWith(score: Int, clouse: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: "Игра окончена", message: "Вы заработали \(score) очков", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: clouse))
        self.present(alert, animated: true)
    }
}
