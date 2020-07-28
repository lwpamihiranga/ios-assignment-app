//
//  MyDataModel.swift
//  iOS Assignment
//
//  Created by Amith Mihiranga on 7/28/20.
//  Copyright © 2020 Amith Mihiranga. All rights reserved.
//

import Foundation

struct DetailsResponse: Decodable {
    var response: Details
}

struct Details: Decodable {
    var details: [MyDetail]
}

struct MyDetail: Decodable {
    let id: String
    let title: String
    let description: String
    let address: String
    let postcode: String
    let phoneNumber: String
    let latitude: String
    let longitude: String
    let image: ImageInfo
}

struct ImageInfo: Decodable {
    var small: String
    var medium: String
    var large: String
}
