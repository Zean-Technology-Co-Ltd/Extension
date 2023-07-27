//
//  UIViewController+Extension.swift
//  qpyf
//
//  Created by zq on 2023/3/3.
//

import UIKit

private var UIViewControllerLoadingKey: UInt8 = 0

extension UIViewController {
    @objc func dy_dismissKeyboard(targetView: UIView) {
        let singleTapGR = UITapGestureRecognizer(target: self, action: #selector(tapAnywhereToDismissKeyboard));
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification,
                                               object: nil,
                                               queue: OperationQueue.main) { noti in
            targetView.addGestureRecognizer(singleTapGR)
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification,
                                               object: nil,
                                               queue: OperationQueue.main) { noti in
            targetView.removeGestureRecognizer(singleTapGR)
        }
    }
    
    @objc func tapAnywhereToDismissKeyboard() {
        self.view.endEditing(true)
    }
    
    func popToViewController(vcType: NNBaseViewController.Type){
        if let controllers = self.navigationController?.viewControllers {
            for vc in controllers {
                if vc.isKind(of: vcType) {
                    self.navigationController?.popToViewController(vc, animated: true)
                    break
                }
            }
        }
    }
    
    func resetPopAction(selector: Selector) {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: R.image.common_arrow_pop_icon(), style: .plain, target: self, action: selector)
    }
}
