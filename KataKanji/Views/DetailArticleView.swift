//
//  DetailArticleView.swift
//  KataKanji
//
//  Created by Aldino Efendi on 2022/05/05.
//

import SwiftUI

struct DetailArticleView: View {
	
	@State var articleFavorited: Bool = false
	@State var showAlert: Bool = false
	@State var isIndonesian: Bool = false
	let article: ArticleModel
	
	var body: some View {
		ScrollView {
			VStack(alignment: .leading, spacing: 10) {
				Image(article.image)
					.resizable()
					.scaledToFit()
					.frame(maxWidth: .infinity, maxHeight: 200)
					.background(Color("Primary").opacity(0.3))
					.cornerRadius(10)
				
				Text(isIndonesian ? article.titleID : article.titleJP)
					.font(.title)
					.fontWeight(.bold)
				
				Text(isIndonesian ? article.articleID : article.articleJP)
					.lineSpacing(18.0)
					.font(.body)
				
				Divider()
				
				HStack(alignment: .firstTextBaseline) {
					Text("Sumber Artikel : ")
					Text(article.articleSource)
				}
					.font(.footnote)
				
				Text("Untuk menyelesaikan bacaan ini, ayo ambil quiz!")
					.fontWeight(.bold)
				
				HStack(spacing: 20) {
					Button(action: {
						
					}) {
						Text("Nanti")
							.frame(maxWidth: .infinity)
							.padding()
							.foregroundColor(Color("Primary"))
							.overlay(
								RoundedRectangle(cornerRadius: 10)
									.stroke(Color("Primary"))
							)
					}
					
					Button(action: {
						
					}) {
						Text("Ambil Kuis")
							.frame(maxWidth: .infinity)
							.padding()
							.background(Color("Primary"))
							.foregroundColor(Color.white)
							.cornerRadius(10)
					}
				}
				
				
				
			}
			.padding()
		}
		
		.toolbar{
			ToolbarItem(placement: .navigationBarTrailing) {
				Button(action: {articleFavorited.toggle()}) {
					if (articleFavorited) {
						Image(systemName: "heart.fill")
							.foregroundColor(Color.red)
					} else {
						Image(systemName: "heart")
					}
				}
			}
			
			ToolbarItem(placement: .bottomBar) {
				HStack {
					Button("\(isIndonesian ? "Bahasa Jepang" : "Bahasa Indonesia")") {
						isIndonesian.toggle()
					}
					Spacer()
					Button("Furigana") {
						showAlert.toggle()
					}
				}
			}
		}
		
		.alert(isPresented: $showAlert, content: {
			getAlert()
		})
		.accentColor(Color("Primary"))
		
		.navigationBarTitleDisplayMode(.inline)
		.navigationTitle("Artikel")
	}
	
	func getAlert() -> Alert {
		return Alert(
			title: Text("Segera Hadir"),
			message: Text("Maaf, untuk saat ini fitur menampilkan furigana belum tersedia")
		)
	}
}

//struct DetailArticleView_Previews: PreviewProvider {
//	static var previews: some View {
//		DetailArticleView()
//	}
//}
