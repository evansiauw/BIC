//
//  authViewController.swift
//  BIC
//
//  Created by Iwan Siauw on 10/26/19.
//  Copyright © 2019 Iwan Siauw. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import PhoneNumberKit
import FirebaseAuth

class authViewController: UIViewController{
    
//    lazy var phoneKit = PhoneNumberKit()
        
    lazy var dismissButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "cancelButton"), for: .normal)
        button.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var segmentedControl: UISegmentedControl = {
        
        let items = ["Sign In", "Sign Up"]
        let segment = UISegmentedControl(items: items)
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(indexChanged), for: .valueChanged)
        segment.translatesAutoresizingMaskIntoConstraints = false
        return segment
    }()
    
    lazy var phoneTextField: PhoneNumberTextField = {
                
        let textField = PhoneNumberTextField(frame: .zero)
        textField.withFlag = true
        textField.withPrefix = true
        textField.withExamplePlaceholder = true
//        textField.attributedPlaceholder = NSAttributedString(string: "+1 555-555-5555")
        
        return textField
    }()
    
    lazy var firstNameTextField: SkyFloatingLabelTextField = {
        
        let textField = SkyFloatingLabelTextFieldWithIcon(frame: .zero, iconType: .image)
        let overcastBlueColor = UIColor(red: 0, green: 187/255, blue: 204/255, alpha: 1.0)
        textField.placeholder = "  First Name"
        textField.title = "First"
        textField.iconImage = UIImage(named: "account")
        textField.tintColor = overcastBlueColor
        textField.selectedTitleColor = overcastBlueColor
        textField.selectedLineColor = overcastBlueColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        
       return textField
    }()
    
    lazy var lastNameTextField: SkyFloatingLabelTextField = {
        
        let textField = SkyFloatingLabelTextField(frame: .zero)
        let overcastBlueColor = UIColor(red: 0, green: 187/255, blue: 204/255, alpha: 1.0)
        textField.placeholder = "Last Name"
        textField.title = "Last"
        textField.tintColor = overcastBlueColor
        textField.selectedTitleColor = overcastBlueColor
        textField.selectedLineColor = overcastBlueColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        
       return textField
    }()
    
    lazy var passTextField: SkyFloatingLabelTextField = {
        
        let textField = SkyFloatingLabelTextFieldWithIcon(frame: .zero, iconType: .image)
        let overcastBlueColor = UIColor(red: 0, green: 187/255, blue: 204/255, alpha: 1.0)
        textField.placeholder = "  Enter Password"
        textField.title = "Password"
        textField.iconImage = UIImage(named: "password")
        textField.tintColor = overcastBlueColor
        textField.selectedTitleColor = overcastBlueColor
        textField.selectedLineColor = overcastBlueColor
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var reEnterPassTextField: SkyFloatingLabelTextField = {
        
        let textField = SkyFloatingLabelTextFieldWithIcon(frame: .zero, iconType: .image)
        let overcastBlueColor = UIColor(red: 0, green: 187/255, blue: 204/255, alpha: 1.0)
        textField.placeholder = "  Re-enter Password"
        textField.title = "Re-Enter Password"
        textField.iconImage = UIImage(named: "password")
        textField.tintColor = overcastBlueColor
        textField.selectedTitleColor = overcastBlueColor
        textField.selectedLineColor = overcastBlueColor
        textField.isHidden = true
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var submitButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Submit", for: .normal)
        button.addTarget(self, action: #selector(submitPressed), for: .touchUpInside)
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.roundAllButtonCorners()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var nameStack: UIStackView = {
        
        let stack = UIStackView(arrangedSubviews: [firstNameTextField, lastNameTextField])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.isHidden = true
        return stack
    }()
    
    lazy var textFieldStack: UIStackView = {
        
        let stack = UIStackView(arrangedSubviews: [phoneTextField, nameStack, passTextField, reEnterPassTextField])
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fill
        return stack
    }()
    
    lazy var cellStack: UIStackView = {
         
        let stack = UIStackView(arrangedSubviews: [segmentedControl, textFieldStack, submitButton])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 30
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.addSubview(dismissButton)
        view.addSubview(cellStack)
        
        NSLayoutConstraint.activate([
            
            dismissButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            dismissButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            dismissButton.heightAnchor.constraint(equalToConstant: 25),
            dismissButton.widthAnchor.constraint(equalToConstant: 25),
            
            cellStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            cellStack.topAnchor.constraint(equalTo: dismissButton.bottomAnchor, constant: 30),
            cellStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            segmentedControl.heightAnchor.constraint(equalToConstant: 30),
            passTextField.heightAnchor.constraint(equalToConstant: 45),
            reEnterPassTextField.heightAnchor.constraint(equalToConstant: 45),
            submitButton.heightAnchor.constraint(equalToConstant: 50)
        
        ])
        
        
    }
    
    @objc func submitPressed(){
        
        let phoneKit = PhoneNumberKit()
        let number = try? phoneKit.parse(phoneTextField.text!)
//        print(number!.countryCode)
//        print(number?.regionID)
//        print(number!.numberString)
//        print(number?.numberExtension)
//        print(number?.nationalNumber)
//        print(number?.adjustedNationalNumber())
        
        phoneTesting()
        
        if segmentedControl.selectedSegmentIndex == 0 {
            

//            print(try? phoneKit.parse(phoneTextField.text!))
            // phone # valid? pass textfield is not empty -- display alert or turn the color red
            // check if the user is already exist in the system using the same phone number
            // if okay, sign user in
        } else {
            // sign user up
            // check if phone number is valid or password less than 6 or pass & re-pass are equal
            // if okay, sign user up
        }
        
    }
    
    @objc func indexChanged(_ sender: UISegmentedControl){
        
        switch sender.selectedSegmentIndex{
        case 0:
            reEnterPassTextField.isHidden = true
            nameStack.isHidden = true
        case 1:
            reEnterPassTextField.isHidden = false
            nameStack.isHidden = false
        default:
            break
        }
    }
    
    @objc func dismissView(){
        print("view dismissed")
        self.dismiss(animated: true, completion: nil)
    }
    
    func phoneTesting(){
        
        let phoneNumber = "+11115552222"

        // This test verification code is specified for the given test phone number in the developer console.
        let testVerificationCode = "987654"

        Auth.auth().settings?.isAppVerificationDisabledForTesting = true
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate:nil) { verificationID, error in
            
            if let err = error {
              print("Error verifying phone number with message \(err)")
              return
            }
            
            let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID ?? "",
                                                                       verificationCode: testVerificationCode)
            
            Auth.auth().signIn(with: credential, completion: { AuthData, error in
                
                if let err = error {
                    print("Failed to sign in with message \(err)")
                }
                
                print(AuthData)
                
            })
    
        }
    }
}

