//
//  StudentProfile.swift
//  IOSExample
//
//  Created by Istar Feroz on 10/10/17.
//  Copyright © 2017 Istar Feroz. All rights reserved.
//{"email":"vinay_sales@istarindia.com","mobile":9985915700,"profileImage":"http:\/\/business.talentify.in:9999\/users\/449\/8a74ac00-c354-47bf-a68b-3ce3c7578d0e.jpg","lastName":"","gender":"MALE","dateOfBirth":"2017-07-13 00:00:00","isVerified":true,"userType":"TRAINER","location":"Bangalore","id":449,"coins":0,"authenticationToken":"k6wEXEYeIKf1ZSRpXVru","batchRank":11,"firstName":"Vinay","userCategory":"COLLEGE_STUDENT","experiencePoints":0}

import Foundation

class StudentProfile: Codable {
    
    var id: Int?
    var coins: Int?
    var experiencePoints: Int?
    var batchRank: Int?
    var isVerified: Bool?
    var email: String?
    var firstName: String?
    var lastName: String?
    var dateOfBirth: String?
    var gender: String?
    var mobile: Int64?
    var location: String?
    var profileImage: String?
    var authenticationToken: String?
    var userType: String?
    var userCategory: String?
    
    
}

