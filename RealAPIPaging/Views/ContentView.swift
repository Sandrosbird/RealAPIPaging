//
//  ContentView.swift
//  RealAPIPaging
//
//  Created by Emil Meshcheryakov on 08.07.2022.
//

import SwiftUI
import NewsAPI

struct ContentView: View, ItemView {
	var listener: NavigationContainerProtocol?
	
	@StateObject var viewModel: NewsViewModel = .init(q: "")

	var body: some View {
			VStack {
				Picker("News", selection: $viewModel.listType) {
					ForEach(0..<viewModel.listTypes.count) { index in
						Text(viewModel.listTypes[index])
							.tag(index)
					}
				}
				.pickerStyle(SegmentedPickerStyle())
				Spacer()
				switch viewModel.listType {
				case 0:
					ITNewsView(listener: listener)
				case 1:
					IOSNewsView(listener: listener)
				case 2:
					MoscowNewsView(listener: listener)
				default:
					NoContentView(listener: listener)
				}
			}
			.navigationTitle("News")
		}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
