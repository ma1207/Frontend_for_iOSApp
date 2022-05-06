//
//  CalendarView.swift
//  FinalProject
//
//  Created by Kaitlyn Ma on 5/1/22.
//

import UIKit

struct CustomData {
    var option: String
}

class CalendarView: UIViewController, ModelContainer {
    
    var internships: [Internship] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var filteredInternships = [Task]()
    
//    var tasks: [Task] = [] {
//        didSet {
//            taskView.reloadData()
//        }
//    }
    
    var tasks = [Task]()
//
    var data = [CustomData]()
    
    var selectedType: [IndexPath] = []
    
    let reuseIdentifier = "TaskCellId"
    
//    var filteredTasks = [Task]()
    
//    lazy var taskEditor = TaskEditorController()
    
//    lazy var addTaskButton: UIButton = {
//        let button = UIButton()
//        button.addTarget(self, action: #selector(addTask), for: .touchUpInside)
//        button.setTitle(" Add Tasks ", for: .normal)
//        button.setTitleColor(.white, for: .normal)
//        button.backgroundColor = UIColor(red:130.0/255.0, green:150.0/255.0, blue:220.0/255.0, alpha: 1)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.layer.cornerRadius = 10
//        return button
//    }()
    
//    @objc func presentTaskController() {
//        present(taskEditor, animated:true, completion: nil)
//    }
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.allowsMultipleSelection = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        
        return cv
    }()
    
    lazy var taskView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TaskCell.self, forCellReuseIdentifier: reuseIdentifier)
        return tableView
    }()
    
    func setUpTaskConstraints() {
        NSLayoutConstraint.activate([
            taskView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            taskView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            taskView.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            taskView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -555),
        ])
        
//        NSLayoutConstraint.activate([
//            addTaskButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
//            addTaskButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
//        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Calendar"
        view.backgroundColor = .white
        
        var currentDate = Date()
        var date1 = Calendar.current.date(byAdding: .day, value: 1, to: currentDate)!
        var date2 = Calendar.current.date(byAdding: .day, value: 2, to: currentDate)!
        var date3 = Calendar.current.date(byAdding: .day, value: 3, to: currentDate)!
        var date4 = Calendar.current.date(byAdding: .day, value: 4, to: currentDate)!
        var date5 = Calendar.current.date(byAdding: .day, value: 5, to: currentDate)!
        var date6 = Calendar.current.date(byAdding: .day, value: 6, to: currentDate)!

        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE, MMM d"
        
        filteredInternships = tasks
        
        data = [CustomData(option: dateFormatter.string(from: currentDate)), CustomData(option: dateFormatter.string(from: date1)),  CustomData(option: dateFormatter.string(from: date2)), CustomData(option: dateFormatter.string(from: date3)), CustomData(option: dateFormatter.string(from: date4)), CustomData(option: dateFormatter.string(from: date5)), CustomData(option: dateFormatter.string(from: date6))]
        
        NotificationCenter.default.addObserver(self, selector: #selector(didGetNotifiation(_:)), name: Notification.Name("internship"), object: nil)
        let refresh = UIRefreshControl()
        refresh.tintColor = .systemGray2
        refresh.addTarget(self, action: #selector(populateTasks), for: .valueChanged)
        taskView.refreshControl = refresh
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        [taskView, collectionView].forEach { subView in subView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(subView)
        }
        

        setUpTaskConstraints()
        // Do any additional setup after loading the view.
    }
    
    @objc func didGetNotifiation(_ notification: Notification){
        let msg = notification.object as! Internship?
        if let index = internships.firstIndex(where: {$0.id == msg!.id}) {
            internships[index] = msg!
        }
        else {
            internships.append(msg!)
        }
        var list = [Task]()
        for intshp in internships{
            let name = "\(intshp.CompanyName ?? "name"): \(intshp.InternshipTitle ?? "title") Interview"
            let date = "\(intshp.InterviewDate ?? "date")"
            let task = Task(name: name, date: date, isDone: false)
            list.append(task)
        }
        tasks = list
    }
    
    @objc func populateTasks() {
        taskView.reloadData()
        DispatchQueue.main.async {
            self.taskView.refreshControl?.endRefreshing()
        }
    }
    
    
//    @objc func addTask() {
//        let newEditorController = TaskEditorController()
//        newEditorController.delegate = self
//        navigationController?.pushViewController(newEditorController, animated: true)
//    }
    
//    @objc func presentTaskViewController(){
//        present(taskEditor, animated:true, completion: nil)
//    }
    
}

extension CalendarView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return filteredInternships.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? TaskCell {
            let task = filteredInternships[indexPath.row]
//            let internship = filteredInternships[indexPath.row]
//            let name = "\(internship.CompanyName ?? "name"): \(internship.InternshipTitle ?? "title") Interview"
//            let date = "\(internship.InterviewDate ?? "date")"
//            let task = Task(name: name, date: date, isDone: false)
            cell.configure(task: task)
            cell.selectionStyle = .none
            return cell
        } else{
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] _, _, handler in
//            if let self = self {
//                handler(self.deleteMessage(task: self.tasks[indexPath.item]))
//            }
//            handler(false)
//        }
//
//        deleteAction.backgroundColor = .systemRed
//        return UISwipeActionsConfiguration(actions: [deleteAction])
//    }

//    func deleteMessage(task: Task?) -> Bool {
//        var deleted = false
//        if let taskId = task?.id, let name = task?.name {
//            do {
//                try DispatchQueue.main.async {
//                        self.tasks.removeAll { $0.id == taskId }
//                    }
//                    deleted = true
//            } catch {
//                print(error)
//            }
//        }
//        return deleted
//    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = filteredInternships[indexPath.row]
//        let internship = internships[indexPath.row]
//        let name = "\(internship.CompanyName ?? "name"): \(internship.InternshipTitle ?? "title") Interview"
//        let date = "\(internship.InterviewDate ?? "date")"
//        let task = Task(name: name, date: date, isDone: false)
        task.isDone.toggle()
        if let cell = tableView.cellForRow(at: indexPath) as?
            TaskCell {
            cell.toggleDone(isDone: task.isDone)
        }
    }

}

extension CalendarView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/7.77, height: collectionView.frame.height/1.4)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 10
        cell.data = self.data[indexPath.row]
        return cell
    }
    
}

extension CalendarView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectedType = collectionView.indexPathsForSelectedItems ?? []
        filteredInternships = []
        
        for indexPath in selectedType {
            let cell = collectionView.cellForItem(at: indexPath)
            cell?.backgroundColor = .systemGray4
            cell?.layer.cornerRadius = 10
            
//            for intshp in internships {
//                if intshp.InterviewDate == data[indexPath.item].option {
//                    filteredInternships.append(intshp)
//                }
//            }
            for task in tasks {
                if task.date == data[indexPath.item].option {
                    filteredInternships.append(task)
                }
            }
  
        }
        taskView.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = .white
        cell?.layer.cornerRadius = 0
        selectedType = collectionView.indexPathsForSelectedItems ?? []
        filteredInternships = []
        if (selectedType == []){
            filteredInternships = tasks
        }
        for indexPath in selectedType {
            let cell = collectionView.cellForItem(at: indexPath)
            cell?.backgroundColor = .systemGray4
            cell?.layer.cornerRadius = 10
            
//            for intshp in internships{
//                if intshp.InterviewDate == data[indexPath.item].option {
//                    filteredInternships.append(intshp)
//                }
//            }
            for task in tasks{
                if task.date == data[indexPath.item].option {
                    filteredInternships.append(task)
                }
            }
        }
        taskView.reloadData()
    }
}

class CustomCell: UICollectionViewCell {
    
    var data: CustomData? {
        didSet {
            guard let data = data else {return}
            category.text = data.option
        }
    }
    
    let category: UILabel = {
        let cg = UILabel()
        cg.textAlignment = .center
        cg.font = UIFont.boldSystemFont(ofSize: 10)
        cg.numberOfLines = 2
        cg.translatesAutoresizingMaskIntoConstraints = false
        return cg
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(category)
        NSLayoutConstraint.activate([
            category.topAnchor.constraint(equalTo: contentView.topAnchor),
            category.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            category.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            category.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}







    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

