//
//  DemonologyApp.swift
//  Demonology
//
//  Created by Ricardo Herrera on 1/24/24.
//

import SwiftUI

@main
struct DemonologyApp: App {
	var body: some Scene {
		WindowGroup {
			ContentView()
				.environment(GameManager())
		}
	}
}
