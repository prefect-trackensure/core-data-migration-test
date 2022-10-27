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

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
  }


  @IBAction func saveButtonPressed(_ sender: UIButton) {
    print("saveButtonPressed")
    
    let item = Item(context: self.context)
    item.id = Int64(idTextField.text ?? "") ?? 0
    item.name = nameTextField.text
    // TODO - desc
    
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

