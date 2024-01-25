//
//  Demon Management.swift
//  Demonology
//
//  Created by Ricardo Herrera on 1/24/24.
//

import Foundation
protocol Demon: Hashable {
	var kind: Demons { get set }
	var description: String { get }
	var cost: Int { get }
}
protocol SoulSucker: Demon {
	var soulsPerTurn: Int { get }
}
protocol Torturerr: Demon {

}
class PlayerDemon {
	var name = "Player"

}

struct MinorDevil: SoulSucker {
	var kind: Demons = .minorDevil
	var description: String = "They may be minor, but don't underestimate a minor devil. Due to their low power output, they can be hard to detect, and are critical for prepairing souls before entering your realm."
	let soulsPerTurn = 1
	var cost: Int = 500
}

struct Devil: SoulSucker {
	var kind: Demons = .devil
	var description: String = "Slightly more powerful than a Minor Devil, Devils can capture stronger souls, or multiple weaker ones"
	let soulsPerTurn: Int = 2
	var cost: Int = 1000
}
