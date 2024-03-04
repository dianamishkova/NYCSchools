//
//  SchoolSATDetailsCollectionViewCell.swift
//  NYCSchools
//
//  Created by Диана Мишкова on 7.01.24.
//

import Foundation
import UIKit

class SchoolSATDetailsCollectionViewCell: UICollectionViewCell {
    private var schoolSAT: SchoolSAT?
    
    private struct Constants {
        static let leftInset: CGFloat = 10
        static let topInset: CGFloat = 10
        static let rightInset: CGFloat = 10
        static let bottomInset: CGFloat = 10
        static let borderWidth: CGFloat = 0.5
        static let cornerRadius: CGFloat = 10.0
        static let wrapperViewInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        static let spacing: CGFloat = 3.0
    }
    
    private var numberOfTestTakersTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        label.text = "school.sat.number.of.test.takers.title".localized()
        return label
    }()

    private var numberOfTestTakersLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 14)
        return label
    }()
    
    private var averageMathScoreTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        label.text = "school.sat.average.math.score.title".localized()
        return label
    }()
    
    private var averageMathScoreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 14)
        return label
    }()
    
    private var averageCriticalReadingScoreTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        label.text = "school.sat.average.critical.reading.score.title".localized()
        return label
    }()
    
    private var averageCriticalReadingScoreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 14)
        return label
    }()
    
    private var averageWritingScoreTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        label.text = "school.sat.average.writing.score.title".localized()
        return label
    }()
    
    private var averageWritingScoreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 14)
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
        
        stackView.addArrangedSubview(numberOfTestTakersTitleLabel)
        stackView.addArrangedSubview(numberOfTestTakersLabel)
        
        stackView.addArrangedSubview(averageMathScoreTitleLabel)
        stackView.addArrangedSubview(averageMathScoreLabel)
        
        stackView.addArrangedSubview(averageCriticalReadingScoreTitleLabel)
        stackView.addArrangedSubview(averageCriticalReadingScoreLabel)
        
        stackView.addArrangedSubview(averageWritingScoreTitleLabel)
        stackView.addArrangedSubview(averageWritingScoreLabel)
    }
    
    func populate(schoolSAT: SchoolSAT) {
        self.schoolSAT = schoolSAT
        
        numberOfTestTakersLabel.text = schoolSAT.numberOfTestTakers ?? ""
        averageMathScoreLabel.text = schoolSAT.averageMathScore ?? ""
        averageCriticalReadingScoreLabel.text = schoolSAT.averageCriticalReadingScore ?? ""
        averageWritingScoreLabel.text = schoolSAT.averageWritingScore ?? ""
    }
}
