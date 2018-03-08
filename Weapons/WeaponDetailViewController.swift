//
//  WeaponDetailViewController.swift
//  Weapons
//
//  Created by 瞿炬星 on 2018/3/3.
//  Copyright © 2018年 瞿炬星. All rights reserved.
//

import UIKit

class WeaponDetailViewController: UIViewController {
    var imageName = ""

    @IBOutlet weak var headImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headImageView.image = UIImage(named: imageName)
        navigationItem.largeTitleDisplayMode = .never
        // Do any additional setup after loading the view.
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
