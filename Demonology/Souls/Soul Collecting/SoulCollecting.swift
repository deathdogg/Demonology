//
//  SoulCollecting.swift
//  Demonology
//
//  Created by Ricardo Herrera on 1/24/24.
//

import SwiftUI

struct SoulCollecting: View {
	@Environment(GameManager.self) private var gm
	var body: some View {
		VStack {
			Section("Clicky") {
				Text("Souls: \(self.gm.soulAmount)")
				Button("Collect Soul") {
					gm.addSouls(1)
				}
			}
			Section("Automation") {
				Text("Minor Devils")
				if gm.soulAmount > 0 {
					Button("Buy Minor Devil for \(MinorDevil().cost) Souls") {
						gm.addWorker(.minorDevil, 1)
					}
					.disabled(gm.soulAmount < MinorDevil().cost)

				}
			}
		}
	}
}

#Preview {
	SoulCollecting()
}
