//
//  ViewController.swift
//  Calculator
//
//  Created by Andrei Panasenko on 23.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private var height: CGFloat = 0
    private var width: CGFloat = 0
    private var isFinishedTypingNumber = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(subView.textField.text!) else {
                fatalError("cannot convert label text to a Double")
            }
            return number
        }
        set {
            subView.textField.text = String(newValue)
        }
    }
    
    private lazy var subView: SubView = {
        let sb = SubView(height: height)
        sb.buttonsNumbers.forEach { button in
            button.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        }
        sb.calcButtons.forEach { button in
            button.addTarget(self, action: #selector(calcPressed(_:)), for: .touchUpInside)
        }
        return sb
    }()
    
    private var calculator = LogicModel()
    
    override func loadView() {
        super.loadView()
        
        height = setViewDimensions().0
        width = setViewDimensions().1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        view.addSubview(subView)
        setConstraints()
    }
    
    // MARK: - button methods
    
    @objc func numberPressed(_ sender: UIButton) {
        if let newValue = sender.currentTitle {
            if isFinishedTypingNumber {
                subView.textField.text = newValue
                isFinishedTypingNumber = false
            } else {
                if newValue == "." {
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                subView.textField.text = subView.textField.text! + newValue
            }
        }
    }
    
    @objc func calcPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue =  result
            }
        }
    }
    
    // MARK: - settings
    
    func setViewDimensions() -> (CGFloat, CGFloat) {
        return (view.bounds.height, view.bounds.width)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            subView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            subView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            subView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            subView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}


