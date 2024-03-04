//
//  SchoolSAT.swift
//  NYCSchools
//
//  Created by Диана Мишкова on 7.01.24.
//

import Foundation

struct SchoolSAT: Decodable {
    let dbn: String
    let schoolName: String?
    let numberOfTestTakers: String?
    let averageMathScore: String?
    let averageCriticalReadingScore: String?
    let averageWritingScore: String?
    
    enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case numberOfTestTakers = "num_of_sat_test_takers"
        case averageMathScore = "sat_math_avg_score"
        case averageCriticalReadingScore = "sat_critical_reading_avg_score"
        case averageWritingScore = "sat_writing_avg_score"
    }
}


