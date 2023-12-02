//
//  Person.swift
//  LoginApp
//
//  Created by Evgeni Glushko on 2.12.23.
//

struct Person {
    let firstName: String
    let lastName: String
    let age: Int
    let birthPlace: String
    let bio: String
}

let evgeniGlushko = Person(
    firstName: "Evgeni",
    lastName: "Glushko",
    age: 26,
    birthPlace: "г. Солигорск, Беларусь",
    bio: """
    Меня зовут Евгений Глушко. Мне 26 лет, родился в г. Солигорске, РБ.
    В данный момент проживаю в Минске. Последние 6 лет занимаюсь разработкой
    сайтов на WordPress, но это не то, чем бы я хотел заниматься.
    По этому решил стать IOS-Разработчиком.
    
    Хобби: Езда на велосипеде, сериалы.
    """
)
