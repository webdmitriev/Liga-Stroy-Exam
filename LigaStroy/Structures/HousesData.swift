//
//  HousesData.swift
//  LigaStroy
//
//  Created by Олег Дмитриев on 18.08.2024.
//

struct HousesData {
    let image: String
    let title: String
    let descr: String
    let price: String
    let items: [HousesDataItems]
    
    static func mockData() -> [HousesData] {
        [
            HousesData(image: "image-01", title: "Ольховый Квартал",
                       descr: "Москва, поселение Сосенское, деревня Столбово", price: "8 029 445",
                       items: [
                HousesDataItems(label: "Студии", value: "от 10,1 млн ₽"),
                HousesDataItems(label: "1-комн.", value: "от 8 млн ₽"),
                HousesDataItems(label: "2-комн.", value: "от 11,4 млн ₽"),
            ]),
            HousesData(image: "image-02", title: "Новое Видное",
                       descr: "Городское поселение Горки Ленинские, Ленинский городской округ, Московская область", price: "4 735 485",
                       items: [
                HousesDataItems(label: "Студии", value: "от 4,7 млн ₽"),
                HousesDataItems(label: "1-комн.", value: "от 5,6 млн ₽"),
                HousesDataItems(label: "2-комн.", value: "от 6,3 млн ₽"),
            ]),
        ]
    }
}

struct HousesDataItems {
    let label: String
    let value: String
}
