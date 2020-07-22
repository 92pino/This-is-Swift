//
//  ViewController.swift
//  Network_Practice
//
//  Created by jbjeong on 2020/06/22.
//  Copyright © 2020 정진배. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var handler: ((Result<[UserData], API.APIError>) -> Void)!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        handler = { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let userDatas):
                guard let userData = userDatas.first else { return }
                print(userData)
            case .failure(let error):
                print("Error", error.localizedDescription)
            }
        }
        
        API.shared.get1(completionHandler: handler)
    }


}

