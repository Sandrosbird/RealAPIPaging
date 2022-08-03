//
//  iOSNewsView.swift
//  RealAPIPaging
//
//  Created by Emil Meshcheryakov on 11.07.2022.
//

import SwiftUI

struct IOSNewsView: View, ItemView {
	var listener: NavigationContainerProtocol?

	@StateObject var viewModel: NewsViewModel = .init(q: "iOS")
	@State var isPresented: Bool = false
	@State var selectedTitle: String?
	@State var selectedDescription: String?
	@State var selectedImageURL: String?

	var body: some View {
		List(viewModel.articles) { article in
			let title = article.title ?? ""
			let description = article.description ?? ""
			ArticleCell(title: title, description: description)
				.onTapGesture {
					isPresented.toggle()
					self.selectedTitle = article.title ?? ""
					self.selectedDescription = article.description ?? ""
					listener?.push(content: NewsDetailView(title: selectedTitle, description: selectedDescription, listener: listener))
				}

		}
		.frame(alignment: .topLeading)
		.listStyle(.plain)
	}
}
