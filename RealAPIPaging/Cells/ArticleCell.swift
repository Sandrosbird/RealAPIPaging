//
//  ArticleCell.swift
//  RealAPIPaging
//
//  Created by Emil Meshcheryakov on 11.07.2022.
//

import SwiftUI

struct ArticleCell: View, ItemView {

	var title: String
	var description: String
	var listener: NavigationContainerProtocol?

	var body: some View {
		VStack {
			Text(title.isEmpty ? description : title)
				.foregroundColor(description.isEmpty ? .gray : .black)
				.font(.system(size: 14, weight: .semibold, design: .rounded))
				.padding(.bottom, 15)
				.lineLimit(.max)
			Text(description.isEmpty ? "No data" : description)
				.foregroundColor(description.isEmpty ? .gray : .black)
				.font(.system(size: 12, weight: .medium, design: .default))
				.frame(alignment: .leading)
				.lineLimit(.max)
				.frame(alignment: .leading)
		}
//		.onTapGesture {
//			listener?.push(content: ITNewsView())
//		}
	}

//	init(title: String, description: String, onTapAction: @escaping () -> Void) {
//		self.title = title
//		self.description = description
//		self.onTapAction = onTapAction
//	}
}
