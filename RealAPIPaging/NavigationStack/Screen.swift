//
//  Screen.swift
//  Otus_NavigationLesson
//
//  Created by Emil Meshcheryakov on 28.06.2022.
//

import SwiftUI

struct Screen: Identifiable, Equatable {
	public let id = UUID()
	public let screen: AnyView

	// MARK: - Equatable
	static func == (lhs: Screen, rhs: Screen) -> Bool {
		lhs.id == rhs.id
	}

	

}
