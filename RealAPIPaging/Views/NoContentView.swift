//
//  NoContentView.swift
//  RealAPIPaging
//
//  Created by Emil Meshcheryakov on 08.07.2022.
//

import SwiftUI

struct NoContentView: View, ItemView {
	var listener: NavigationContainerProtocol?
	
    var body: some View {
		Spacer()
        Text("News didn't loaded!")
		Spacer()
    }
}

struct NoContentView_Previews: PreviewProvider {
    static var previews: some View {
        NoContentView()
    }
}
