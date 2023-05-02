//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var numberButtons: [UIButton]!
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var buttonMultiply: UIButton!
    @IBOutlet weak var buttonDivide: UIButton!
    @IBOutlet weak var buttonErase: UIButton!
    
    let calcul = Calcul()
    
    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textView.text = ""
    }
    
    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        do {
            try calcul.addInteger(number: numberText)
            textView.text = calcul.result
        } catch CalculError.integerError {
            let alertVC = UIAlertController(title: "Attention !", message: "Une erreur de sur les nombres est survenue !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        } catch {
            print("An Error is occured in tappedNumberButton")
        }
    }
    
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        do {
            try calcul.addOperator(symbol: "+")
            textView.text = calcul.result
        } catch CalculError.operandError {
            let alertVC = UIAlertController(title: "Attention !", message: "Un operateur est déja mis !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        } catch {
            print("An Error is occured in tappedAdditionButton")
        }
    }
    
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        do {
            try calcul.addOperator(symbol: "-")
            textView.text = calcul.result
        } catch CalculError.operandError {
            let alertVC = UIAlertController(title: "Attention !", message: "Un operateur est déja mis !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        } catch {
            print("An Error is occured in tappedSubstractionButton")
        }
    }
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        do {
            try calcul.equal()
            textView.text = calcul.result
        } catch CalculError.operandError {
            let alertVC = UIAlertController(title: "Attention !", message: "Impossible de faire le calcul !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        } catch {
            print("An Error is occured in tappedEqualButton")
        }
    }
    
    @IBAction func tappedMultiplyButton(_ sender: UIButton) {
        do {
            try calcul.addOperator(symbol: "x")
            textView.text = calcul.result
        } catch CalculError.operandError {
            let alertVC = UIAlertController(title: "Attention !", message: "Un operateur est déja mis !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        } catch {
            print("An Error is occured in tappedMultiplyButton")
        }
    }
    
    @IBAction func tappedDivideButton(_ sender: UIButton) {
        do {
            try calcul.addOperator(symbol: "/")
            textView.text = calcul.result
        } catch CalculError.operandError {
            let alertVC = UIAlertController(title: "Attention !", message: "Un operateur est déja mis !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        } catch {
            print("An Error is occured in tappedDivideButton")
        }
    }
    
    @IBAction func tappedEraseButton(_ sender: UIButton) {
        do {
            try calcul.reset()
            textView.text = calcul.result
        } catch CalculError.eraseError {
            let alertVC = UIAlertController(title: "Attention !", message: "Une Erreur dans la suppression est survenue !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        } catch {
            print("An Error is occured in tappedEraseButton")
        }
    }
    
    
    @IBAction func tappedDotButton(_ sender: UIButton) {
        do {
            try calcul.addDot()
            textView.text = calcul.result
        } catch CalculError.dotError {
            let alertVC = UIAlertController(title: "Attention !", message: "Une virgule est déjà présente !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        } catch CalculError.dotOperandError {
            let alertVC = UIAlertController(title: "Attention !", message: "Un conflit est intervenu entre un opérateur et une virgule !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        } catch CalculError.dotErrorEmpty {
            let alertVC = UIAlertController(title: "Attention !", message: "Il n'y à aucun chiffre", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        } catch {
            print("An Error is occured in tappedDotButton")
        }
    }
    
    
}
