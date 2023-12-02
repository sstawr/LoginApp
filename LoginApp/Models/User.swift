//
//  User.swift
//  LoginApp
//
//  Created by Evgeni Glushko on 2.12.23.
//

struct User {
    let userName: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(userName: "user", password: "111", person: evgeniGlushko)
    }
}
