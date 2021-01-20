//
//  AddViewController.swift
//  lecture3DemoSimpleApp
//
//  Created by admin on 20.01.2021.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var NameofTask: UITextField!
    @IBOutlet weak var Description: UITextField!
    @IBOutlet weak var Deadline: UITextField!
    
    var delegate:SecondViewController?
    var id = 0
    @IBOutlet weak var AddButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Add(_ sender: Any) {
        let newItem = ToDoItem(id: id, title: NameofTask.text, description: Description.text, deadLine: Deadline.text)
        delegate?.adItem(newItem)
        
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
