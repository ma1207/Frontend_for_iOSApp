//
//  ViewControllerWithSections.swift
//  FinalProject
//
//  Created by Kaitlyn Ma on 5/3/22.
//

//import UIKit
//
//struct Groupings {
//
//    var status: String
//    var intshps : [Internship]
//
//}
//
//class ViewControllerWithSections: UIViewController, ModelContainer {
//
//    var internships: [Internship] = [] {
//        didSet {
//            applicationView.reloadData()
//        }
//    }
//
//    var statusSections = [Groupings]()
//
//    //var statusSections = [Groupings(status: "Accepted", intshps:[]), Groupings(status: "Rejected", intshps:[]), Groupings(status: "In Progress", intshps:[])]
//
//    var filteredInternships = [Internship]()
//
//    lazy var searchController: UISearchController = {
//       let s = UISearchController(searchResultsController: nil)
//        s.searchResultsUpdater = self
//        s.obscuresBackgroundDuringPresentation = false
//        s.searchBar.placeholder = "Search Internships..."
//        s.searchBar.sizeToFit()
//        s.searchBar.scopeButtonTitles = ["All", "Accepted", "Rejected", "In Progress"]
//        s.searchBar.delegate = self
//        return s
//    }()
//
//    lazy var editor = InternshipEditorController()
//
//    lazy var applicationView: UITableView = {
//        let tableView = UITableView()
//        tableView.dataSource = self
//        tableView.delegate = self
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.register(InternshipTableViewCell.self, forCellReuseIdentifier: InternshipTableViewCell.id)
//        return tableView
//    }()
//
//    func setUpConstraints() {
//        NSLayoutConstraint.activate([
//            applicationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            applicationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            applicationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            applicationView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//        ])
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        title = "Internship List"
//        view.backgroundColor = .white
//
//        searchController.searchResultsUpdater = self
//        navigationItem.searchController = searchController
//
//
//        setupNavBar()
//
//        NotificationCenter.default.addObserver(self, selector: #selector(didGetNotifiation(_:)), name: Notification.Name("internship"), object: nil)
//
//        let refresh = UIRefreshControl()
//        refresh.tintColor = .systemGray2
//        refresh.addTarget(self, action: #selector(populateInternships), for: .valueChanged)
//        applicationView.refreshControl = refresh
//
//        [applicationView].forEach { subView in subView.translatesAutoresizingMaskIntoConstraints = false
//            view.addSubview(subView)
//        }
//
//        setUpConstraints()
//        // Do any additional setup after loading the view.
//    }
//
//    func filterContentForSearch(searchText: String, scope: String = "All") {
//        filteredInternships = internships.filter({ (internship: Internship) -> Bool in
//            let doesMatch = (scope == "All") || (internship.ApplicationStatus == scope)
//
//            if(scope != "All"){
//                for array in statusSections{
//                    if(array.status == scope){
//                        filteredInternships=array.intshps
//                    }
//                }
//            }
//            else{
//                filteredInternships=internships
//            }
//
//            if isSearchBarEmpty() {
//                return doesMatch
//            } else {
//                return doesMatch && (internship.CompanyName!.lowercased().contains(searchText.lowercased()) || internship.InternshipTitle!.lowercased().contains(searchText.lowercased()))
//            }
//        })
//
//        applicationView.reloadData()
//    }
//
//    func isSearchBarEmpty() -> Bool {
//        return searchController.searchBar.text?.isEmpty ?? true
//    }
//
//    func isFiltering() -> Bool {
//        let searchBarScopeIsFiltering = searchController.searchBar.selectedScopeButtonIndex != 0
//        return searchController.isActive && (!isSearchBarEmpty() || searchBarScopeIsFiltering)
//    }
//
//    @objc func didGetNotifiation(_ notification: Notification){
//        let msg = notification.object as! Internship?
//        if let index = internships.firstIndex(where: {$0.id == msg!.id}) {
//            internships[index] = msg!
//        }
//        else {
//            internships.append(msg!)
//        }
//        var groups = Dictionary(grouping: self.internships){ (Internship) -> String in
//            return Internship.ApplicationStatus!
//        }
//        self.statusSections = groups.map(Groupings.init(status:intshps:))
//    }
//
//    @objc func populateInternships() {
//        applicationView.reloadData()
//        DispatchQueue.main.async {
//            self.applicationView.refreshControl?.endRefreshing()
//        }
//    }
//
//    func setupNavBar() {
//        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationController?.navigationBar.isTranslucent = true
//        navigationController?.navigationBar.tintColor = UIColor(red:130.0/255.0, green:150.0/255.0, blue:220.0/255.0, alpha: 1)
//
//        navigationController?.navigationBar.largeTitleTextAttributes = [
//            .foregroundColor: UIColor(red:130.0/255.0, green:150.0/255.0, blue:220.0/255.0, alpha: 1)
//        ]
//    }
//
//    @objc func addInternship() {
//        let newEditorController = ApplicationView()
//        newEditorController.delegate = self
//        navigationController?.pushViewController(newEditorController, animated: true)
//    }
//
//    @objc func presentViewController(){
//        present(editor, animated:true, completion: nil)
//    }
//
//}
//
//extension ViewControllerWithSections: UITableViewDataSource, UITableViewDelegate {
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        if(isFiltering()){
//            return 1;
//        }
//        return self.statusSections.count
//    }
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        let section = self.statusSections[section]
//        let field = section.status
//        let size = section.intshps.count
//        if(isFiltering()){
//            return ""
//        }
//        return field + "    (\(size))"
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
//        if isFiltering() {return filteredInternships.count}
//        let section = self.statusSections[section]
//        return section.intshps.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellId", for: indexPath) as? InternshipTableViewCell {
//            let internship : Internship
//
//            let section = self.statusSections[indexPath.section]
//
//            if isFiltering() {
//                internship = filteredInternships[indexPath.row]
//            } else {
//                internship = section.intshps[indexPath.row]
//            }
//
//            cell.configure(internship: internship)
//            cell.selectionStyle = .blue
//            return cell
//        } else{
//            return UITableViewCell()
//        }
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
//
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] _, _, handler in
//            if let self = self {
//                handler(self.deleteMessage(internship: self.statusSections[indexPath.section].intshps[indexPath.row]))
//            }
//            handler(false)
//        }
//
//        deleteAction.backgroundColor = .systemRed
//        return UISwipeActionsConfiguration(actions: [deleteAction])
//    }
//
//    func deleteMessage(internship: Internship?) -> Bool {
//        var deleted = false
//        if let internshipId = internship?.id, let name = internship?.CompanyName {
//            do {
//                try DispatchQueue.main.async {
//                        self.internships.removeAll { $0.id == internshipId }
//                    }
//                    deleted = true
//            } catch {
//                print(error)
//            }
//        }
//        return deleted
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let newEditorController = InternshipEditorController()
//        newEditorController.delegate = self
//        newEditorController.original = self.statusSections[indexPath.section].intshps[indexPath.row]
//        navigationController?.pushViewController(newEditorController, animated: true)
//    }
//
//}
//
//extension ViewControllerWithSections: UISearchBarDelegate {
//    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int){
//        filterContentForSearch(searchText: searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
//    }
//}
//
//extension ViewControllerWithSections: UISearchResultsUpdating {
//    func updateSearchResults(for searchController: UISearchController) {
//        let searchBar = searchController.searchBar
//        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
//        filterContentForSearch(searchText: searchController.searchBar.text!, scope: scope)
//    }
//}
//
//
