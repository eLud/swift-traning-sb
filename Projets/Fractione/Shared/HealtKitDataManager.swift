//
//  HealtKitDataManager.swift
//  Fractione
//
//  Created by Ludovic Ollagnier on 22/06/2021.
//

import Foundation
import HealthKit

class HealtKitDataManager: ObservableObject {

    @Published var heartRate: Int = 0

    private var store: HKHealthStore
    private let heartRateUnit = HKUnit(from: "count/min")
    private var currentHRQuery: HKQuery?

    init() {
        self.store = HKHealthStore()
        authorizeIfNeeded()
    }

    func startHeartRateUpdate() {
        startHeartRateQuery(quantityTypeIdentifier: .heartRate)
    }

    func stopHeartRateUpdate() {
        if let query = currentHRQuery {
            store.stop(query)
        }
    }

    private func authorizeIfNeeded() {

        // On vérifie que des données de santé sont dispo
        guard HKHealthStore.isHealthDataAvailable() else { return }

        //
        guard let heartRateQuantity = HKObjectType.quantityType(forIdentifier: .heartRate) else { return }
        guard store.authorizationStatus(for: heartRateQuantity) == .notDetermined else { return }

        self.store.requestAuthorization(toShare: nil, read: [heartRateQuantity]) { success, error in
            // Code qui gère la réponse
        }
    }

    private func startHeartRateQuery(quantityTypeIdentifier: HKQuantityTypeIdentifier) {

        // On crée un prédicat pour les objets HK locaux
        let devicePredicate = HKQuery.predicateForObjects(from: [HKDevice.local()])

        // On prépare le code qui va gérer l'arrivée de nouvelles données depuis HealthKit
        let updateHandler: (HKAnchoredObjectQuery, [HKSample]?, [HKDeletedObject]?, HKQueryAnchor?, Error?) -> Void = {
            query, samples, deletedObjects, queryAnchor, error in

            guard let samples = samples as? [HKQuantitySample] else {
                return
            }
            self.process(samples, type: quantityTypeIdentifier)
            print(samples.count)
        }

        let resultHandler: (HKAnchoredObjectQuery, [HKSample]?, [HKDeletedObject]?, HKQueryAnchor?, Error?) -> Void = {
            _, _, _, _, _ in
        }

        // On crée la requete pour le heartRate
        let query = HKAnchoredObjectQuery(type: HKObjectType.quantityType(forIdentifier: quantityTypeIdentifier)!,
                                          predicate: devicePredicate,
                                          anchor: nil,
                                          limit: HKObjectQueryNoLimit,
                                          resultsHandler: updateHandler)

        query.updateHandler = updateHandler

        // 5
        store.execute(query)
        self.currentHRQuery = query
    }

    private func process(_ samples: [HKQuantitySample], type: HKQuantityTypeIdentifier) {
        var lastHeartRate = 0.0
        for sample in samples {
            if type == .heartRate {
                lastHeartRate = sample.quantity.doubleValue(for: heartRateUnit)
            }
        }
        DispatchQueue.main.async {
            self.heartRate = Int(lastHeartRate)
        }
    }
}
