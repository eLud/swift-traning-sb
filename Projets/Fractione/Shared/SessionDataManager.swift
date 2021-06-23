//
//  SessionDataManager.swift
//  Fractione
//
//  Created by Ludovic Ollagnier on 23/06/2021.
//

import Foundation
import WatchConnectivity
import CoreLocation

class SessionDataManager: NSObject, ObservableObject {

    let session: WCSession

    override init() {
        self.session = WCSession.default
        super.init()

        self.session.delegate = self
        self.session.activate()
    }

    func sendData(track: [CLLocation]) {
        if let data = try? NSKeyedArchiver.archivedData(withRootObject: track, requiringSecureCoding: true) {
            if session.activationState == .activated {
                session.sendMessageData(data, replyHandler: nil) { error in
                    print(error)
                }
            }
        }
    }
}

extension SessionDataManager: WCSessionDelegate {

    #if os(iOS)
    func sessionDidBecomeInactive(_ session: WCSession) {

    }

    func sessionDidDeactivate(_ session: WCSession) {

    }
    #endif

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {

    }

    func session(_ session: WCSession, didReceiveMessageData messageData: Data) {
        if let track = try? NSKeyedUnarchiver.unarchivedArrayOfObjects(ofClass: CLLocation.self, from: messageData) {

            let userDefaults = UserDefaults.standard

            if var existingTacks = userDefaults.object(forKey: "tracks") as? [Data] {
                existingTacks.append(messageData)
                userDefaults.set(existingTacks, forKey: "tracks")
            } else {
                let newArray = [messageData]
                userDefaults.set(newArray, forKey: "tracks")
            }
        }
    }

    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        print(message)
        replyHandler(["received":"OK"])
    }
}
