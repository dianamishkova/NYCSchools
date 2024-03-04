//
//  School.swift
//  NYCSchools
//
//

import Foundation

struct School: Decodable {
    let dbn: String
    let schoolName: String?
    let overviewParagraph: String?
    let schoolEmail: String?
    let academicOpportunities1: String?
    let academicOpportunities2: String?
    let neighborhood: String?
    let phoneNumber: String?
    let website: String?
    let finalGrades: String?
    let totalStudents: String?
    let schoolSports: String?
    let primaryAddressLine: String?
    let city: String?
    let zip : String?
    let latitude: String?
    let longitude: String?
    let numberOfTestTakers: String?
    let averageMathScore: String?
    let averageCriticalReadingScore: String?
    let averageWritingScore: String?
    
    enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case overviewParagraph = "overview_paragraph"
        case schoolEmail = "school_email"
        case academicOpportunities1 = "academicopportunities1"
        case academicOpportunities2 = "academicopportunities2"
        case neighborhood
        case phoneNumber = "phoneNumber"
        case website
        case finalGrades = "finalgrades"
        case totalStudents = "total_students"
        case schoolSports = "school_sports"
        case primaryAddressLine = "primary_address_line_1"
        case city
        case zip
        case latitude
        case longitude
        case numberOfTestTakers = "num_of_sat_test_takers"
        case averageMathScore = "sat_math_avg_score"
        case averageCriticalReadingScore = "sat_critical_reading_avg_score"
        case averageWritingScore = "sat_writing_avg_score"
    }
}
