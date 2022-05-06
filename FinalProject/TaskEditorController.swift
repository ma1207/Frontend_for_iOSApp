//
//  TaskEditorController.swift
//  FinalProject
//
//  Created by Kaitlyn Ma on 5/4/22.
//

import UIKit

//protocol ModelContainer2: AnyObject {
//    var tasks: [Task] { get set }
//}

class TaskEditorController: UIViewController {
    
//    weak var delegate: ModelContainer2?
//
//    lazy var addTaskButton: UIButton = {
//        let button = UIButton()
//        button.addTarget(self, action: #selector(addTask), for: .touchUpInside)
//        button.setTitle(" Add Task ", for: .normal)
//        button.setTitleColor(.white, for: .normal)
//        button.backgroundColor = UIColor(red:130.0/255.0, green:150.0/255.0, blue:220.0/255.0, alpha: 1)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.layer.cornerRadius = 10
//        return button
//    }()
//
//    let taskName: UITextField = {
//        let field = UITextField()
//        field.placeholder = "   Task    "
//        field.textColor = .black
//        field.font = .systemFont(ofSize: 15)
//        field.backgroundColor = .systemGray6
//        field.layer.cornerRadius = 10
//        field.layer.borderWidth = 1
//        field.layer.borderColor = UIColor.black.cgColor
//        return field
//    }()
//
//    let taskDescription: UITextField = {
//        let field = UITextField()
//        field.placeholder = "   Task Description"
//        field.textColor = .black
//        field.font = .systemFont(ofSize: 15)
//        field.backgroundColor = .systemIndigo
//        field.backgroundColor = .systemGray6
//        field.layer.cornerRadius = 10
//        field.layer.borderWidth = 1
//        field.layer.borderColor = UIColor.black.cgColor
//        return field
//    }()
//
//    let taskDate: UITextField = {
//        let field = UITextField()
//        field.placeholder = "EE, MMM d"
//        field.textColor = .black
//        field.font = .systemFont(ofSize: 15)
//        field.backgroundColor = .systemIndigo
//        field.backgroundColor = .systemGray6
//        field.layer.cornerRadius = 10
//        field.layer.borderWidth = 1
//        field.layer.borderColor = UIColor.black.cgColor
//        return field
//    }()
//
//    var original: Task? {
//        didSet {
//            taskName.text = original?.name
//            taskDate.text = original?.date
//        }
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        if let tsk = original, let title = tsk.name {
//            self.title = tsk.name
//        } else {
//            self.title = "New Task"
//        }
//
//        [taskName, taskDescription, taskDate].forEach { subView in
//            subView.translatesAutoresizingMaskIntoConstraints = false
//            view.addSubview(subView)
//        }
//        view.backgroundColor = .white
//
//        NSLayoutConstraint.activate([
//            taskName.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
//            taskName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
//            taskName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
//
//            taskDescription.topAnchor.constraint(equalTo: taskName.bottomAnchor, constant: 15),
//            taskDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
//            taskDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
//
//            taskDate.topAnchor.constraint(equalTo: taskDescription.bottomAnchor, constant: 5),
//            taskDate.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
//            taskDate.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
//
//            addTaskButton.topAnchor.constraint(equalTo: taskDate.bottomAnchor, constant: 30),
//            addTaskButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//
//        ])
//    }
//
//    @objc func addTask() {
//        //let message = Message(id: nil, title: titleField.text, body: bodyField.text)
//        var task: Task
//        task = Task(id: UUID(), name: taskName.text, date: taskDate.text, isDone: false)
//
//        NotificationCenter.default.post(name: Notification.Name("task"), object: task)
//
//        DispatchQueue.main.async {
//            self.navigationController?.popViewController(animated: true)
//
//        }
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

}



