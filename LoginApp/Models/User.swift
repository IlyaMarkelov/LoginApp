//
//  Model.swift
//  LoginApp
//
//  Created by Илья Маркелов on 30.10.2021.
//

import Foundation

struct User {
    var login: String
    let password: String
    let fullname: FullName
    let years: Int
    let city: String
    let experience: Int
    let hobbies: [Hobbies]
    
    static func getUserData() -> User {
       User(login: "User",
            password: "Password",
            fullname: FullName(name: "Илья", secondName: "Маркелов"),
            years: 27,
            city: "Москва",
            experience: 5,
            hobbies: [.camping, .coding, .computerGames, .cooking, .guiter])
    }
}

struct FullName {
    let name: String
    let secondName: String
    var fullName: String {
        "\(name) \(secondName)"
    }
}

enum Hobbies: String {
    case computerGames = "Компьютерные игры"
    case guiter = "Игра на гитаре"
    case camping = "Походы"
    case coding = "Программирование"
    case cooking = "Кулинария"
}
