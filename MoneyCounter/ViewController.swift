//
//  ViewController.swift
//  MoneyCounter
//
//  Created by Tell van den Bergh on 20/05/2019.
//  Copyright © 2019 Tell van den Bergh. All rights reserved.
//

import UIKit
import QuartzCore

let setDefaults = UserDefaults.standard

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1388783753, green: 0.1384974718, blue: 0.1715498269, alpha: 1)
        currencyIndicator = setDefaults.string(forKey: "currencyIndicatorKey") ?? "€"
        layout()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    let l500 = UILabel()
    let l200 = UILabel()
    let l100 = UILabel()
    let l50 = UILabel()
    let l20 = UILabel()
    let l10 = UILabel()
    let l5 = UILabel()
    
    let currency = UIButton()
    let som = UILabel()
    
    let E500 = UIButton()
    let E200 = UIButton()
    let E100 = UIButton()
    let E50 = UIButton()
    let E20 = UIButton()
    let E10 = UIButton()
    let E5 = UIButton()
    
    let B0 = UIButton()
    let B1 = UIButton()
    let B2 = UIButton()
    let B3 = UIButton()
    let B4 = UIButton()
    let B5 = UIButton()
    let B6 = UIButton()
    let B7 = UIButton()
    let B8 = UIButton()
    let B9 = UIButton()
    
    let Bis = UIButton()
    let BC = UIButton()
    
    var currencyIndicator = "€"
    
    var nilLabel = UILabel()
    
    var selectedE = UILabel()
    var selectedButton = UIButton()
    var invoer = String()
    
    // Colors
    let numberColor =   #colorLiteral(red: 0.9411764706, green: 0.4980392157, blue: 0.3529411765, alpha: 1)
    let cColor =        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    let detailColor =   #colorLiteral(red: 1, green: 0.1490196078, blue: 0, alpha: 1)
    let euroColor =     #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    let selectcolor =   #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 0.7255993151)
    let backgroundColor = #colorLiteral(red: 0.1372375786, green: 0.1372687519, blue: 0.1755940914, alpha: 1)
    
    
    // Functions
    func selectE(label: UILabel, button: UIButton) {
        invoer = ""
        
        selectedE.textColor = numberColor
        selectedButton.backgroundColor = .clear
        selectedButton.setTitleColor(euroColor, for: .normal)
        
        selectedE = label
        selectedButton = button
        
        label.textColor = backgroundColor
        button.setTitleColor(backgroundColor, for: .normal)
        button.backgroundColor = selectcolor
    
    }
    
    @objc func pressNumber(sender: UIButton!) {
        if currencyIndicator == "$" {
            switch sender.titleLabel?.text {
            case "100":
                selectE(label: l500, button: E500)
            case "50":
                selectE(label: l200, button: E200)
            case "20":
                selectE(label: l100, button: E100)
            case "10":
                selectE(label: l50, button: E50)
            case "5":
                selectE(label: l20, button: E20)
            case "2":
                selectE(label: l10, button: E10)
            case "1":
                selectE(label: l5, button: E5)
            default:
                print("$ ERROR")
            }
        } else if currencyIndicator == "€" {
            switch sender.titleLabel?.text {
            case "500":
                selectE(label: l500, button: E500)
            case "200":
                selectE(label: l200, button: E200)
            case "100":
                selectE(label: l100, button: E100)
            case "50":
                selectE(label: l50, button: E50)
            case "20":
                selectE(label: l20, button: E20)
            case "10":
                selectE(label: l10, button: E10)
            case "5":
                selectE(label: l5, button: E5)
            default:
                print("€ ERROR")
            }
        }
 
    }
    
    @objc func pressKey(sender: UIButton!) {
        if selectedE.text == "0" && sender.titleLabel?.text == "0" {
            return
        } else {
            invoer += sender.titleLabel!.text!
            selectedE.text = invoer
        }
    }
    
    @objc func pressIsKey(sender: UIButton!) {
        som.text = String(Calculate())
        selectedE.textColor = numberColor
        selectedButton.backgroundColor = .clear
        selectedButton.setTitleColor(euroColor, for: .normal)
        selectedE = nilLabel
    }
    
    @objc func pressCKey(sender: UIButton!) {
        invoer = ""
        som.text = "0"
        
        l500.text = "0"
        l200.text = "0"
        l100.text = "0"
        l50.text = "0"
        l20.text = "0"
        l10.text = "0"
        l5.text = "0"
        
        selectedE.textColor = numberColor
        selectedButton.backgroundColor = .clear
        selectedButton.setTitleColor(euroColor, for: .normal)
        selectedE = nilLabel
        
    }
    
    @objc func pressCurrencyKey(sender: UIButton!) {
        switch currencyIndicator {
        case "€":
            currency.setTitle("$", for: .normal)
            currencyIndicator = "$"
        case "$":
            currency.setTitle("€", for: .normal)
            currencyIndicator = "€"
        default:
            print("currency ERROR")
        }
        setDefaults.set(currencyIndicator, forKey: "currencyIndicatorKey")
        layout()
    }
    


    
    func Calculate() -> Int {
        switch currencyIndicator {
        case "$":
            let d100 = Int(l500.text!)! * 100
            let d50 = Int(l200.text!)! * 50
            let d20 = Int(l100.text!)! * 20
            let d10 = Int(l50.text!)! * 10
            let d5 = Int(l20.text!)! * 5
            let d2 = Int(l10.text!)! * 2
            let d1 = Int(l5.text!)! * 1
            return d100 + d50 + d20 + d10 + d5 + d2 + d1
        case "€":
            let e500 = Int(l500.text!)! * 500
            let e200 = Int(l200.text!)! * 200
            let e100 = Int(l100.text!)! * 100
            let e50 = Int(l50.text!)! * 50
            let e20 = Int(l20.text!)! * 20
            let e10 = Int(l10.text!)! * 10
            let e5 = Int(l5.text!)! * 5
            return e500 + e200 + e100 + e50 + e20 + e10 + e5
        default:
            print("Calculate ERROR")
            return 0
        }

        
    }
    
    
    
    func layout() {
        
        let width = self.view.frame.width
        let height = self.view.frame.height
        let labelHeight = height / 16
        let buttonWith = width / 4
        let buttoHeight = labelHeight * 1.7
        let savearea: CGFloat = 20
        
        
        // Currency Number Labels
        func setNumberButton(button : UIButton, y : CGFloat , buttonIndicator : String) {
            button.frame = CGRect(x: 8, y: y, width: width - 16, height: labelHeight)
            button.backgroundColor = .clear
            button.contentHorizontalAlignment = .left
            button.titleLabel?.font = UIFont(name: "Menlo", size: height / 15)
            button.layer.cornerRadius = 10
            button.setTitleColor(euroColor, for: .normal)
            button.setTitle(buttonIndicator, for: .normal)
            button.addTarget(self, action: #selector(pressNumber(sender:)), for: .touchUpInside)
            view.addSubview(button)
        }
        
        switch currencyIndicator {
        case "$":
            setNumberButton(button: E500, y: height / 20 , buttonIndicator: "100")
            setNumberButton(button: E200, y: height / 20 + (labelHeight * 1.2), buttonIndicator: "50")
            setNumberButton(button: E100, y: height / 20 + (labelHeight * 1.2) * 2, buttonIndicator: "20")
            setNumberButton(button: E50,  y: height / 20 + (labelHeight * 1.2) * 3, buttonIndicator: "10")
            setNumberButton(button: E20,  y: height / 20 + (labelHeight * 1.2) * 4, buttonIndicator: "5")
            setNumberButton(button: E10,  y: height / 20 + (labelHeight * 1.2) * 5, buttonIndicator: "2")
            setNumberButton(button: E5,   y: height / 20 + (labelHeight * 1.2) * 6, buttonIndicator: "1")
        case "€":
            setNumberButton(button: E500, y: height / 20 , buttonIndicator: "500")
            setNumberButton(button: E200, y: height / 20 + (labelHeight * 1.2), buttonIndicator: "200")
            setNumberButton(button: E100, y: height / 20 + (labelHeight * 1.2) * 2, buttonIndicator: "100")
            setNumberButton(button: E50,  y: height / 20 + (labelHeight * 1.2) * 3, buttonIndicator: "50")
            setNumberButton(button: E20,  y: height / 20 + (labelHeight * 1.2) * 4, buttonIndicator: "20")
            setNumberButton(button: E10,  y: height / 20 + (labelHeight * 1.2) * 5, buttonIndicator: "10")
            setNumberButton(button: E5,   y: height / 20 + (labelHeight * 1.2) * 6, buttonIndicator: "5")
        default:
            print("Currency layout ERROR")
        }

        // Currency amounts
        func setNumberLabel(label : UILabel, y : CGFloat) {
            label.frame = CGRect(x: buttonWith + 16, y: y, width: width - buttonWith - 24, height: labelHeight)
            label.backgroundColor = .clear
            label.textAlignment = .right
            label.font = UIFont(name: "Menlo", size: height / 15)
            label.text = "0"
            label.textColor = numberColor
            label.adjustsFontSizeToFitWidth = true
            label.layer.masksToBounds = true
            label.layer.cornerRadius = 5
            view.addSubview(label)
        }
        
        setNumberLabel(label: l500, y: height / 20)
        setNumberLabel(label: l200, y: height / 20 + (labelHeight * 1.2))
        setNumberLabel(label: l100, y: height / 20 + (labelHeight * 1.2) * 2)
        setNumberLabel(label: l50,  y: height / 20 + (labelHeight * 1.2) * 3)
        setNumberLabel(label: l20,  y: height / 20 + (labelHeight * 1.2) * 4)
        setNumberLabel(label: l10,  y: height / 20 + (labelHeight * 1.2) * 5)
        setNumberLabel(label: l5,   y: height / 20 + (labelHeight * 1.2) * 6)
        
        
        let yVoor€ = (height - buttoHeight * 3.5) - savearea
        
       // Result Label
        currency.frame = CGRect(x: 10 , y: yVoor€, width: width / 9, height: labelHeight * 1.1)
        currency.backgroundColor = detailColor
        currency.titleLabel?.font = UIFont(name: "Times New Roman", size: height / 14)
        currency.setTitle(currencyIndicator, for: .normal)
        currency.setTitleColor(backgroundColor, for: .normal)
        currency.layer.cornerRadius = 10
        currency.addTarget(self, action: #selector(pressCurrencyKey(sender:)), for: .touchUpInside)
        view.addSubview(currency)
        
    
        som.frame = CGRect(x: (width / 9) + 20, y: yVoor€ , width: width - 20, height: labelHeight * 1.1)
        som.backgroundColor = #colorLiteral(red: 1, green: 0.9785718322, blue: 0.9762378335, alpha: 0)
        som.font = UIFont(name: "Times New Roman", size: height / 14)
        som.text = "0"
        som.textColor = detailColor
        som.adjustsFontSizeToFitWidth = true
        view.addSubview(som)
        

        
        // Number Keys
        func makeKey(button: UIButton, label: String, x: CGFloat, y: CGFloat) {
            button.frame = CGRect(x: x, y: y, width: buttonWith, height: buttoHeight)
            button.backgroundColor = .clear
            button.contentHorizontalAlignment = .center
            button.titleLabel?.font = UIFont(name: "Menlo", size: height / 15)
            button.setTitleColor(numberColor, for: .normal)
            button.setTitle(label, for: .normal)
            button.addTarget(self, action: #selector(pressKey(sender:)), for: .touchUpInside)
            view.addSubview(button)
        }
        
        makeKey(button: B0, label: "0", x: buttonWith * 3,  y: height - buttoHeight - savearea + 10)
        makeKey(button: B1, label: "1", x: 0,               y: height - buttoHeight - savearea + 10)
        makeKey(button: B2, label: "2", x: buttonWith,      y: height - buttoHeight - savearea + 10)
        makeKey(button: B3, label: "3", x: buttonWith * 2,  y: height - buttoHeight - savearea + 10)
        makeKey(button: B4, label: "4", x: 0,               y: (height - buttoHeight * 2) - savearea + 20)
        makeKey(button: B5, label: "5", x: buttonWith,      y: (height - buttoHeight * 2) - savearea + 20)
        makeKey(button: B6, label: "6", x: buttonWith * 2,  y: (height - buttoHeight * 2) - savearea + 20)
        makeKey(button: B7, label: "7", x: 0,               y: (height - buttoHeight * 3) - savearea + 30)
        makeKey(button: B8, label: "8", x: buttonWith,      y: (height - buttoHeight * 3) - savearea + 30)
        makeKey(button: B9, label: "9", x: buttonWith * 2,  y: (height - buttoHeight * 3) - savearea + 30)
        
        
        Bis.frame = CGRect(x: (buttonWith * 3) + (buttonWith / 20), y: (height - buttoHeight * 3) - savearea + 35, width: buttonWith - (buttonWith / 10), height: buttoHeight - (buttoHeight / 10))
        Bis.backgroundColor = detailColor
        Bis.contentHorizontalAlignment = .center
        Bis.titleLabel?.font = UIFont(name: "Menlo", size: height / 15)
        Bis.setTitleColor(backgroundColor, for: .normal)
        Bis.setTitle("=", for: .normal)
        Bis.layer.cornerRadius = 10
        Bis.addTarget(self, action: #selector(pressIsKey(sender:)), for: .touchUpInside)
        view.addSubview(Bis)
        
        BC.frame = CGRect(x: buttonWith * 3, y: (height - buttoHeight * 2) - savearea + 20, width: buttonWith, height: buttoHeight)
        BC.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        BC.contentHorizontalAlignment = .center
        BC.titleLabel?.font = UIFont(name: "Times New Roman", size: height / 15)
        BC.setTitleColor(cColor, for: .normal)
        BC.setTitle("C", for: .normal)
        BC.addTarget(self, action: #selector(pressCKey(sender:)), for: .touchUpInside)
        view.addSubview(BC)
        
    }
    
 
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: nil) { _ in
            self.layout()
        }
    }
    
    
    
}

