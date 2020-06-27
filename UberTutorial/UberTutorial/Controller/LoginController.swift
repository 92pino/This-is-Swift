//
//  LoginController.swift
//  UberTutorial
//
//  Created by JinBae Jeong on 2020/06/27.
//  Copyright © 2020 pino. All rights reserved.
//

import UIKit
import Firebase
import SnapKit

class LoginController: UIViewController {
  
  // Mark: - Properties
  
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
  
  private let loginButton: AuthButton = {
    let button = AuthButton(type: .system)
    button.setTitle("Log In", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
    
    return button
  }()
  
  let dontHaveAccountButton: UIButton = {
    let button = UIButton(type: .system)
    let attributedTitle = NSMutableAttributedString(string: "Don't have an account?  ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
    
    attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.mainBlueTint]))
    
    button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
    
    button.setAttributedTitle(attributedTitle, for: .normal)
    return button
  }()
  
  // Mark: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationController?.navigationBar.isHidden = true
    
    configureUI()
  }
  
  // Mark: - Selectors
  @objc func handleLogin(_ sender: UIButton) {
    guard let email = emailTextField.text else { return }
    guard let password = passwordTextField.text else { return }
    
    Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
      if let error = error {
        print("Failed to register user with error \(error.localizedDescription)")
        return
      }
      
      let keyWindow = UIApplication.shared.connectedScenes
        .filter({$0.activationState == .foregroundActive})
        .map({ $0 as? UIWindowScene})
        .compactMap({$0})
        .first?.windows
        .filter({$0.isKeyWindow}).first
      
      guard let controller = keyWindow?.rootViewController as? HomeController else { return }
      controller.configureUI()
      self.dismiss(animated: true, completion: nil)
    }
  }
  
  @objc func handleShowSignUp(_ sender: UIButton) {
    let controller = SignUpController()
    navigationController?.pushViewController(controller, animated: true)
  }
  
  // MARK: - Helper Functions
  func configureUI() {
    configureNavigationBar()
    
    view.backgroundColor = .backgroundColor
    
    view.addSubview(titleLabel)
    titleLabel.snp.makeConstraints {
      $0.centerX.equalTo(view.snp.centerX)
      $0.top.equalTo(view.snp.top)
    }
    
    let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, loginButton])
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
  
  func configureNavigationBar() {
    navigationController?.navigationBar.barStyle = .black
  }
}
