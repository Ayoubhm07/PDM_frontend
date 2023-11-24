//
//  Gestion_PostApp.swift
//  Gestion_Post
//
//  Created by TuniC on 7/11/2023.
//

import SwiftUI

@available(iOS 17.0, *)
@main
struct Gestion_PostApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


func requestNotificationAuthorization() {
    let center = UNUserNotificationCenter.current()
    center.requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
        if let error = error {
            print("Erreur lors de la demande d'autorisation des notifications : \(error)")
        }
    }
}
