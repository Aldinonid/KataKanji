//
//  ArticleList.swift
//  KataKanji
//
//  Created by Aldino Efendi on 2022/05/03.
//

import SwiftUI

struct ArticleListView: View {
	
	@StateObject var vm = ArticleListViewModel()
	@State var searchedText: String = ""
	@State var selection: String = "Pemula"
	
	var body: some View {
		NavigationView {
			VStack {
				List {
					ForEach(vm.articles.filter({
						!searchedText.isEmpty ? $0.articleID.localizedStandardContains(searchedText) : !selection.localizedStandardContains("Semua") ? $0.level == selection : true
					})) { article in
						NavigationLink(destination: DetailArticleView(article: article)) {
							CellContent(article: article)
						}
					}
				}
				.listStyle(.plain)
				.searchable(text: $searchedText, placement: .automatic)
			}
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					HStack {
						Button(action: {vm.isFavorited.toggle()}) {
							vm.isFavorited ? Image(systemName: "heart.text.square.fill") : Image(systemName: "heart.text.square")
						}
						Button(action: {vm.isFiltered.toggle()}) {
							vm.isFiltered ? Image(systemName: "line.3.horizontal.decrease.circle.fill") : Image(systemName: "line.3.horizontal.decrease.circle")
						}
					}
				}
				
				ToolbarItem(placement: .principal) {
					Picker(
						selection: $selection,
						label: Text("Picker"),
						content: {
							ForEach(vm.filterOptions.indices, id: \.self) { index in
								Text(vm.filterOptions[index])
									.tag(vm.filterOptions[index])
							}
						}
					)
					.padding(.horizontal)
					.pickerStyle(SegmentedPickerStyle())
				}
			}
			.navigationBarTitleDisplayMode(.inline)
			.navigationTitle("Artikel")
		}
	}
}

struct ArticleList_Previews: PreviewProvider {
	static var previews: some View {
		ArticleListView()
	}
}
