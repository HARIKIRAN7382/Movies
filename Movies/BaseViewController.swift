//
//  BaseViewController.swift
//  Movies
//
//  Created by iOS Developer on 25/03/21.
//

import UIKit

class BaseViewController: UITabBarController {
    
    lazy var activityIndicator: UIActivityIndicatorView = {
         let aI = UIActivityIndicatorView(style: .gray)
         aI.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
         aI.color = .systemBlue
         aI.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
         aI.hidesWhenStopped = false
         return aI
       }()

     override func viewDidLoad() {
         super.viewDidLoad()
     }
     
       
          func showActivityIndicator(show: Bool){
             if show{
               DispatchQueue.main.async {
                 self.activityIndicator.startAnimating()
                 if #available(iOS 13.0, *) {
                   for scene in UIApplication.shared.connectedScenes
                   {
                     if scene.activationState == .foregroundActive
                     {
                       let rootVC = ((scene as? UIWindowScene)!.delegate as! UIWindowSceneDelegate).window!!.rootViewController
                       if let viewController = rootVC?.presentedViewController {
                         viewController.view.addSubview(self.activityIndicator)
                       } else {
                         rootVC?.view.addSubview(self.activityIndicator)
                       }
                     }
                   }
                 } else {
                   (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController?.view.addSubview(self.activityIndicator)
                 }
               }
             } else{
               DispatchQueue.main.async {
                 self.activityIndicator.stopAnimating()
                 var ai : UIActivityIndicatorView?
                 if #available(iOS 13.0, *) {
                   for scene in UIApplication.shared.connectedScenes
                   {
                     if scene.activationState == .foregroundActive
                     {
                       let rootVC = ((scene as? UIWindowScene)!.delegate as! UIWindowSceneDelegate).window!!.rootViewController
                       //                        rootVC?.view.addSubview(self.activityIndicator)
                       if let viewController = rootVC?.presentedViewController {
                         ai = viewController.view.subviews.first(where: {$0 is UIActivityIndicatorView}) as? UIActivityIndicatorView
                       } else {
                         ai = rootVC?.view.subviews.first(where: {$0 is UIActivityIndicatorView}) as? UIActivityIndicatorView
                       }
                     }
                   }
                   // ai = (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController?.view.subviews.first(where: {$0 is UIActivityIndicatorView}) as? UIActivityIndicatorView
                 } else {
                   ai = (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController?.view.subviews.first(where: {$0 is UIActivityIndicatorView}) as? UIActivityIndicatorView
                 }
                 ai?.removeFromSuperview()
               }
             }
           }

}
