//
//  MemoFormVC.swift
//  MyMemory
//
//  Created by JinBae Jeong on 2020/11/18.
//

import UIKit

class MemoFormVC: UIViewController {
  
  var subject: String!
  
  @IBOutlet var contents: UITextView!
  @IBOutlet var preview: UIImageView!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    contents.delegate = self
  }
  
  @IBAction func save(_ sender: Any) {
    guard contents.text?.isEmpty == false else {
      let alert = UIAlertController(title: nil, message: "내용을 입력해주세요", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
      self.present(alert, animated: true)
      return
    }
    
    let data = MemoData()
    data.title = self.subject
    data.contents = self.contents.text
    data.image = self.preview.image
    data.regdate = Date()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.memoList.append(data)
    
    _ = self.navigationController?.popViewController(animated: true)
  }
  
  @IBAction func pick(_ sender: UIBarButtonItem) {
    let picker = UIImagePickerController()
    picker.delegate = self
    picker.allowsEditing = true
    
    present(picker, animated: false, completion: nil)
  }
  
}

// MARK: - ImagePickerDelegate

extension MemoFormVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    print("\n---------- [ picker ] ----------\n")
    print(picker)
    print(info)
    print("\n---------- [ picker ] ----------\n")
    
    preview.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
    
    picker.dismiss(animated: false)
  }
}

// MARK: - TextViewDelegate

extension MemoFormVC: UITextViewDelegate {
  // 텍스트뷰의 내용이 변경될 때마다 호출되는 델리게이트 메소드
  func textViewDidChange(_ textView: UITextView) {
    print("\n---------- [ textView ] ----------\n")
    print(textView)
    print("\n---------- [ textView ] ----------\n")
    let contents = textView.text as NSString
    let length = ((contents.length > 15) ? 15 : contents.length)
    
    // substring : 문자열에서 원하는 범위만 잘라내고싶을 때 사용, 원본데이터는 그대로 둔 채 해당 범위의 문자열만 복사해서 새로운 문자열 생성
    // NSRange(location: 잘라낼 시작 지점, length: 잘라낼 길이)
    subject = contents.substring(with: NSRange(location: 0, length: length))
    
    navigationItem.title = subject
  }
}
