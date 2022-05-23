//
//  ContentView.swift
//  KataKanji
//
//  Created by Aldino Efendi on 2022/04/19.
//

import SwiftUI

struct ContentView: View {
	@State var tabSelection: Tabs = .tab2
	var body: some View {
		Home()
//		NavigationView {
//			TabView(selection: $tabSelection) {
//				Dashboard()
//					.tabItem {
//						Image(systemName: "house")
//						Text("Dasbor")
//					}
//					.tag(Tabs.tab1)
//
//				ArticleListView()
//					.tabItem {
//						Image(systemName: "book")
//						Text("Artikel")
//					}
//					.tag(Tabs.tab2)
//
//				Text("Kuis View")
//					.tabItem {
//						Image(systemName: "lightbulb")
//						Text("Kuis")
//					}
//					.tag(Tabs.tab3)
//
//				Text("Daftar Kanji View")
//					.tabItem {
//						Image(systemName: "text.book.closed")
//						Text("Daftar Kanji")
//					}
//					.tag(Tabs.tab4)
//
//				Text("Settings View")
//					.tabItem {
//						Image(systemName: "gearshape")
//						Text("Pengaturan")
//					}
//					.tag(Tabs.tab5)
//			}
//			.accentColor(Color("Primary"))
//		}
	}
}

enum Tabs {
	case tab1, tab2, tab3, tab4, tab5
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
