//
//  AddDontationViewController.swift
//  VKDonations
//
//  Created by Den Matyash on 11.09.2020.
//  Copyright © 2020 Den. All rights reserved.
//

import UIKit

class AddPostViewController: ClosableUIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let stackView = UIStackView().apply {
        $0.axis = .vertical
        $0.spacing = 26
        $0.alignment = .center
        $0.distribution = .equalSpacing
    }
    
    private let postCover = PostCover().apply {
        $0.isUserInteractionEnabled = true
    }
    
    private let descriptionInput = TextInputLayout(explanation: "Чем вы хотите поделиться", placeholder: "Чем вы хотите поделиться")
    
    private let uploadTitle = UILabel().apply {
        $0.text = "Загрузите картинку"
        $0.font = Font.title
        $0.textAlignment = .center
    }
    
    private let uploadExplanation = BodyLabel().apply {
        $0.text = "Выберите готовую картинку из вашего телефона и добавьте ее"
        $0.textAlignment = .center
        $0.textColor = Palette.gray
    }
    
    private let emotionButton = CommonButton().apply {
        $0.mode = .bordered
        $0.setTitle("Выберите настроение", for: .normal)
    }
    
    private let horizontalLine = UIView().apply {
        $0.backgroundColor = UIColor(red: 0.843, green: 0.847, blue: 0.851, alpha: 1)
    }
    
    private let actionButton = BottomButton().apply {
        $0.setTitle("Добавить пост", for: .normal)
    }
    
    private let imagePicker = UIImagePickerController()
    
    private let pickerView = UIPickerView()
    private let pickerAdapter = PickerViewAdapter()
    private let sortTextField = UITextField().apply {
        $0.font = Font.header
        $0.textColor = Palette.primary
        $0.tintColor = .clear
        $0.textAlignment = .center
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        title = "Матвей"
        
        buildViewTree()
        setConstraints()
        
        postCover.onClick = {
            self.pickImage()
        }
        
        actionButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        setupPickerView()
    }
    
    private func setupPickerView() {
        pickerAdapter.run {
            $0.optionSelected = { position in
                self.sortTextField.text = self.pickerAdapter.options[position]
            }
            $0.options = ["Веселый", "Грустный", "Злой"]
        }
        pickerView.run {
            $0.backgroundColor = Palette.white
            $0.delegate = pickerAdapter
            $0.selectRow(0, inComponent: 0, animated: false)
        }
        
        let doneButton = UIBarButtonItem(
            title: "Done".localized,
            style: .plain,
            target: self,
            action: #selector(doneTapped)
        )
        
        let toolbar = UIToolbar().apply {
            $0.sizeToFit()
            $0.setItems([doneButton], animated: false)
            $0.isUserInteractionEnabled = true
            $0.barTintColor = Palette.white
            $0.tintColor = Palette.primary
        }
        
        sortTextField.run {
            $0.inputView = pickerView
            $0.inputAccessoryView = toolbar
            $0.placeholder = "Выбeрите эмоцию"
        }
    }
    
    @objc func doneTapped() {
        sortTextField.resignFirstResponder()
    }
    
    private func buildViewTree() {
        [scrollView].forEach(view.addSubview)
        
        scrollView.addSubview(contentView)
        
        [postCover, descriptionInput, uploadTitle, uploadExplanation, horizontalLine, actionButton, sortTextField].forEach(contentView.addSubview)
        
        //[].forEach(stackView.addArrangedSubview)
    }
    
    private func setConstraints() {
        scrollView.edgesToSuperview()
        
        contentView.run {
            $0.edgesToSuperview()
            $0.width(to: scrollView)
            $0.height(to: scrollView, priority: .defaultLow)
        }
        
        descriptionInput.run {
            $0.topToSuperview(offset: 12)
            $0.horizontalToSuperview(insets: .horizontal(12))
        }
        
        uploadTitle.run {
            $0.topToBottom(of: descriptionInput, offset: 44)
            $0.horizontalToSuperview(insets: .horizontal(32))
        }
        
        uploadExplanation.run {
            $0.topToBottom(of: uploadTitle, offset: 8)
            $0.horizontalToSuperview(insets: .horizontal(32))
        }
        
        postCover.run {
            $0.topToBottom(of: uploadExplanation, offset: 20)
            $0.horizontalToSuperview(insets: .horizontal(12))
            $0.height(140)
        }
        
        horizontalLine.run {
            $0.topToBottom(of: postCover, offset: 28)
            $0.height(0.5)
            $0.horizontalToSuperview(insets: .horizontal(12))
        }
        
        sortTextField.run {
            $0.topToBottom(of: horizontalLine, offset: 36)
            $0.height(30)
            $0.horizontalToSuperview(insets: .horizontal(12))
        }
        
        actionButton.run {
            $0.topToBottom(of: sortTextField, offset: 12)
            $0.horizontalToSuperview(insets: .horizontal(12))
        }
    }
    
    private func pickImage() {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            imagePicker.run {
                $0.delegate = self
                $0.sourceType = .photoLibrary
                $0.allowsEditing = true
            }

            present(imagePicker, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        guard let image = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        postCover.setPhoto(image)
    }
    
    @objc func buttonTapped() {
        addDontation()
    }
    
    private func addDontation() {
        
    }
}

class PickerViewAdapter: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var options: [String] = []
    var optionSelected: ((Int) -> ())?
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        return UILabel().apply {
            $0.text = options[row]
            $0.textColor = Palette.primary
            $0.textAlignment = .center
            $0.font = Font.header
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        optionSelected?(row)
    }
}
