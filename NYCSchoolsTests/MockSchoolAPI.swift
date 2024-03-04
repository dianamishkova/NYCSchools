//
//  MockSchoolAPI.swift
//  NYCSchoolsTests
//
//  Created by Диана Мишкова on 5.01.24.
//

import Foundation
@testable import NYCSchools

class MockSchoolAPI: SchoolAPILogic {
    var loadState: SchoolListLoadState = .empty
    func getSchools(completion: @escaping (NYCSchools.SchoolListAPIResponse)) {
        switch loadState {
        case .error:
            completion(.failure(.networkingError("Could not fetch schools")))
        case .loaded:
            let mockSchool = School(dbn: "02M260",
                                    schoolName: "Clinton School Writers & Artists, M.S. 260",
                                    overviewParagraph: "Students who are prepared for college must have an education that encourages them to take...",
                                    schoolEmail: "admissions@theclintonschools.net",
                                    academicOpportunities1: "Free college courses at neighboring universities",
                                    academicOpportunities2: "International Travel, Special Arts Programs, Music, Internships, College Mentoring English Language Learner Programs: English as a New Language",
                                    neighborhood: "Chelsea-Union Sq",
                                    phoneNumber: "212-524-4360",
                                    website: "www.theclintonschool.net",
                                    finalGrades: "6-12",
                                    totalStudents: "376",
                                    schoolSports: "Cross Country, Track and Field, Soccer, Flag Football, Basketball",
                                    primaryAddressLine: "10 East 15th Street",
                                    city: "Manhattan",
                                    zip: "10003",
                                    latitude: "40.73653",
                                    longitude: "-73.9927")
            completion(.success([mockSchool]))
        case .empty:
            completion(.success([]))
        }
    }
    
    
}
