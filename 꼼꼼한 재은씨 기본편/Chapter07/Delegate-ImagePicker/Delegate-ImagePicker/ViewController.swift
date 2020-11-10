//
//  ViewController.swift
//  Delegate-ImagePicker
//
//  Created by JinBae Jeong on 2020/11/10.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var imgView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func pick(_ sender: UIButton) {
    let picker = UIImagePickerController()
    picker.sourceType = .photoLibrary
    picker.allowsEditing = true
    
    picker.delegate = self
    
    self.present(picker, animated: true)
  }
  
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  // 이미지피커에서 이미지를 선택하지 않고 취소했을 떄 호출되는 메서드
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: false) {
      let alert = UIAlertController(title: "", message: "이미지 선택이 취소되었습니다", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "확인", style: .cancel))
      self.present(alert, animated: true)
    }
  }
  
  // 이미지 피커에서 이미지를 선택했을 때 호출되는 메서드
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    // 클로저를 사용하여 imagePicker가 완전히 닫힌 후 나머지 로직이 동작
    picker.dismiss(animated: true) {
      print(info)
      let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
      self.imgView.image = img
    }
  }
}
