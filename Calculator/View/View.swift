//
//  View.swift
//  Calculator
//
//  Created by Andrei Panasenko on 26.03.2022.
//

import UIKit



class SubView: UIView {
    
    var height: CGFloat
    
    var buttonsNumbers = [UIButton]()
    var calcButtons = [UIButton]()
    
    private lazy var button0: Button = {
        let b = Button(titleText: "0", colorBack: .blue, height: height / 6)
        return b
    }()
    
    private lazy var buttonDot: Button = {
        let b = Button(titleText: ".", colorBack: .blue, height: height / 6)
        return b
    }()
    
    private lazy var buttonEql: Button = {
        let b = Button(titleText: "=", colorBack: .orange, height: height / 6)
        return b
    }()
    
    private lazy var button1: Button = {
        let b = Button(titleText: "1", colorBack: .blue, height: height / 6)
        return b
    }()
    
    private lazy var button2: Button = {
        let b = Button(titleText: "2", colorBack: .blue, height: height / 6)
        return b
    }()
    
    private lazy var button3: Button = {
        let b = Button(titleText: "3", colorBack: .blue, height: height / 6)
        return b
    }()
    
    private lazy var buttonPlus: Button = {
        let b = Button(titleText: "+", colorBack: .orange, height: height / 6)
        return b
    }()
    
    private lazy var button4: Button = {
        let b = Button(titleText: "4", colorBack: .blue, height: height / 6)
        return b
    }()
    
    private lazy var button5: Button = {
        let b = Button(titleText: "5", colorBack: .blue, height: height / 6)
        return b
    }()
    
    private lazy var button6: Button = {
        let b = Button(titleText: "6", colorBack: .blue, height: height / 6)
        return b
    }()
    
    private lazy var buttonMinus: Button = {
        let b = Button(titleText: "-", colorBack: .orange, height: height / 6)
        return b
    }()
    
    private lazy var button7: Button = {
        let b = Button(titleText: "7", colorBack: .blue, height: height / 6)
        return b
    }()
    
    private lazy var button8: Button = {
        let b = Button(titleText: "8", colorBack: .blue, height: height / 6)
        return b
    }()
    
    private lazy var button9: Button = {
        let b = Button(titleText: "9", colorBack: .blue, height: height / 6)
        return b
    }()
    
    private lazy var buttonMult: Button = {
        let b = Button(titleText: "x", colorBack: .orange, height: height / 6)
        return b
    }()
    
    private lazy var buttonPerc: Button = {
        let b = Button(titleText: "%", colorBack: .gray, height: height / 6)
        return b
    }()
    
    private lazy var buttonChange: Button = {
        let b = Button(titleText: "+/-", colorBack: .gray, height: height / 6)
        return b
    }()
    
    private lazy var buttonReset: Button = {
        let b = Button(titleText: "AC", colorBack: .gray, height: height / 6)
        return b
    }()
    
    private lazy var buttonDivis: Button = {
        let b = Button(titleText: "/", colorBack: .orange, height: height / 6)
        return b
    }()
    
    lazy var textField: UITextField = {
        let t = UITextField()
        t.text = "0"
        t.textColor = .white
        t.font = .systemFont(ofSize: height / 18)
        t.textAlignment = .right
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    
    private lazy var viewField: UIView = {
        let v = UIView()
        v.addSubview(textField)
        v.backgroundColor = .black
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    // MARK: - stacks
    
    private lazy var stack00: HorizontalStack = {
        let s = HorizontalStack()
        s.addArrangedSubview(buttonDot)
        s.addArrangedSubview(buttonEql)
        return s
    }()
    
    private lazy var stack0: HorizontalStack = {
        let s = HorizontalStack()
        s.addArrangedSubview(button0)
        s.addArrangedSubview(stack00)
        return s
    }()
    
    private lazy var stack1: HorizontalStack = {
        let s = HorizontalStack()
        s.addArrangedSubview(button1)
        s.addArrangedSubview(button2)
        s.addArrangedSubview(button3)
        s.addArrangedSubview(buttonPlus)
        return s
    }()
    
    private lazy var stack2: HorizontalStack = {
        let s = HorizontalStack()
        s.addArrangedSubview(button4)
        s.addArrangedSubview(button5)
        s.addArrangedSubview(button6)
        s.addArrangedSubview(buttonMinus)
        return s
    }()
    
    private lazy var stack3: HorizontalStack = {
        let s = HorizontalStack()
        s.addArrangedSubview(button7)
        s.addArrangedSubview(button8)
        s.addArrangedSubview(button9)
        s.addArrangedSubview(buttonMult)
        return s
    }()
    
    private lazy var stack4: HorizontalStack = {
        let s = HorizontalStack()
        s.addArrangedSubview(buttonReset)
        s.addArrangedSubview(buttonChange)
        s.addArrangedSubview(buttonPerc)
        s.addArrangedSubview(buttonDivis)
        return s
    }()
    
    // MARK: - main stack
    
    private lazy var mainStack: UIStackView = {
        let s = UIStackView(arrangedSubviews: [viewField, stack4, stack3, stack2, stack1, stack0])
        s.axis = .vertical
        s.distribution = .fillEqually
        s.spacing = 2
        s.translatesAutoresizingMaskIntoConstraints = false
        return s
    }()
    
    init(height: CGFloat) {
        self.height = height
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false

        addNumericButtons()
        addCalcButtons()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(mainStack)
        
        setConstraints()
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            mainStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2),
            mainStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
            mainStack.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            mainStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2)
        ])

        NSLayoutConstraint.activate([
            viewField.heightAnchor.constraint(equalToConstant: height / 6),
            viewField.trailingAnchor.constraint(equalTo: trailingAnchor),
            viewField.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])

        NSLayoutConstraint.activate([
            textField.trailingAnchor.constraint(equalTo: viewField.trailingAnchor, constant: -8),
            textField.centerYAnchor.constraint(equalTo: viewField.centerYAnchor),
            textField.leadingAnchor.constraint(equalTo: viewField.leadingAnchor, constant: 8)
        ])
    }
    
    func addNumericButtons() {
        buttonsNumbers.append(button0)
        buttonsNumbers.append(buttonDot)
        buttonsNumbers.append(button1)
        buttonsNumbers.append(button2)
        buttonsNumbers.append(button3)
        buttonsNumbers.append(button4)
        buttonsNumbers.append(button5)
        buttonsNumbers.append(button6)
        buttonsNumbers.append(button7)
        buttonsNumbers.append(button8)
        buttonsNumbers.append(button9)
    }
    
    func addCalcButtons() {
        calcButtons.append(buttonEql)
        calcButtons.append(buttonPlus)
        calcButtons.append(buttonMinus)
        calcButtons.append(buttonMult)
        calcButtons.append(buttonPerc)
        calcButtons.append(buttonChange)
        calcButtons.append(buttonReset)
        calcButtons.append(buttonDivis)
    }
}
