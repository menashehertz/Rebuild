//
//  AppProfilesTableViewController.swift
//  Students-Profiles-ByDay
//
//  Created by Steven Hertz on 11/20/19.
//  Copyright © 2019 DevelopItSolutions. All rights reserved.
//

import UIKit

class AppProfilesTableViewController: UITableViewController {
    
    
    var studentUpdaterDelegate: StudentUpdaterDelegate?
    
    var profileList = [AppProfile]()
    var store: StudentStore!
    var dayOfWeek: Int!
    
    var rowSelected: Int? {
        didSet {
            prevRowSelected = oldValue
        }
    }
    var prevRowSelected: Int?
    var expanded: Bool = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        print(dayOfWeek)
        
        AppProfileFunctions.readAppProfiles { (listOfProfiles) in
            self.profileList = listOfProfiles
            self.tableView.reloadData()
        }
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @IBAction func doneClicked(_ sender: UIBarButtonItem) {
        guard let rowSelected = rowSelected, tableView.cellForRow(at: IndexPath(item: rowSelected, section: 0))?.accessoryType == .checkmark else {return}
    
        studentUpdaterDelegate?.upDateStudentAppProfileForDay(dayOfWeek, with: profileList[rowSelected])
        
        navigationController?.popViewController(animated: true)
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return profileList.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as? ProfileTableViewCell else {fatalError("Could not deque-reusable")}

        let appProfile = profileList[indexPath.row]
        cell.setup(appProfileModel: appProfile)
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
            switch cell.accessoryType {
            case .none:
                cell.accessoryType = .checkmark
                expanded = true
                print("set to checked")
            case .checkmark:
                cell.accessoryType = .none
                expanded = false
                print("set to none")
            default:
                break
            }
        }
        
        rowSelected = indexPath.row
        // expanded.toggle()
        
        tableView.beginUpdates()
        tableView.endUpdates()

    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == rowSelected {
            switch expanded {
            case true:
                return 108.0
            case false:
                return 44.0
            }
        } else {
            return 44.0
        }
    }

    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
            cell.accessoryType = .none
        }
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

}
