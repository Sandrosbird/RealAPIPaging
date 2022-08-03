//
//  NewsViewModel.swift
//  RealAPIPaging
//
//  Created by Emil Meshcheryakov on 11.07.2022.
//

import UIKit
import NewsAPI

final class NewsViewModel: ObservableObject {
	@Published var articles: [Article] = .init()
	@Published var listType = 0
	var listTypes = ["IT", "iOS", "Moscow"]
	let apiKey = "7c6191b486374e129d3bc56daca3f922"
	let q: String

	init(q: String) {
		self.q = q
		ArticlesAPI.everythingGet(q: self.q,
								  from: "2022-07-01",
								  sortBy: "publishedAT",
								  language: "ru",
								  apiKey: apiKey) { data, error in
			if let error = error {
				debugPrint("❌", error)
			}
			self.articles = data?.articles ?? []
		}
	}
}
