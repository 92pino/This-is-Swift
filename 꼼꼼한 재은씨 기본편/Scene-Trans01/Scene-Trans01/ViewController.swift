//
//  ViewController.swift
//  Scene-Trans01
//
//  Created by JinBae Jeong on 2020/11/04.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  // 전처리 기능
  // 세그웨이가 실행되기 전에 필요한 처리를 해주는 역할
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    print(segue.identifier, segue.destination, segue.source)
    NSLog("세그웨이가 곧 실행됩니다.")
  }


  @IBAction func moveNext(_ sender: UIButton) {
        
    // 스토리보드가 여러개 존재할 경우 원하는 스토리보드를 가져오는 구문
    /*
     
     UIStoryboard(name: "Main", bundle: Bundle.main)
     
     name : **.storyboard (확장자는 생략) ==> "Main"은 Main.storyboard 의미
     bundle : 스토리보드 파일을 읽어들일 위치
     
     */
    // let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    // 이동할 뷰 컨트롤러 객체를 StoryboardID 정보를 이용하여 참조
    // instantiateViewController : 인자값으로 입력받은 StoryboardId값을 이용하여 스토리보드에서 뷰 컨트롤러를 찾고
    // 연결된 클래스를 읽어와 뷰 컨트롤러에 대한 인스턴스를 생성한다.
    // let uvc = storyboard.instantiateViewController(withIdentifier: "SecondVC")
    // 화면 전환할 때의 애니메이션 타입
    /*
     
     UIModalTransitionStyle은 enum으로 4개의 기본 전환 스타일 제공
     1. coverVertical : 아래에서 위쪽으로 새로운 화면이 올라오면서 전환되는 효과 (default)
     2. crossDissolve : 두 화면이 서로 교차하면서 전 화면이 사라지고 다음 화면이 뚜렷하게 나타나는 전환 효과
     3. flipHorizontal : 화면 중앙 가상의 축을 기준으로 화면이 돌아가는 효과를 주면서 전환
     4. partialCurl : 화면이 말려 올라가는 효과를 주며 전환 (상위 뷰컨트롤러가 전체 화면보기를 표시하고 UIModalPresentationStyle.fullScreen을 사용해야 사용 가능하다)
     
     */
    // uvc.modalTransitionStyle = UIModalTransitionStyle.partialCurl
    
    // self.present(uvc, animated: true)
    
    
    guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else { return }
    uvc.modalTransitionStyle = .coverVertical
    self.present(uvc, animated: true)
  }
  @IBAction func moveByNavi(_ sender: UIBarButtonItem) {
    guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "NavigationSecondVC") else { return }
    navigationController?.pushViewController(uvc, animated: true)
  }
  @IBAction func onPressPresent(_ sender: UIButton) {
    guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "NavigationSecondVC") else { return }
    present(uvc, animated: true)
  }
  
  @IBAction func wind(_ sender: Any) {
    self.performSegue(withIdentifier: "ManualWind", sender: self)
  }
}

