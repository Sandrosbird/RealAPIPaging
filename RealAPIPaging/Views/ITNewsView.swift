//
//  ITNewsView.swift
//  RealAPIPaging
//
//  Created by Emil Meshcheryakov on 08.07.2022.
//

import SwiftUI

struct ITNewsView: View, ItemView {

	@StateObject var viewModel: NewsViewModel = .init(q: "IT")
	@State var isPresented: Bool = false
	@State var selectedTitle: String?
	@State var selectedDescription: String?

	var listener: NavigationContainerProtocol?

    var body: some View {
		List(viewModel.articles) { article in
			let title = article.title ?? ""
			let description = article.description ?? ""
			ArticleCell(title: title, description: description)
				.onTapGesture(count: 1) {
					self.selectedTitle = article.title ?? ""
					self.selectedDescription = article.description ?? ""
					withAnimation(.easeInOut) {
						isPresented.toggle()
						listener?.push(content: NewsDetailView(title: selectedTitle, description: selectedDescription, listener: listener))
					}
				}
		}
		.listStyle(.plain)
	}
}
//
//struct ITNewsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ITNewsView()
//    }
//}
