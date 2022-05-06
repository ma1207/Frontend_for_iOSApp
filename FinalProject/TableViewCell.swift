//
//  TableViewCell.swift
//  FinalProject
//
//  Created by Kaitlyn Ma on 5/1/22.
//

import UIKit

class InternshipTableViewCell: UITableViewCell {
    
    static let id = "TableViewCellId"
    
    var companyNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    
    var internTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 10)
        label.textAlignment = .center
        label.textColor = .darkGray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        [companyNameLabel, internTitleLabel].forEach { subView in
            subView.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(subView)
        }
        
        setUpConstraints()
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            companyNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            companyNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            companyNameLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            internTitleLabel.leadingAnchor.constraint(equalTo: companyNameLabel.leadingAnchor, constant: 5),
            internTitleLabel.topAnchor.constraint(equalTo: companyNameLabel.bottomAnchor, constant: 5),
            internTitleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func configure(internship: Internship) {
        companyNameLabel.text = internship.CompanyName
        internTitleLabel.text = internship.InternshipTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
