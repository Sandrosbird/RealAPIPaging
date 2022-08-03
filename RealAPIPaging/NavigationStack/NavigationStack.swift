//
//  NavigationStack.swift
//  Otus_NavigationLesson
//
//  Created by Emil Meshcheryakov on 28.06.2022.
//

import Foundation

public struct NavigationStack {
	private var screens: [Screen] = [Screen]()

	func top() -> Screen? { // rename: getLast
		self.screens.last
	}

	mutating func push(_ screen: Screen) {
		self.screens.append(screen)
	}

	mutating func pop() {
		_ = self.screens.popLast()
	}

	mutating func popToRoot() {
		self.screens.removeAll()
	}
}
