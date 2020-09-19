//
//  TextInputLayout.swift
//  SpeakKriolu
//
//  Created by Den Matyash on 29.07.2020.
//  Copyright © 2020 xorum.io. All rights reserved.
//

import Foundation
import UIKit

class TextInputLayout: UIView {
    
    private let explanationLabel = HintLabel()
    let textField = CommonTextField()
    
    enum TypeOfField {
        case email
        case password
        case text
    }
    
    init(explanation: String, placeholder: String, type: TypeOfField = .text) {
        explanationLabel.text = explanation
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.506, green: 0.549, blue: 0.6, alpha: 1)]
        )
        
        switch(type) {
        case .email:
            textField.keyboardType = .emailAddress
        case .password:
            textField.isSecureTextEntry = true
        default:
            break
        }
        
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        buildViewTree()
        setConstraints()
    }
    
    private func buildViewTree() {
        [explanationLabel, textField].forEach(addSubview)
    }
    
    private func setConstraints() {
        explanationLabel.edgesToSuperview(excluding: .bottom)
        
        textField.run {
            $0.topToBottom(of: explanationLabel, offset: 8)
            $0.edgesToSuperview(excluding: .top)
        }
    }
}
