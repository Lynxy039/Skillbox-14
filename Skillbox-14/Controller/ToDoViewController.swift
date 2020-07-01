//
//  ToDoViewController.swift
//  Skillbox-14
//
//  Created by Антон Тимоненков on 01.07.2020.
//  Copyright © 2020 Антон Тимоненков. All rights reserved.
//

import UIKit

class ToDoViewController: UIViewController {
  @IBOutlet weak var taskTextField: UITextField!
  @IBOutlet weak var taskBottomConst: NSLayoutConstraint!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    NotificationCenter.default.addObserver(self,
    selector: #selector(self.keyboardNotification(notification:)),
    name: UIResponder.keyboardWillChangeFrameNotification,
    object: nil)

  }
  
  deinit {
      NotificationCenter.default.removeObserver(self)
  }

  @objc func keyboardNotification(notification: NSNotification) {
    if let userInfo = notification.userInfo {
      let endFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
      let endFrameY = endFrame?.origin.y ?? 0
      let duration:TimeInterval = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
      let animationCurveRawNSN = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber
      let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIView.AnimationOptions.curveEaseInOut.rawValue
      let animationCurve:UIView.AnimationOptions = UIView.AnimationOptions(rawValue: animationCurveRaw)
      let tabHeight = self.tabBarController?.tabBar.frame.height ?? 49.0
      if endFrameY >= UIScreen.main.bounds.size.height {
          self.taskBottomConst?.constant = 5.0
      } else {
        self.taskBottomConst?.constant = (endFrame?.size.height)! - tabHeight + 5
      }
      UIView.animate(withDuration: duration,
                                 delay: TimeInterval(0),
                                 options: animationCurve,
                                 animations: { self.view.layoutIfNeeded() },
                                 completion: nil)
    }
  }
}

