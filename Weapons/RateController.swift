//
//  RateController.swift
//  Weapons
//
//  Created by 瞿炬星 on 2018/3/3.
//  Copyright © 2018年 瞿炬星. All rights reserved.
//

import UIKit

class RateController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet var rateButtons: [UIButton]!
    
    
    @IBAction func tapBackground(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    @IBAction func dragStackView(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .changed:
            let translation = sender.translation(in: view)
            let positon = CGAffineTransform(translationX: translation.x, y: translation.y)
            let angle = sin(translation.x/stackView.frame.width)
            stackView.transform = positon.rotated(by: angle)
        case .ended:
            UIViewPropertyAnimator(duration: 0.5, dampingRatio: 0.5){
                self.stackView.transform = .identity
            }.startAnimation()
            
        default:
            break
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        stackView.transform = .init(translationX: 800, y: 0)
        let startPosition = CGAffineTransform(translationX: 500, y: 0)
        let startScale = CGAffineTransform(scaleX: 10, y: 10)
        
        for button in rateButtons {
            button.alpha = 0
            button.transform = startPosition.concatenating(startScale)
            
        }

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
//        let animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeIn) {
//            self.stackView.transform = .identity
//        }
//        animator.startAnimation()
        
        UIViewPropertyAnimator(duration: 0.4, dampingRatio: 0.5) {
            self.rateButtons[0].alpha = 1
            self.rateButtons[0].transform = .identity
        }.startAnimation(afterDelay: 0.1)
        
        UIViewPropertyAnimator(duration: 0.4, dampingRatio: 0.5) {
            self.rateButtons[1].alpha = 1
            self.rateButtons[1].transform = .identity
            }.startAnimation(afterDelay: 0.2)
        
        UIViewPropertyAnimator(duration: 0.4, dampingRatio: 0.5) {
            self.rateButtons[2].alpha = 1
            self.rateButtons[2].transform = .identity
            }.startAnimation(afterDelay: 0.3)
        
        UIViewPropertyAnimator(duration: 0.4, dampingRatio: 0.5) {
            self.rateButtons[3].alpha = 1
            self.rateButtons[3].transform = .identity
            }.startAnimation(afterDelay: 0.4)
        
        UIViewPropertyAnimator(duration: 0.4, dampingRatio: 0.5) {
            self.rateButtons[4].alpha = 1
            self.rateButtons[4].transform = .identity
            }.startAnimation(afterDelay: 0.5)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
