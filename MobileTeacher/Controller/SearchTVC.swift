//
//  SearchTVC.swift
//  MobileTeacher
//
//  Created by Pavly Habashy on 10/20/19.
//  Copyright © 2019 Pavly Habashy. All rights reserved.
//

import UIKit

class SearchTVC: UITableViewController {
    
    struct Objects : Hashable {
        static func == (lhs: SearchTVC.Objects, rhs: SearchTVC.Objects) -> Bool {
            return lhs.tag == rhs.tag && lhs.list == rhs.list
        }
        

        var tag : String!
        var list : [Video]!
        
        
    }

    var objectArray = [Objects]()
    var selectedVideos = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        for (key, value) in globalTags {
            print("\(key) -> \(value)")
            objectArray.append(Objects(tag: key, list: value))
        }
        
        objectArray.sort { $0.tag < $1.tag }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return objectArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tag", for: indexPath)

        cell.textLabel?.text = objectArray[indexPath.row].tag

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        }
    }
    
//    func addToFilteredVideos(tag: String){
//        let taggedVideos = globalTags[tag] ?? []
//        let taggedSet = Set(taggedVideos)
//
//        let videoSet = Set(selectedVideos)
//
//        self.selectedVideos = Array(videoSet.union(taggedSet))
//        // videoSet.union(taggedSet)
//    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        self.navigationController?.dismiss(animated: true, completion: {
        })
    }
}
