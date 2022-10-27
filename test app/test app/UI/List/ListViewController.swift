//
//  ListViewController.swift
//  test app
//
//  Created by Prefect on 27.10.2022.
//

import UIKit
import CoreData

class ListViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
  var items: [Item]?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
    tableView.rowHeight = 50
    tableView.separatorStyle = .none
    tableView.register(UINib(nibName: "ListTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "ListTableViewCell")
    fetchItems()
  }
  
  func fetchItems() {
    do {
      self.items = try context.fetch(Item.fetchRequest())
      
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    } catch {
      let alert = UIAlertController(title: "Error", message: "Error fetching elements", preferredStyle: .alert)
      alert.addAction(.init(title: "Ok", style: .default))
      present(alert, animated: true)
    }
  }
}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    items?.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell") as? ListTableViewCell, let items {
      if indexPath.row == 0 {
        cell.backgroundColor = .gray
        cell.idLabel.text = "Id"
        cell.nameLabel.text = "Name"
        cell.descLabel.text = "Description"
      } else {
        let index = indexPath.row - 1
        cell.idLabel.text = items[index].id.description
        cell.nameLabel.text = items[index].name
        // TODO desc
      }
      return cell
    } else {
      return .init()
    }
    
  }
}
