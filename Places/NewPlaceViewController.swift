 //
//  NewPlaceViewController.swift
//  Places
//
//  Created by Artyom on 2.07.21.
//

 import UIKit

 class NewPlaceViewController: UITableViewController, UINavigationControllerDelegate {

    
    @IBOutlet weak var imageOfPlace: UIImageView!
    
    
    
     
     override func viewDidLoad() {
         super.viewDidLoad()
         
         tableView.tableFooterView = UIView()
     }
     
     // MARK: Table view delegate
     override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
         if indexPath.row == 0 {
            
            let cameraIcon = #imageLiteral(resourceName: "camera")
            let photoIcon = #imageLiteral(resourceName: "photo")
            
            
            let actionSheet = UIAlertController(title: nil,
                                                message: nil,
                                                preferredStyle: .actionSheet)
            let camera = UIAlertAction(title: "Camera", style: .default) { _ in
                self.chooseImagePicker(source: .camera)
            }
            camera.setValue(cameraIcon, forKey: "image")
            camera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            
            let photo = UIAlertAction(title: "Photo", style: .default) { _ in
                self.chooseImagePicker(source: .photoLibrary)
            }
            
            photo.setValue(photoIcon, forKey: "image")
            photo.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            
            actionSheet.addAction(camera)
            actionSheet.addAction(photo)
            actionSheet.addAction(cancel)
            
            present(actionSheet, animated: true)
             
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

 // MARK: Work With Image
 
 extension NewPlaceViewController: UIImagePickerControllerDelegate {
    
    
    
    
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker =  UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true, completion: nil)
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageOfPlace.image = info[.editedImage] as? UIImage
        imageOfPlace.contentMode = .scaleAspectFill
        imageOfPlace.clipsToBounds = true
        dismiss(animated: true, completion: nil)
    }
        
 }
