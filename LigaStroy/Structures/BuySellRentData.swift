//
//  BuySellRentData.swift
//  LigaStroy
//
//  Created by Олег Дмитриев on 18.08.2024.
//

struct BuySellRentData {
    let title: String
    let descr: String
    
    static func mockData() -> [BuySellRentData] {
        [
            BuySellRentData(title: "Купить", descr: "Подберем \nподходящий \nобъект"),
            BuySellRentData(title: "Продать", descr: "Сами найдем \nпокупателя"),
            BuySellRentData(title: "Аренда", descr: "Поможем найти удобный вариант аренды")
        ]
    }
}
