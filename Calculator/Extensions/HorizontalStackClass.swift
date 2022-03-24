//
//  HorizontalStackClass.swift
//  Calculator
//
//  Created by Andrei Panasenko on 23.03.2022.
//

import Foundation
import UIKit

class HorizontalStack: UIStackView {
    init() {
        super.init(frame: .zero)
        axis = .horizontal
        alignment = UIStackView.Alignment.center
        distribution = .fillEqually
        spacing = 2
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
