//
//  NewsDetailView.swift
//  RealAPIPaging
//
//  Created by Emil Meshcheryakov on 21.07.2022.
//

import SwiftUI

struct NewsDetailView: View, ItemView {
	var listener: NavigationContainerProtocol?

	private var title: String?
	private var description: String?

	init(title: String?, description: String?, listener: NavigationContainerProtocol?) {
		self.title = title
		self.description = description
		self.listener = listener
	}

    var body: some View {
		VStack {
			Spacer()
			Text(title ?? "NoTitle")
				.bold()
				.padding(.bottom, 10)
			Text(description ?? "NoDescription")
			Spacer()
			Button {
				listener?.popToRoot()
			} label: {
				Text("Назад к списку")
			}

		}
		.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
    }
}
