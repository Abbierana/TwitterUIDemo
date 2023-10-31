//
//  BaseVC.swift
//  TwitterDemo
//
//  Created by Abhishek Rana on 30/10/23.
//

import UIKit

class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func goNextController() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        self.navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
    
    func shareTapped(sender: UIButton){
        // If you want to use an image
        let image : UIImage = UIImage(named: "bird")!
        let activityViewController : UIActivityViewController = UIActivityViewController(
            activityItems: [image], applicationActivities: nil)
        // This lines is for the popover you need to show in iPad
        activityViewController.popoverPresentationController?.sourceView = (sender as? UIButton)
        // This line remove the arrow of the popover to show in iPad
        activityViewController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.down
        activityViewController.popoverPresentationController?.sourceRect = CGRect(x: 150, y: 150, width: 0, height: 0)
        // Pre-configuring activity items
        activityViewController.activityItemsConfiguration = [
            UIActivity.ActivityType.message
        ] as? UIActivityItemsConfigurationReading
        // Anything you want to exclude
        activityViewController.excludedActivityTypes = [
            UIActivity.ActivityType.postToWeibo,
            UIActivity.ActivityType.print,
            UIActivity.ActivityType.assignToContact,
            UIActivity.ActivityType.saveToCameraRoll,
            UIActivity.ActivityType.addToReadingList,
            UIActivity.ActivityType.postToFlickr,
            UIActivity.ActivityType.postToVimeo,
            UIActivity.ActivityType.postToTencentWeibo,
            UIActivity.ActivityType.postToFacebook
        ]
        activityViewController.isModalInPresentation = true
        self.present(activityViewController, animated: true, completion: nil)

    }
    
    func showToast(message: String, duration: TimeInterval = 1.25, isErrorMsg: Bool = true, completionBlock: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            let label = UILabel()
            label.text = message
            label.numberOfLines = 0
            label.textColor = .white
            label.textAlignment = .center
            label.font = UIFont(name: "StudioFeixenEdgy-Regular", size: 13)
            label.backgroundColor = isErrorMsg ? UIColor(red: 229/255, green: 50/255, blue: 50/255, alpha: 1) : UIColor(red: 102/255, green: 174/255, blue: 29/255, alpha: 1)
            
            let maxToastSize = CGSize(width: self.view.bounds.size.width*0.925, height: self.view.bounds.size.height)
            let contentSize = label.sizeThatFits(maxToastSize)
            let width = min(maxToastSize.width, contentSize.width+10)
            let height = min(maxToastSize.height, contentSize.height+10)
            
            label.frame = CGRect(x: 0, y: self.view.bounds.height-100, width: width, height: height)
            label.center.x = self.view.center.x
            
            label.layer.cornerRadius = 6
            label.layer.masksToBounds = true
            
            self.view.addSubview(label)
            self.view.isUserInteractionEnabled = false
            
            // Toast Animation
            label.alpha = 0.0
            label.transform = CGAffineTransform(scaleX: 0.975, y: 0.975)
            
            UIView.animate(withDuration: 0.6) {
                label.alpha = 1.0
                label.transform = CGAffineTransform(scaleX: 1, y: 1)
            } completion: { isAnimationCompleted in
                DispatchQueue.main.asyncAfter(deadline: .now()+duration) {
                    UIView.animate(withDuration: 0.6) {
                        label.alpha = 0.0
                        label.transform = CGAffineTransform(scaleX: 0.975, y: 0.975)
                    } completion: { isAnimationCompleted in
                        label.removeFromSuperview()
                        completionBlock?()
                        self.view.isUserInteractionEnabled = true
                    }
                }
            }
        }
    }
}
