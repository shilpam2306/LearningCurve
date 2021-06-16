//
//  asycAwait.swift
//  Tumble
//
//  Created by Shilpa M on 31/05/21.
//

import Foundation


class completionHand {

    func fetchWeatherHistory(completion : @escaping ([Double])-> Void) {
        // Complex networking code here; we'll just send back 100,000 random temperatures
            DispatchQueue.global().async {
                let results = (1...100_000).map { _ in Double.random(in: -10...30) }
                completion(results)
            }
    }
    
    func calculateAverageTemp(for records : [Double] , completion : @escaping (Double) -> Void) {
        // Sum our array then divide by the array size
        DispatchQueue.global().async {
            let total = records.reduce(0){$0 + $1}
            let average = total/Double(records.count)
            completion(average)
        }
    }
    
    func upload(result : Double , completion : @escaping (String) -> Void ) {
        // More complex networking code; we'll just send back "OK"
        DispatchQueue.global().async {
                completion("OK")
        }
    }
    


}

//When it comes to using above  code, we need to call them one by one in a chain, providing completion closures for each one to continue the chain, like this:

class viewModel {
    var asycA : completionHand?
    
    init() {
        asycA = completionHand()
    }
    
    func fetch() {
        asycA?.fetchWeatherHistory(completion: { (records) in
            self.asycA?.calculateAverageTemp(for: records, completion: { (average) in
                self.asycA?.upload(result: average, completion: { (response) in
                    print("Server response: \(response)")
                })
            })
        })
    }
}







//Async Wait Swit 5.5

//From Swift 5.5, we can now clean up our functions by marking them as asynchronously returning a value rather than relying on completion handlers, like this:
    
//class asycAwait {
//
//    func fetchWeatherHistory() async -> [Double] {
//        (1...100_000).map { _ in Double.random(in: -10...30) }
//    }
//
//    func calculateAverageTemperature(for records: [Double]) async -> Double {
//        let total = records.reduce(0, +)
//        let average = total / Double(records.count)
//        return average
//    }
//
//    func upload(result: Double) async -> String {
//        "OK"
//    }
//
//    //That has already removed a lot of the syntax around returning values asynchronously, but at the call site it’s even cleaner:
//    func processWeather() async {
//        let records = await fetchWeatherHistory()
//        let average = await calculateAverageTemperature(for: records)
//        let response = await upload(result: average)
//        print("Server response: \(response)")
//    }
//
//}

//That has already removed a lot of the syntax around returning values asynchronously, but at the call site it’s even cleaner:

//class viewModel {
//    func processWeather() async {
//        let records = await fetchWeatherHistory()
//        let average = await calculateAverageTemperature(for: records)
//        let response = await upload(result: average)
//        print("Server response: \(response)")
//    }
//}
