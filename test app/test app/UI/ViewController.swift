//
//  ViewController.swift
//  test app
//
//  Created by Prefect on 27.10.2022.
//

import UIKit
import CoreData

class ViewController: UIViewController {
  
  @IBOutlet weak var idLabel: UILabel!
  @IBOutlet weak var idTextField: UITextField!

  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var nameLabel: UILabel!
  
  @IBOutlet weak var descTextField: UITextField!
  @IBOutlet weak var descLabel: UILabel!
  
  @IBOutlet weak var saveButton: UIButton!
  
  private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

  @IBAction func saveButtonPressed(_ sender: UIButton) {
    print("saveButtonPressed")
    
    guard let id = idTextField.text, let name = nameTextField.text, let desc = descTextField.text else {
      return
    }
    
    if id.isEmpty || name.isEmpty || desc.isEmpty {
      let message = (id.isEmpty == true ? "Id field is empty" : "") +
      (name.isEmpty == true ? "\nName field is empty" : "") +
      (desc.isEmpty == true ? "\nDesc field is empty" : "")
      let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
      alert.addAction(.init(title: "Ok", style: .default))
      present(alert, animated: true)
      return
    }
    
    let item = Item(context: self.context)
    item.id = Int64(id) ?? 0
    item.name = name
    item.desc = desc
    
    do {
      try self.context.save()
      let alert = UIAlertController(title: "Success", message: "Element Saved", preferredStyle: .alert)
      alert.addAction(.init(title: "Ok", style: .default))
      present(alert, animated: true)
    } catch {
      let alert = UIAlertController(title: "Error", message: "Error saving element", preferredStyle: .alert)
      alert.addAction(.init(title: "Ok", style: .default))
      present(alert, animated: true)
    }
    
    idTextField.text = ""
    nameTextField.text = ""
    descTextField.text = ""
  }
  
  @IBAction func showListOfItems(_ sender: UIButton) {
    performSegue(withIdentifier: "showItemsList", sender: self)
  }
}
