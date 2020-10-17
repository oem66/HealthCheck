//
//  HealthKitHelper.swift
//  HealthCheck
//
//  Created by Omer Rahmanovic on 10/17/20.
//

import Foundation
import HealthKit

class HealthKitHelper {
    
    // Health Store instance for whole app
    let healthStore = HKHealthStore()
    
    // 1.Check if HealthKit is available on device
    func isHealthKitAvailable(completion: @escaping (String) -> Void) {
        if HKHealthStore.isHealthDataAvailable() {
            let message = "HealthKit is available on this device!"
            dataToReadWrite()
            completion(message)
        } else {
            let message = "HealthKit is not available on this device!"
            completion(message)
        }
    }
    
    // 2.Preparing data types to read/write to Health Store
    func dataToReadWrite() {
        let readTypes = Set([HKObjectType.quantityType(forIdentifier: .flightsClimbed)!,
                             HKObjectType.quantityType(forIdentifier: .stepCount)!,
                             HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning)!,
                             HKObjectType.quantityType(forIdentifier: .bodyMass)!,
                             HKObjectType.quantityType(forIdentifier: .height)!,
                             HKObjectType.quantityType(forIdentifier: .bodyFatPercentage)!,
                             HKObjectType.quantityType(forIdentifier: .bodyTemperature)!,
                             HKObjectType.quantityType(forIdentifier: .bloodPressureDiastolic)!,
                             HKObjectType.quantityType(forIdentifier: .bloodPressureSystolic)!,
                             HKObjectType.quantityType(forIdentifier: .heartRate)!,
                             HKObjectType.quantityType(forIdentifier: .uvExposure)!,
                             HKObjectType.quantityType(forIdentifier: .bloodGlucose)!
        ])
        
        // 3. Request Authorization to read data
        healthStore.requestAuthorization(toShare: nil, read: readTypes) { (success, error) in
            if success {
                print("Successfully authorized to read data from Health Store")
            } else {
                print("Unauthorized to read data from Health Store. Error details: \(error?.localizedDescription)")
            }
        }
    }
    
}
