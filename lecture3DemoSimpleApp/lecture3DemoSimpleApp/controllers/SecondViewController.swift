//
//  SecondViewController.swift
//  lecture3DemoSimpleApp
//
//  Created by admin on 06.01.2021.
//

import UIKit

protocol SecondViewControllerDelegate {
    func removeItem(_ id: Int)
    func editItem(_ item: ToDoItem)
    
    func adItem(_ item: ToDoItem)
    func openEditPage(_ item: ToDoItem)
}

class SecondViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var arr = [ToDoItem]()
    let cellId = "TableViewCell"
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
        testDataConfigure()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Main page"
        self.configureTableView()
    }

    
    func testDataConfigure(){
        arr.append(ToDoItem(id: 1, title: "first", description: "first", deadLine: "20.12.2021"))
        arr.append(ToDoItem(id: 2, title: "second", description: "second", deadLine: "22.12.2021"))
        arr.append(ToDoItem(id: 3, title: "third", description: "third", deadLine: "12.08.2021"))
        arr.append(ToDoItem(id: 4, title: "uno", description: "uno", deadLine: "05.07.2021"))
        arr.append(ToDoItem(id: 5, title: "dos", description: "dos", deadLine: "29.12.2021"))
    }
    
    
    func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
        
    }
    
    @IBAction func add(_ sender: UIBarButtonItem) {
        let vcAdd=storyboard?.instantiateViewController(identifier: "AddPageId") as! AddViewController
        vcAdd.id = arr.count
        vcAdd.delegate = self
                navigationController?.pushViewController(vcAdd, animated: true)
    }
    
}

extension SecondViewController: SecondViewControllerDelegate{
    func openEditPage(_ item: ToDoItem) {
        let vcEdit=storyboard?.instantiateViewController(identifier: "editPage") as! EditPageViewController
        vcEdit.item = item
        vcEdit.delegate = self
                navigationController?.pushViewController(vcEdit, animated: true)
    }
    
    func adItem(_ item: ToDoItem) {
        arr.append(item)
        //AddPageId
        
        tableView.reloadData()
    }
    
    func removeItem(_ id: Int) {
        arr.remove(at: id)
        
        tableView.reloadData()
    }
    
    func editItem(_ item: ToDoItem) {
        arr[item.id!] = item
        
        tableView.reloadData()
    }
 
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TableViewCell
        let item = arr[indexPath.row]
//        cell.delegate = self
        cell.id = indexPath.row
        cell.titleLabel.text = item.title
        cell.subTitleLabel.text = item.deadLine
        
        cell.item = item
//        cell.editCallback = { id in
//            self.editItem(item)
//        }
//
//        cell.removeCallback = { id in
//            self.removeItem(id)
//        }
        return cell
    }
    
    
}
