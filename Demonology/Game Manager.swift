//
//  Game Manager.swift
//  Demonology
//
//  Created by Ricardo Herrera on 1/24/24.
//

import Foundation
typealias WorkerInfo = (demon: any Demon, amount: Int)
@Observable
@MainActor
class GameManager {
	init() {

	}
	var tickInterval = 1.0
	var updateTimer: Timer?
	var player: PlayerDemon = PlayerDemon()
	private var souls: [Soul] = []
	var soulAmount: Int {
		return self.souls.count
	}
	var workers: [Demons: WorkerInfo] = [:]
	func addSouls(_ amount: Int) {
		if amount <= 0 {
			return
		}
		for _ in 0..<amount {
			souls.append(Soul())
		}
	}
	func removeSouls(_ amount: Int) {
		for _ in 0..<amount {
			souls.removeLast()
		}
	}
	func addWorker(_ type: Demons, _ amount: Int) {
		if let existingInfo = self.workers[type] {
			if existingInfo.amount <= 0 {
				let newInfo: WorkerInfo = (demon: existingInfo.demon, amount: amount)
				self.workers[type] = newInfo
				return
			} else {
				let newInfo: WorkerInfo = (demon: existingInfo.demon, amount: existingInfo.amount+amount)
				return
			}
		}
		var info: WorkerInfo
		info.amount = amount
		switch type {
		case .minorDevil:
			info.demon = MinorDevil()
		case .devil:
			info.demon = Devil()
		}
		self.workers[type] = info
	}
	func update() {
		if self.workers.isEmpty {
			return
		}
		self.workers.values.forEach {
			info in
			if let demon = info.demon as? any SoulSucker {
				self.addSouls(demon.soulsPerTurn*info.amount)
			}
		}
	}
}

enum Demons: CaseIterable {
	case minorDevil
	case devil
}
