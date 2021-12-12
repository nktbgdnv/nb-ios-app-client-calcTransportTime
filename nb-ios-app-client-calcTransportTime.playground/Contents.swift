// Курсовая работа по теме "Основы Swift"
// создаем коллекцию - массив из словарей
let newStationsData : [[String : Int]] = [["Ostankino" : 0], ["VVC" : 3], ["Dokukina" : 7], ["Raduzhnaya" : 12], ["Polyarnaya" : 20], ["Poliklinika" : 22], ["Tihomirova" : 30], ["Medvedkovo" : 40]]

// инициализируем функцию, вычисляющую расстояние между станциями
func calculateDistance(from firstStation: String, to secondStation: String) -> Int {
    var distance = 0
    if checkStationsInCollection(firstStation, secondStation) {
        for element in newStationsData {
            for (station, time) in element {
                if station == firstStation {
                    distance += time
                }
                if station == secondStation {
                    distance -= time
                }
            }
        }
    }
    return abs(distance)        // возвращает модуль расстояния (если пассажир едет в обратном направлении)
}

// функция проверки наличия станций №1 и №2 в исходной коллекции
// если ввести станцию не из коллекции - печатает сообщение об ошибке
func checkStationsInCollection(_ firstStation: String, _ secondStation: String) -> Bool {
    var isFirstStationIsInCollection = false
    var isSecondStationIsInCollection = false
    for element in newStationsData {
        for (station, _) in element {
            if station == firstStation {
                isFirstStationIsInCollection = true
            }
            if station == secondStation {
                isSecondStationIsInCollection = true
            }
        }
    }
    if isFirstStationIsInCollection && isSecondStationIsInCollection {
        return true
    } else {
        print("Проверьте правильность написания названий станций!")
        return false
    }
}

// вызываем функцию, вычисляющую расстояние между заданными станциями
var distanceBetweenStations = calculateDistance(from: "Raduzhnaya", to: "Polyarnaya")
print("Длительность поездки между выбранными станциями составит: \(distanceBetweenStations)")
