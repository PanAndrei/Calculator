//
//  ButtonClass.swift
//  Calculator
//
//  Created by Andrei Panasenko on 23.03.2022.
//

import Foundation
import UIKit

class Button: UIButton {

    init(titleText: String, colorBack: UIColor, height: CGFloat) {
        super.init(frame: .zero)
        setTitle(titleText, for: .normal)
        setTitleColor(.black, for: .normal)
        titleLabel?.font = .systemFont(ofSize: height / 3)
        backgroundColor = colorBack
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: height)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
