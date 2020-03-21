//
//  HelpRquestModel.swift
//  Carry On
//
//  Created by Jonas on 21.03.20.
//  Copyright © 2020 Jonas. All rights reserved.
//

import Foundation

struct HelpRequestModel: Codable {
    let title: String
    let description: String
    let category: Int
    let date: String
    let duration: String
    let organization: String
    let location: HRLocation?
    let contact: HRContact?
}

struct HRLocation: Codable {
    let zipCode: String
    let streetName: String
    let streetNumber: String
}

struct HRContact: Codable {
    let eMailAdress: String
    let phoneNumber: String
}
