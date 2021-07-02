 //
//  NewPlaceViewController.swift
//  Places
//
//  Created by Artyom on 2.07.21.
//

 import UIKit

 class NewPlaceViewController: UITableViewController {

     override func viewDidLoad() {
         super.viewDidLoad()
         
         tableView.tableFooterView = UIView()
     }
     
     // MARK: Table view delegate
     override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
         if indexPath.row == 0 {
             
         } else {
             view.endEditing(true)
         }
     }


 }
 
 // MARK: Text Field Delegate
 
 
 extension NewPlaceViewController: UITextFieldDelegate{
    
    // Close keyborder when user presses done
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
 }
