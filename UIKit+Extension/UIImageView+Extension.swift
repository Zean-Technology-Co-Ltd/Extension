//
//  UIImageView+Extension.swift
//  qpyf
//
//  Created by zq on 2023/3/3.
//

import UIKit
import SDWebImage

extension UIImageView {
    convenience init(nameStr named: String) {
        self.init()
        self.image = UIImage(named: named)
    }
}

extension UIImageView {
    func imageWithUrl(urlStr url: String?){
        imageWithUrl(url: URL(string: (url != nil) ? url! : ""))
    }
    
    func imageWithUrl(url: URL?){
        imageWithUrl(url: url, placeholder: nil)
    }
    
    func imageWithUrl(urlStr url: String?, placeholder: String){
        imageWithUrl(url: URL(string: (url != nil) ? url! : ""), placeholder: UIImage(named: placeholder))
    }
    
    func imageWithUrl(url: URL?, placeholder: UIImage?){
        self.imageWithUrl(url: url, placeholder: placeholder, completion: nil)
    }
    
    func imageWithUrl(url: URL?, placeholder: UIImage?, completion: SDExternalCompletionBlock?) {
        self.sd_setImage(with: url, placeholderImage: placeholder, completed: completion)
    }
    
    func localImageWithName(name: String, type: String){
        let path = Bundle.main.path(forResource: name, ofType: type)
        guard let path = path else { return }
        DispatchQueue.global(qos: .default).async {
            self.sd_setImage(with: URL(fileURLWithPath: path), completed:{ [weak self] image, error, cacheType, imageURL in
                guard let image = image else { return }
                DispatchQueue.main.async {
                    guard let `self` = self else { return }
                    self.image = image
                }
            })
        }
    }
}


extension UIImageView {

    private struct AssociatedKeys {
        static var whenTappedKey   = "whenTappedKey"
    }

    public func whenTapped(handler: @escaping () -> Void) {
        let aBlockClassWrapper = ClosureWrapper(closure: handler)
        objc_setAssociatedObject(self, &AssociatedKeys.whenTappedKey, aBlockClassWrapper, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)

        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(UIImageView.touchUpInside))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tapGestureRecognizer)
    }

    @objc func touchUpInside() {
        let actionBlockAnyObject = objc_getAssociatedObject(self, &AssociatedKeys.whenTappedKey) as? ClosureWrapper
        actionBlockAnyObject?.closure?()
        self.tag = 0
    }
    
    @objc func unsafeSetImageString(imageName: String, placeHolderImage: UIImage?) {
        self.sd_setImage(with: imageName.toURL, placeholderImage: placeHolderImage, options: .allowInvalidSSLCertificates, context: nil)
    }
}
