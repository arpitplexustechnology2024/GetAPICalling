//
//  Model.swift
//  GetAPICalling
//
//  Created by Arpit iOS Dev. on 04/06/24.
//

import Foundation
import UIKit

struct UserData {
    
    var postId = 0
    var id = 0
    var name = ""
    var email = ""
    var body = ""
    
    init(dic : NSDictionary) {
        self.postId = (dic["postId"] as? Int) ?? 0
        self.id = (dic["id"] as? Int) ?? 0
        self.name = (dic["name"] as? String) ?? ""
        self.email = (dic["email"] as? String) ?? ""
        self.body = (dic["body"] as? String) ?? ""
    }
}

// MARK: - Welcome
struct Welcome: Decodable {
    let status: String
    let data: [Datum]
    let message: String
}

// MARK: - Datum
struct Datum: Decodable {
    let id: Int
    let employeeName: String
    let employeeSalary, employeeAge: Int
    let profileImage: String

    enum CodingKeys: String, CodingKey {
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
    }
}
