//
//  SignUpController.swift
//  UberTutorial
//
//  Created by JinBae Jeong on 2020/06/20.
//  Copyright © 2020 pino. All rights reserved.
//

import UIKit
import SnapKit

class SignUpController: UIViewController {
  
  // MARK: - Properties
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
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
    return UITextField().textField(withPlaceholder: "Full Name", isSecureTextEntry: false)
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
  
  private let accountTypeTextField: UITextField = {
    return UITextField().textField(withPlaceholder: "Password", isSecureTextEntry: true)
  }()
  
  private let accountTypeSegmentedControl: UISegmentedControl = {
    let sc = UISegmentedControl(items: ["Rider", "Driver"])
    sc.backgroundColor = .backgroundColor
    sc.tintColor = .init(white: 1, alpha: 0.87)
    sc.selectedSegmentIndex = 0
    
    return sc
  }()
  
  private let loginButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Log In", for: .normal)
    button.setTitleColor(UIColor(white: 1, alpha: 0.5), for: .normal)
    button.backgroundColor = .mainBlueTint
    button.layer.cornerRadius = 5
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    button.snp.makeConstraints {
      $0.height.equalTo(50)
    }
    
    return button
  }()
  
  let dontHaveAccountButton: UIButton = {
    let button = UIButton(type: .system)
    
    let attributedtitle = NSMutableAttributedString(string: "Don't have an account?  ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.lightGray
    ])
    
    attributedtitle.append(NSAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.mainBlueTint]))
    button.setAttributedTitle(attributedtitle, for: .normal)
    
    button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
    
    return button
  }()
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureUI()
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  // MARK: - Helper Functions
  // MARK: - Helper Functions
  func configureUI() {
    configureNavigationBar()
    view.backgroundColor = .backgroundColor
    
    let stack = UIStackView(arrangedSubviews: [emailContainerView, fullnameContainerView, passwordContainerView, accountTypeContainerView, loginButton])
    stack.axis = .vertical
    stack.distribution = .fillEqually
    stack.spacing = 24
    
    [titleLabel, stack, dontHaveAccountButton].forEach { view.addSubview($0) }
    
    let guide = view.safeAreaLayoutGuide
    
    titleLabel.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalTo(guide.snp.top)
    }
    
    stack.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(40)
      $0.left.equalToSuperview().offset(16)
      $0.right.equalToSuperview().offset(-16)
    }
    
    dontHaveAccountButton.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.bottom.equalTo(guide.snp.bottom)
      $0.height.equalTo(32)
    }
  }
  
  func configureNavigationBar() {
    navigationController?.navigationBar.barStyle = .black
  }
  
  // MARK: - Selectors
  @objc func handleShowSignUp(_ sender: UIButton) {
    let controller = SignUpController()
    navigationController?.pushViewController(controller, animated: true)
  }
}
