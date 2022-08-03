//
//  View+AnyView.swift
//  Otus_NavigationLesson
//
//  Created by Emil Meshcheryakov on 28.06.2022.
//

import SwiftUI

extension View {
	func toAnyView() -> AnyView {
		return AnyView(self)
	}
}
