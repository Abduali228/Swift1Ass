//
//  EditPageViewController.swift
//  lecture3DemoSimpleApp
//
//  Created by admin on 20.01.2021.
//

import UIKit

class EditPageViewController: UIViewController {

    @IBOutlet weak var EditName: UITextField!
    @IBOutlet weak var EditDescription: UITextField!
    @IBOutlet weak var EditDate: UITextField!
    @IBOutlet weak var EditButton: UIButton!
    
    var item: ToDoItem?
    var delegate:SecondViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func Edit(_ sender: Any) {
        let newItem = ToDoItem(id: item?.id, title: EditName.text, description: EditDescription.text, deadLine: EditDate.text)
        delegate?.editItem(newItem)
        
        navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
