//
//  NavigationContainer.swift
//  Otus_NavigationLesson
//
//  Created by Emil Meshcheryakov on 28.06.2022.
//

import SwiftUI

protocol ItemView: View {
	var listener: NavigationContainerProtocol? { get set }
}

protocol NavigationContainerProtocol {
	func push<Content: View & ItemView>(content: Content)

	func pop()

	func popToRoot()
}

struct NavigationContainer<Content: View & ItemView>: View, NavigationContainerProtocol {

	@ObservedObject var viewModel = NavigationContainerViewModel()
	private var content: Content

	init(@ViewBuilder content: @escaping () -> Content) {
		self.content = content()
		self.content.listener = self
	}

    var body: some View {
		let isRoot = viewModel.currentScreen == nil
		return ZStack {
			if isRoot {
				NavigationView{
					content
				}
			} else {
				viewModel.currentScreen?.screen
			}
		}
	}

	func push<Content>(content: Content) where Content : View & ItemView {
		var newContent = content
		newContent.listener = self
		self.viewModel.push(content.toAnyView())
	}

	func pop() {
		self.viewModel.pop()
	}

	func popToRoot() {
		self.viewModel.popToRoot()
	}

}
