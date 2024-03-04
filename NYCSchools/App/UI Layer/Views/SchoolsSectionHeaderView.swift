//
//  SchoolsSectionHeaderView.swift
//  NYCSchools
//
//  Created by Диана Мишкова on 6.01.24.
//

import Foundation
import UIKit

class SchoolsSectionHeaderView: UICollectionReusableView {
    private struct Constants {
        static let edgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 5)
    }
    
    var headerLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.font = UIFont.systemFont(ofSize: 18)
        return headerLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init (coder:) has not been implemented")
    }
    
    func setupViews(){
        addSubview(headerLabel)
        headerLabel.autoPinEdgesToSuperviewEdges(with: Constants.edgeInsets)
    }
}
