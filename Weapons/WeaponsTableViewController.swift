//
//  WeaponsTableViewController.swift
//  Weapons
//
//  Created by 瞿炬星 on 2018/3/2.
//  Copyright © 2018年 瞿炬星. All rights reserved.
//

import UIKit

class WeaponsTableViewController: UITableViewController {
    
    var weapons: [Weapon] = []
    
    
    
//    var weapons = [
//    "AUG","AWM","十字弩","DP28","Groza","Kar98k","M16a4","Micro UZI","平底锅","SKS","UMP9"
//    ]
//    var weaponTypes = ["自动步枪","狙击枪","冷兵器","机枪","自动步枪","狙击枪","自动步枪","冲锋枪","近身武器","半自动步枪","冲锋枪"]
//    var origins = ["奥地利","英国","中国","前苏联","俄罗斯","德国","美国","以色列","美国","前苏联","美国"]
//    var weaponImages = [
//    "aug","awm","crossbow","dp28","groza","kar98k","m16a4","microuzi","pan","sks","ump9"
//    ]
    @IBAction func favBtnTap(_ sender: UIButton) {
        let btnPos = sender.convert(CGPoint.zero, to: self.tableView)
        let indexPath = tableView.indexPathForRow(at: btnPos)!
        self.weapons[indexPath.row].favorite = !self.weapons[indexPath.row].favorite
        
        let cell = tableView.cellForRow(at: indexPath) as! CardCell
        cell.favorite = self.weapons[indexPath.row].favorite
    }
    
//    var favorites = Array(repeating: false, count: 11)
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedStringKey.foregroundColor : UIColor(named: "theme")!
        ]
        
        loadJson()
//        saveToJson()
    }

    func loadJson() {
        let coder = JSONDecoder()
        
        do {
            let url = Bundle.main.url(forResource: "weapons", withExtension: "json")!
            let data = try Data(contentsOf: url)
            
            weapons = try coder.decode([Weapon].self, from: data)
            
            
        } catch  {
            print("解码错误", error)
        }
    }
    
//    func saveToJson() {
//        let coder = JSONEncoder()
//
//        do {
//            let data = try coder.encode(weapons)
//            let saveUrl = URL(fileURLWithPath: NSHomeDirectory()).appendingPathComponent("weapons.json")
//
//            try data.write(to: saveUrl)
//            print("保存成功! 路径：",saveUrl)
//        } catch {
//            print("编码错误",error)
//        }
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let favAction = UIContextualAction(style: .normal, title: "Like") { (_, _, completion) in
            self.weapons[indexPath.row].favorite = !self.weapons[indexPath.row].favorite
            
            let cell = tableView.cellForRow(at: indexPath) as! CardCell
            cell.favorite = self.weapons[indexPath.row].favorite
            
            completion(true)
        }
        favAction.image = #imageLiteral(resourceName: "fav")  
        favAction.backgroundColor = UIColor.purple
        
        let config = UISwipeActionsConfiguration(actions: [favAction])
        return config
    }

    
  
   

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delAction = UIContextualAction(style: .destructive, title: "Delete") { (_, _, completion) in
            self.weapons.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            completion(true)
            
        }
        let shareAction = UIContextualAction(style: .normal, title: "Share") { (_, _, completion) in
            let text = "这是绝地求生中的帅气\(self.weapons[indexPath.row])!"
            let image = UIImage(named: self.weapons[indexPath.row].image)!
            let ac = UIActivityViewController(activityItems: [text,image], applicationActivities: nil)
            
            if let pc = ac.popoverPresentationController {
                if let cell = tableView.cellForRow(at: indexPath) {
                    pc.sourceView = cell
                    pc.sourceRect = cell.bounds
                }
            }
            
            self.present(ac, animated: true)
            
            completion(true)
        }
        
       
        shareAction.backgroundColor = UIColor.orange
        
        let config = UISwipeActionsConfiguration(actions: [delAction,shareAction])
        return config
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return weapons.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let id = String(describing: CardCell.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) as! CardCell

        cell.typeLabel.text = weapons[indexPath.row].type
        cell.weaponLabel.text = weapons[indexPath.row].name
        cell.originLabel.text = weapons[indexPath.row].origin
        cell.backImageView.image = UIImage(named: weapons[indexPath.row].image)
        cell.favorite = weapons[indexPath.row].favorite

        return cell
    }
   

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showWeaponDetail" {
            let row = tableView.indexPathForSelectedRow!.row
            let destination = segue.destination as! DetailController
            
            destination.weapon = weapons[row]
            
        }
        
    }
    
  @IBAction  func backToHome(segue: UIStoryboardSegue)  {
    
    }
  

}
