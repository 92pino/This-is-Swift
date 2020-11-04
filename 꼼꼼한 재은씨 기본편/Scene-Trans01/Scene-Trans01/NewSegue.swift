//
//  NewSegue.swift
//  Scene-Trans01
//
//  Created by JinBae Jeong on 2020/11/04.
//

import UIKit

class NewSegue: UIStoryboardSegue {
  override func perform() {
    // 세그웨이의 출발지 뷰 컨트롤러
    let srcUVC = self.source
    
    // 세그웨이의 목적지 뷰 컨트롤러
    let destUVC = self.destination
    
//    UIView.transition(
//      from: srcUVC, // 출발지 뷰
//      to: destUVC,  // 목적지 뷰
//      duration: 2,  // 화면 전환에 소요되는 시간
//      options: .transitionCurlDown  // 애니메이션 전환 옵션
//    )
  }
}
