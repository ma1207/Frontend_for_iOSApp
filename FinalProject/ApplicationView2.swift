//
//  ApplicationView.swift
//  FinalProject
//
//  Created by Kaitlyn Ma on 5/1/22.
//

import UIKit

class ApplicationView2: UIViewController {

    
    lazy var addInternshipButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(addInternship), for: .touchUpInside)
        button.setTitle(" Add Internship ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red:130.0/255.0, green:150.0/255.0, blue:220.0/255.0, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        return button
    }()
    
    let companyNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Company Name"
        label.textColor = .black
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    let companyName: UITextField = {
        let field = UITextField()
        field.placeholder = "   Company Name"
        field.textColor = .black
        field.font = .systemFont(ofSize: 15)
        field.backgroundColor = .systemGray6
        field.layer.cornerRadius = 10
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        return field
    }()
    
    let internTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Internship Title"
        label.textColor = .black
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    let internTitle: UITextField = {
        let field = UITextField()
        field.placeholder = "   Internship Title"
        field.textColor = .black
        field.font = .systemFont(ofSize: 15)
        field.backgroundColor = .systemIndigo
        field.backgroundColor = .systemGray6
        field.layer.cornerRadius = 10
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        return field
    }()
    
    let internDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Internship Description"
        label.textColor = .black
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    let internDescription: UITextField = {
        let field = UITextField()
        field.placeholder = "   Internship Description"
        field.textColor = .black
        field.font = .systemFont(ofSize: 15)
        field.backgroundColor = .systemIndigo
        field.backgroundColor = .systemGray6
        field.layer.cornerRadius = 10
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        return field
    }()
    
    let appDeadlineLabel: UILabel = {
        let label = UILabel()
        label.text = "Application Deadline"
        label.textColor = .black
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    let appDeadline: UITextField = {
        let field = UITextField()
        field.placeholder = "   EE, MMM d"
        field.textColor = .black
        field.font = .systemFont(ofSize: 15)
        field.backgroundColor = .systemIndigo
        field.backgroundColor = .systemGray6
        field.layer.cornerRadius = 10
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        return field
    }()
    
    let appStatusLabel: UILabel = {
        let label = UILabel()
        label.text = "Application Status"
        label.textColor = .black
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    let appStatus: UITextField = {
        let field = UITextField()
        field.placeholder = "   Accepted/In Progress/Rejected"
        field.textColor = .black
        field.font = .systemFont(ofSize: 15)
        field.backgroundColor = .systemIndigo
        field.backgroundColor = .systemGray6
        field.layer.cornerRadius = 10
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        return field
    }()
    
    let appLinkLabel: UILabel = {
        let label = UILabel()
        label.text = "Application Link"
        label.textColor = .black
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    let appLink: UITextField = {
        let field = UITextField()
        field.placeholder = "   Application Link"
        field.textColor = .black
        field.font = .systemFont(ofSize: 15)
        field.backgroundColor = .systemIndigo
        field.backgroundColor = .systemGray6
        field.layer.cornerRadius = 10
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        return field
    }()
    
    let interviewStatusLabel: UILabel = {
        let label = UILabel()
        label.text = "Interview Status"
        label.textColor = .black
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    let interviewStatus: UITextField = {
        let field = UITextField()
        field.placeholder = "   Interview Status"
        field.textColor = .black
        field.font = .systemFont(ofSize: 15)
        field.backgroundColor = .systemIndigo
        field.backgroundColor = .systemGray6
        field.layer.cornerRadius = 10
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        return field
    }()
    
    let interviewDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Date of Interview"
        label.textColor = .black
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    let interviewDate: UITextField = {
        let field = UITextField()
        field.placeholder = "   EE, MMM d"
        field.textColor = .black
        field.font = .systemFont(ofSize: 15)
        field.backgroundColor = .systemIndigo
        field.backgroundColor = .systemGray6
        field.layer.cornerRadius = 10
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        return field
    }()

    let internLocationLabel: UILabel = {
        let label = UILabel()
        label.text = "Location of Internship"
        label.textColor = .black
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    let internLocation: UITextField = {
        let field = UITextField()
        field.placeholder = "   City, State, or Remote"
        field.textColor = .black
        field.font = .systemFont(ofSize: 15)
        field.backgroundColor = .systemIndigo
        field.backgroundColor = .systemGray6
        field.layer.cornerRadius = 10
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        return field
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "New Internship"
        
        [companyName, internTitle, internDescription, appDeadline, appStatus, appLink, interviewStatus, interviewDate, internLocation, addInternshipButton, companyNameLabel, internTitleLabel, internDescriptionLabel, appDeadlineLabel, appStatusLabel, appLinkLabel, interviewStatusLabel, interviewDateLabel, internLocationLabel].forEach { subView in
            subView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(subView)
        }
        view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            companyNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            companyNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            companyNameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            companyName.topAnchor.constraint(equalTo: companyNameLabel.bottomAnchor, constant: 5),
            companyName.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            companyName.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            internTitleLabel.topAnchor.constraint(equalTo: companyName.bottomAnchor, constant: 15),
            internTitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            internTitleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            internTitle.topAnchor.constraint(equalTo: internTitleLabel.bottomAnchor, constant: 5),
            internTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            internTitle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            internDescriptionLabel.topAnchor.constraint(equalTo: internTitle.bottomAnchor, constant: 15),
            internDescriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            internDescriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            internDescription.topAnchor.constraint(equalTo: internDescriptionLabel.bottomAnchor, constant: 5),
            internDescription.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            internDescription.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            appDeadlineLabel.topAnchor.constraint(equalTo: internDescription.bottomAnchor, constant: 15),
            appDeadlineLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            appDeadlineLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            appDeadline.topAnchor.constraint(equalTo: appDeadlineLabel.bottomAnchor, constant: 5),
            appDeadline.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            appDeadline.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            appStatusLabel.topAnchor.constraint(equalTo: appDeadline.bottomAnchor, constant: 15),
            appStatusLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            appStatusLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            appStatus.topAnchor.constraint(equalTo: appStatusLabel.bottomAnchor, constant: 5),
            appStatus.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            appStatus.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            appLinkLabel.topAnchor.constraint(equalTo: appStatus.bottomAnchor, constant: 15),
            appLinkLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            appLinkLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            appLink.topAnchor.constraint(equalTo: appLinkLabel.bottomAnchor, constant: 5),
            appLink.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            appLink.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            interviewStatusLabel.topAnchor.constraint(equalTo: appLink.bottomAnchor, constant: 15),
            interviewStatusLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            interviewStatusLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            interviewStatus.topAnchor.constraint(equalTo: interviewStatusLabel.bottomAnchor, constant: 5),
            interviewStatus.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            interviewStatus.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            interviewDateLabel.topAnchor.constraint(equalTo: interviewStatus.bottomAnchor, constant: 15),
            interviewDateLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            interviewDateLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            interviewDate.topAnchor.constraint(equalTo: interviewDateLabel.bottomAnchor, constant: 5),
            interviewDate.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            interviewDate.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            internLocationLabel.topAnchor.constraint(equalTo: interviewDate.bottomAnchor, constant: 15),
            internLocationLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            internLocationLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            internLocation.topAnchor.constraint(equalTo: internLocationLabel.bottomAnchor, constant: 5),
            internLocation.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            internLocation.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            
            addInternshipButton.topAnchor.constraint(equalTo: internLocation.bottomAnchor, constant: 30),
            addInternshipButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
    }
    
    @objc func addInternship() {
        //let message = Message(id: nil, title: titleField.text, body: bodyField.text)
        NetworkManager.createInternship(name: companyName.text!, status: appStatus.text!, date: interviewDate.text!, completion: {internship in
        })

        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
            
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
    

}

