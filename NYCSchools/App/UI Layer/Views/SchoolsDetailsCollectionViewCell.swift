//
//  SchoolsDetailsCollectionViewCell.swift
//  NYCSchools
//
//  Created by Диана Мишкова on 7.01.24.
//

import Foundation
import UIKit

class SchoolsDetailsCollectionViewCell: UICollectionViewCell {
    private var school: School?
    
    private struct Constants {
        static let leftInset: CGFloat = 10
        static let topInset: CGFloat = 10
        static let rightInset: CGFloat = 10
        static let bottomInset: CGFloat = 10
        static let borderWidth: CGFloat = 0.5
        static let cornerRadius: CGFloat = 10.0
        static let wrapperViewInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        static let spacing: CGFloat = 5.0
    }
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private var addressTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        label.numberOfLines = 0
        label.text = "school.details.address.title".localized()
        return label
    }()
    
    
    private var addressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 14)
        return label
    }()
    
    private var emailTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        label.text = "school.details.email.title".localized()
        return label
    }()
    
    private var emailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 14)
        return label
    }()
    
    private var phoneTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        label.text = "school.details.phone.title".localized()
        return label
    }()
    
    private var phoneLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 14)
        return label
    }()
    
    private var academicOpportunitiesTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        label.numberOfLines = 0
        label.text = "school.details.academic.opportunities.title".localized()
        return label
    }()
    
    private var academicOpportunitiesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 14)
        label.numberOfLines = 0
        return label
    }()

    private var gradesTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        label.numberOfLines = 0
        label.text = "school.details.grades.title".localized()
        return label
    }()
    
    private var gradesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 14)
        label.numberOfLines = 0
        return label
    }()
    
    private var websiteTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        label.text = "school.details.website.title".localized()
        return label
    }()
    
    private var websiteLabel: UILabel = {
        let label = UILabel()
        let font = UIFont(name: "HelveticaNeue", size: 14)
        return label
    }()
    
    
    private var wrapperView: UIView = {
        let view = UIView(forAutoLayout: ())
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = Constants.borderWidth
        view.layer.cornerRadius = Constants.cornerRadius
        return view
    }()
    
    private var stackView: UIStackView = {
        let stackView = UIStackView(forAutoLayout: ())
        stackView.spacing = Constants.spacing
        stackView.axis = .vertical
        stackView.alignment = .fill
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        backgroundColor = .white
        setupWrapperView()
        setupStackView()
    }
    
    private func setupWrapperView() {
        addSubview(wrapperView)
        wrapperView.autoPinEdgesToSuperviewEdges(with: Constants.wrapperViewInsets)
    }
    
    private func setupStackView() {
        wrapperView.addSubview(stackView)
        
        stackView.autoPinEdge(toSuperviewEdge: .top, withInset: Constants.topInset)
        stackView.autoPinEdge(toSuperviewEdge: .bottom, withInset: Constants.bottomInset)
        stackView.autoPinEdge(toSuperviewEdge: .leading, withInset: Constants.leftInset)
        stackView.autoPinEdge(toSuperviewEdge: .trailing, withInset: Constants.rightInset)
        
        stackView.addArrangedSubview(nameLabel)
        
        stackView.addArrangedSubview(addressTitleLabel)
        stackView.addArrangedSubview(addressLabel)
        
        stackView.addArrangedSubview(emailTitleLabel)
        stackView.addArrangedSubview(emailLabel)
        
        stackView.addArrangedSubview(phoneTitleLabel)
        stackView.addArrangedSubview(phoneLabel)
        
        stackView.addArrangedSubview(academicOpportunitiesTitleLabel)
        stackView.addArrangedSubview(academicOpportunitiesLabel)
        
        stackView.addArrangedSubview(gradesTitleLabel)
        stackView.addArrangedSubview(gradesLabel)
        
        stackView.addArrangedSubview(websiteTitleLabel)
        stackView.addArrangedSubview(websiteLabel)

    }
    
    func populate(_ school: School) {
        self.school = school
        nameLabel.text = school.schoolName
        var fullAddress = ""
        var addressComponents = [String]()
        
        if let city = school.city {
            addressComponents.append(city)
        }
        if let addressLine = school.primaryAddressLine {
            addressComponents.append(addressLine)
        }
        if let zipCode = school.zip {
            addressComponents.append(zipCode)
        }
        fullAddress = addressComponents.joined(separator: ", ")
        addressLabel.text = fullAddress
        emailLabel.text = school.schoolEmail ?? ""
        phoneLabel.text = school.phoneNumber ?? ""
        var opportunitites =  [String]()
        if let op1 = school.academicOpportunities1 {
            opportunitites.append(op1)
        }
        if let op2 = school.academicOpportunities2 {
            opportunitites.append(op2)
        }
        academicOpportunitiesLabel.text = opportunitites.joined(separator: ", ")
        gradesLabel.text = school.finalGrades ?? ""
        websiteLabel.text = school.website ?? ""
    }
}
