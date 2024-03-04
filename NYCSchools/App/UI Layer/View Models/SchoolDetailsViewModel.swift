//
//  SchoolDetailsViewModel.swift
//  NYCSchools
//
//  Created by Диана Мишкова on 6.01.24.
//

import Foundation

class SchoolDetailsViewModel {
    private(set) var school: School
    private(set) var schoolSAT: SchoolSAT
    
    init(school: School, schoolSAT: SchoolSAT) {
        self.school = school
        self.schoolSAT = schoolSAT
    }
}
