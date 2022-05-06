//
//  TaskCell.swift
//  FinalProject
//
//  Created by Kaitlyn Ma on 5/4/22.
//

import UIKit

class TaskCell: UITableViewCell {
    
    static let id = "TaskCellId"
    
    var taskName: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    
    var taskDate: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 10)
        label.textAlignment = .center
        label.textColor = .darkGray
        return label
    }()
    
    var doneImage: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "done")
        image.contentMode = .scaleAspectFit
        image.isHidden = true
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        [taskName, taskDate, doneImage].forEach { subView in
            subView.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(subView)
        }
        
        setUpConstraints()
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            taskName.leadingAnchor.constraint(equalTo: doneImage.trailingAnchor, constant: 10),
            taskName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            taskName.heightAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            taskDate.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            taskDate.topAnchor.constraint(equalTo: taskName.bottomAnchor, constant: 5),
            taskDate.heightAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            doneImage.heightAnchor.constraint(equalToConstant: 20),
            doneImage.widthAnchor.constraint(equalToConstant: 20),
            doneImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            doneImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5)
        ])
        
    }
    
    func configure(task: Task) {
        taskName.text = task.name
        taskDate.text = task.date
    }
    
    func toggleDone(isDone: Bool) {
        doneImage.isHidden = !isDone
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
