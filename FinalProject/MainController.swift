//
//  MainController.swift
//  FinalProject
//
//  Created by Kaitlyn Ma on 5/1/22.
//

import UIKit

class MainController: UIViewController {

    private let button: UIButton = {
        let button = UIButton(frame: CGRect(x:0, y:0, width:200, height:52))
        button.setTitle("Log in", for: .normal)
        button.titleLabel!.font = .systemFont(ofSize: 20)
        button.backgroundColor = UIColor(red:130.0/255.0, green:150.0/255.0, blue:220.0/255.0, alpha: 1)
        button.setTitleColor(.systemGray6, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Log in or Create an Account"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        return label
    }()
    
    let usernameField: UITextField = {
        let field = UITextField()
        field.placeholder = "   Username    "
        field.textColor = .black
        field.font = .systemFont(ofSize: 20)
        field.backgroundColor = .systemGray6
        field.layer.cornerRadius = 10
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        return field
    }()
    
    let passwordField: UITextField = {
        let field = UITextField()
        field.placeholder = "   Password    "
        field.textColor = .black
        field.font = .systemFont(ofSize: 20)
        field.backgroundColor = .systemGray6
        field.layer.cornerRadius = 10
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.black.cgColor
        return field
    }()
    
    private let createButton: UIButton = {
        let button = UIButton(frame: CGRect(x:0, y:0, width:200, height:52))
        button.setTitle("Create Account", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        [loginLabel, button, usernameField, passwordField].forEach { subView in subView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(subView)
        }
        
        setUpConstraints()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            loginLabel.bottomAnchor.constraint(equalTo: usernameField.topAnchor, constant: -50),
            loginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            usernameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            usernameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            usernameField.bottomAnchor.constraint(equalTo: passwordField.topAnchor, constant: -10),
            usernameField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            passwordField.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -30),
            passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
            
        ])
    }
    
    @objc func didTapButton() {
        let tabBarVC = UITabBarController()
        let vc1 = UINavigationController(rootViewController: ViewControllerWithSections())
        
        let vc2 = UINavigationController(rootViewController: ApplicationView())
        
        let vc3 = UINavigationController(rootViewController: CalendarView())
        
        vc1.title = "Internship List"
        vc2.title = "New Internship"
        vc3.title = "Calendar"
        
        tabBarVC.setViewControllers([vc1, vc2, vc3], animated: true)
        
        guard let items = tabBarVC.tabBar.items else {
            return
        }
        let images = ["house", "plus", "calendar"]
        
        for x in 0..<items.count {
            items[x].image = UIImage(systemName: images[x])
        }
        
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
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
