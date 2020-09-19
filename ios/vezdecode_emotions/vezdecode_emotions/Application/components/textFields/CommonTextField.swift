//
//  CommonTextField.swift
//  SpeakKriolu
//
//  Created by Den Matyash on 27.07.2020.
//  Copyright © 2020 xorum.io. All rights reserved.
//

import Foundation
import UIKit

class CommonTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    private func setupView() {
        font = Font.body
        borderStyle = .none
        textColor = UIColor(red: 0.506, green: 0.549, blue: 0.6, alpha: 1)
        autocorrectionType = .no
        spellCheckingType = .no
        
        layer.run {
            $0.cornerRadius = 10
            $0.borderWidth = 0.5
            $0.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.12).cgColor
            $0.backgroundColor = UIColor(red: 0.949, green: 0.953, blue: 0.961, alpha: 1).cgColor
        }
        
        height(44)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CommonTextField {
    var padding: UIEdgeInsets {
        return UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
    }

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
