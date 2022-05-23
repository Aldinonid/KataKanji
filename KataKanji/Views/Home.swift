//
//  Home.swift
//  KataKanji
//
//  Created by Aldino Efendi on 2022/04/19.
//

import SwiftUI

struct Home: View {
	
	@State var selectedTab: Int = 1
	
	var body: some View {
		TabView(selection: $selectedTab) {
			
			Dashboard()
				.tabItem {
					Image(systemName: "house")
					Text("Dasbor")
				}
				.tag(0)
			
			ArticleListView()
				.tabItem {
					Image(systemName: "book")
					Text("Artikel")
				}
				.tag(1)
			
			Text("Kuis View")
				.tabItem {
					Image(systemName: "lightbulb")
					Text("Kuis")
				}
				.tag(2)
			
			Text("Daftar Kanji View")
				.tabItem {
					Image(systemName: "text.book.closed")
					Text("Daftar Kanji")
				}
				.tag(3)
			
			Text("Settings View")
				.tabItem {
					Image(systemName: "gearshape")
					Text("Pengaturan")
				}
				.tag(4)
			
		}
		.accentColor(Color("Primary"))
	}
}

struct Home_Previews: PreviewProvider {
	static var previews: some View {
		Home()
	}
}
