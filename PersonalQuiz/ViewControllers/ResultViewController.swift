//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 14.03.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var typeOfAnimalLabel: UILabel!
    @IBOutlet var animalDescriptionLabel: UILabel!
    
    var testResults: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        typeOfAnimalLabel.text = "Вы - \(determinationOfResult().rawValue)!"
        animalDescriptionLabel.text = determinationOfResult().definition
    }
    
    private func determinationOfResult () -> Animal {
        var topAnswers: [Animal: Int] = [:]
        for result in testResults {
            topAnswers[result.animal, default: 0] += 1
        }
        
        var animal: Animal = .cat
        var maxCount = 0
        topAnswers.forEach { key, value in
            if value > maxCount {
                animal = key
                maxCount = value
            }
        }
        return animal
    }
}
