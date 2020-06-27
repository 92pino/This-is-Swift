//
//  SignUpController.swift
//  UberTutorial
//
//  Created by JinBae Jeong on 2020/06/27.
//  Copyright © 2020 pino. All rights reserved.
//

import UIKit
import Firebase
import GeoFire

class SignUpController: UIViewController {

  // Mark: - Properties
  
  private var location = LocationHandler.shared.locationManager.location
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "UBER"
    label.font = UIFont(name: "Avenir-Light", size: 36)
    label.textColor = UIColor(white: 1, alpha: 0.8)
    
    return label
  }()
  
  private lazy var emailContainerView: UIView = {
    let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_mail_outline_white_2x"), textField: emailTextField)
    view.snp.makeConstraints {
      $0.height.equalTo(50)
    }
    
    return view
  }()
  
  private let emailTextField: UITextField = {
    return UITextField().textField(withPlaceholder: "Email", isSecureTextEntry: false)
  }()
  
  private lazy var fullnameContainerView: UIView = {
    let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_person_outline_white_2x"), textField: fullnameTextField)
    view.snp.makeConstraints {
      $0.height.equalTo(50)
    }
    
    return view
  }()
  
  private let fullnameTextField: UITextField = {
    return UITextField().textField(withPlaceholder: "Fullname", isSecureTextEntry: false)
  }()
  
  private lazy var passwordContainerView: UIView = {
    let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: passwordTextField)
    view.snp.makeConstraints {
      $0.height.equalTo(50)
    }
    
    return view
  }()
  
  private let passwordTextField: UITextField = {
    return UITextField().textField(withPlaceholder: "Password", isSecureTextEntry: true)
  }()
  
  private lazy var accountTypeContainerView: UIView = {
    let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_account_box_white_2x"), segmentedControl: accountTypeSegmentedControl)
    view.snp.makeConstraints {
      $0.height.equalTo(50)
    }
    
    return view
  }()
  
  private let accountTypeSegmentedControl: UISegmentedControl = {
    let sc = UISegmentedControl(items: ["Rider", "Driver"])
    sc.backgroundColor = .backgroundColor
    sc.tintColor = UIColor(white: 1, alpha: 0.87)
    sc.selectedSegmentIndex = 0
    
    return sc
  }()
  
  private let signUpButton: UIButton = {
    let button = AuthButton(type: .system)
    button.setTitle("Sign Up", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
    
    return button
  }()
  
  let dontHaveAccountButton: UIButton = {
    let button = UIButton(type: .system)
    let attributedTitle = NSMutableAttributedString(string: "Already have an acccount?  ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
    
    attributedTitle.append(NSAttributedString(string: "Log In", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.mainBlueTint]))
    
    button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
    
    button.setAttributedTitle(attributedTitle, for: .normal)
    return button
  }()
  
  // Mark: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .backgroundColor
    navigationController?.navigationBar.isHidden = true
    
    configureUI()
    
    print("DEBUG: Location is \(location)")
  }
  
  // MARK: - Helper Functions
  
  func uploadUserDataAndShowHomeController(uid: String, values: [String: Any]) {
    REF_USERS.child(uid).updateChildValues(values) { (error, ref) in
      let keyWindow = UIApplication.shared.connectedScenes
        .filter({$0.activationState == .foregroundActive})
        .map({ $0 as? UIWindowScene})
        .compactMap({$0})
        .first?.windows
        .filter({$0.isKeyWindow}).first
      
      guard let controller = keyWindow?.rootViewController as? HomeController else { return }
      controller.configure()
      self.dismiss(animated: true, completion: nil)
    }
  }
  
  func configureUI() {
    
    view.backgroundColor = .backgroundColor
    
    view.addSubview(titleLabel)
    titleLabel.snp.makeConstraints {
      $0.centerX.equalTo(view.snp.centerX)
      $0.top.equalTo(view.snp.top)
    }
    
    let stack = UIStackView(arrangedSubviews: [emailContainerView, fullnameContainerView,
                                               passwordContainerView, accountTypeContainerView,
                                               signUpButton])
    stack.axis = .vertical
    stack.distribution = .fillEqually
    stack.spacing = 16
    
    [stack, dontHaveAccountButton].forEach { view.addSubview($0) }
    
    stack.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(40)
      $0.left.equalTo(view.snp.left).offset(16)
      $0.right.equalTo(view.snp.right).offset(-16)
    }
    
    dontHaveAccountButton.snp.makeConstraints {
      $0.centerX.equalTo(view.snp.centerX)
      $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
      $0.height.equalTo(32)
    }
  }
  
  // Mark: - Selectors
  @objc func handleShowLogin(_ sender: UIButton) {
    navigationController?.popViewController(animated: true)
  }
  
  @objc func handleSignUp(_ sender: UIButton) {
    guard let email = emailTextField.text else { return }
    guard let fullname = fullnameTextField.text else { return }
    guard let password = passwordTextField.text else { return }
    let accountTypeIndex = accountTypeSegmentedControl.selectedSegmentIndex
    
    Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
      if let error = error {
        print("Failed to register user with error \(error.localizedDescription)")
        return
      }
      
      guard let uid = result?.user.uid else { return }
      
      let values = ["email": email, "fullname": fullname, "accountType": accountTypeIndex] as [String : Any]
      
      if accountTypeIndex == 1 {
        let geofire = GeoFire(firebaseRef: REF_DRIVER_LOCATIONS)
        guard let location = self.location else { return }
        
        geofire.setLocation(location, forKey: uid) { error in
          self.uploadUserDataAndShowHomeController(uid: uid, values: values)
        }
      }
      
      self.uploadUserDataAndShowHomeController(uid: uid, values: values)
    }
  }
  
}
