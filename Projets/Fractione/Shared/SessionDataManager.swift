//
//  SessionDataManager.swift
//  Fractione
//
//  Created by Ludovic Ollagnier on 23/06/2021.
//

import Foundation
import WatchConnectivity

class SessionDataManager: NSObject, ObservableObject {

    let session: WCSession

    override init() {
        self.session = WCSession.default
        super.init()

        self.session.delegate = self
        self.session.activate()
    }

    func sendData() {

        if session.activationState == .activated {
            session.sendMessage(["message":"Hello"], replyHandler: nil, errorHandler: nil)
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
}
