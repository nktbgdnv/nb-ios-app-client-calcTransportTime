// create a collection - an array of dictionaries
let newStationsData : [[String : Int]] = [["Ostankino" : 0], ["VVC" : 3], ["Dokukina" : 7], ["Raduzhnaya" : 12], ["Polyarnaya" : 20], ["Poliklinika" : 22], ["Tihomirova" : 30], ["Medvedkovo" : 40]]

// initialize a function that calculates the distance between stations
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
    // returns the distance modulus (if the passenger is traveling in the opposite direction)
    return abs(distance)
}

// function of checking the presence of stations #1 and #2 in the original collection
// if you enter a station not from the collection - prints an error message
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
        print("Please, check the spelling of the station names!")
        return false
    }
}

// call the function that calculates the distance between the given stations
var distanceBetweenStations = calculateDistance(from: "Raduzhnaya", to: "Polyarnaya")
print("The duration of the trip between the selected stations will be: \(distanceBetweenStations)")
