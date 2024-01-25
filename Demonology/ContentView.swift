//
//  ContentView.swift
//  Demonology
//
//  Created by Ricardo Herrera on 1/24/24.
//

import SwiftUI

struct ContentView: View {
	@Environment(GameManager.self) var gm
	var body: some View {
		TabView {
			SoulCollecting()
				.tabItem {
					Text("Soul Collecting")
				}
		}
		.onAppear {
			gm.updateTimer = Timer.scheduledTimer(withTimeInterval: gm.tickInterval, repeats: true) {
				_ in
				gm.update()
			}
		}
	}
}

