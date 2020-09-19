//
//  CheckboxLayout.swift
//  vezdecode_podcasts
//
//  Created by Den Matyash on 17.09.2020.
//  Copyright © 2020 Den. All rights reserved.
//

import Foundation
import UIKit

class CheckBoxLayout: UIView {
    
    private let checkBox = CheckBox().apply {
        $0.isChecked = false
    }
    let label = UILabel().apply {
        $0.font = Font.smallTitle
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        buildViewTree()
        setConstraints()
        
        isUserInteractionEnabled = true
        
        checkBox.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }
    
    private func buildViewTree() {
        addSubview(checkBox)
        addSubview(label)
    }
    
    @objc func buttonClicked() {
        checkBox.isChecked = !checkBox.isChecked
    }
    
    private func setConstraints() {
        checkBox.run {
            $0.width(20)
            $0.height(20)
            $0.topToSuperview()
            $0.leadingToSuperview()
            $0.bottomToSuperview()
        }
        
        label.run {
            $0.centerY(to: checkBox)
            $0.leadingToTrailing(of: checkBox, offset: 12)
        }
    }
}
