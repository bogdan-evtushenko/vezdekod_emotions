//
//  CheckBox.swift
//  vezdecode_podcasts
//
//  Created by Den Matyash on 17.09.2020.
//  Copyright © 2020 Den. All rights reserved.
//

import Foundation
import UIKit

class CheckBox: UIButton {
    // Images
    private let checkedImage = UIImage(named: "ic_checkbox_checked")!
    private let uncheckedImage = UIImage(named: "ic_checkbox_unchecked")!
    
    // Bool property
    var isChecked: Bool = false {
        didSet {
            if isChecked == true {
                self.setImage(checkedImage, for: .normal)
            } else {
                self.setImage(uncheckedImage, for: .normal)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //width(20)
        //height(20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
