//
//  Dashboard.swift
//  KataKanji
//
//  Created by Aldino Efendi on 2022/04/19.
//

import SwiftUI

struct Dashboard: View {
	
	@StateObject var viewModel: DashboardViewModel = DashboardViewModel()
	
	var body: some View {
		ZStack {
			Color.white
				.edgesIgnoringSafeArea(.all)
			
			VStack {
				Header(viewModel: viewModel)
				ScrollView {
					TodayKanji()
					ArticleListDashboard(viewModel: viewModel)
				}
			}
		}
		.navigationBarHidden(true)
	}
}

struct Header: View {
	@ObservedObject var viewModel: DashboardViewModel
	
	var body: some View {
		HStack {
			CircularProgress(value: viewModel.userData!.progress, level: viewModel.userData!.level)
			VStack(alignment: .leading, spacing: 20) {
				Text("ARTIKEL DIBACA")
					.font(.system(size: 15))
					.foregroundColor(Color.white)
				HStack {
					Text("\(viewModel.userData!.articleReaded)")
						.font(.system(size: 22))
						.foregroundColor(Color.white)
					Text("dari \(viewModel.userData!.listArticle) artikel")
						.font(.system(size: 15))
						.foregroundColor(Color.white)
				}
			}
			
			VStack(alignment: .leading, spacing: 20) {
				Text("KUIS DIKERJAKAN")
					.font(.system(size: 15))
					.foregroundColor(Color.white)
				HStack {
					Text("\(viewModel.userData!.quizDone)")
						.font(.system(size: 22))
						.foregroundColor(Color.white)
					Text("dari \(viewModel.userData!.listQuiz) kuis")
						.font(.system(size: 15))
						.foregroundColor(Color.white)
				}
			}
			
			Spacer()
		}
		.padding(.bottom, 10)
		.background(Color("Primary"))
	}
}

struct CircularProgress: View {
	var value: Float
	var level: String
	
	var body: some View {
		ZStack {
			ZStack {
				Circle()
					.stroke(lineWidth: 8.0)
					.opacity(0.3)
					.foregroundColor(Color.white)
				
				Circle()
					.trim(from: 0.0, to: CGFloat(min(value, 1.0)))
					.stroke(style: StrokeStyle(lineWidth: 8.0, lineCap: .round, lineJoin: .round))
					.foregroundColor(Color.orange)
					.rotationEffect(Angle(degrees: 270.0))
				
				Circle()
					.frame(width: 60, height: 60)
					.foregroundColor(Color.orange)
				Text(level)
					.font(.system(size: 13, weight: .bold))
			}
			.frame(width: 80, height: 80)
			.padding()
		}
	}
}

struct TodayKanji: View {
	var body: some View {
		VStack(alignment: .leading) {
			Text("Kanji hari ini")
				.font(.title)
			
			HStack(spacing: 20) {
				VStack {
					Text("案")
						.font(.largeTitle)
						.fontWeight(.bold)
					Text("Mahir")
						.background(
							Rectangle()
								.foregroundColor(Color.orange)
								.frame(height: 4)
								.offset(y: 10)
						)
				}
				
				VStack(alignment: .leading, spacing: 10) {
					VStack(alignment: .leading) {
						Text("Cara baca")
						Text("つくえ, アン")
							.fontWeight(.bold)
					}
					VStack(alignment: .leading) {
						Text("Arti")
						Text("rencana, saran")
							.fontWeight(.bold)
					}
				}
				Spacer()
			}
			.padding(30)
			.background(Color("Primary").opacity(0.3))
			.cornerRadius(20)
			
		}
		.padding()
	}
}

struct ArticleListDashboard: View {
	
	@ObservedObject var viewModel: DashboardViewModel
	@State var isView1Active: Bool = false
	
	var body: some View {
		VStack(alignment: .leading) {
			Text("Yuk, temukan kanji ini di bacaan berikut!")
				.font(.title2)
			
			ForEach(viewModel.article) { article in
				NavigationLink(destination: DetailArticleView(article: article)) {
					CellContent(article: article)
				}
//				CellContent(article: article)
			}
			
		}
		.padding()
	}
}

struct CellContent: View {
	let article: ArticleModel
	
	var body: some View {
		HStack {
			Image(article.image)
				.resizable()
				.aspectRatio(contentMode: .fill)
				.frame(width: 80, height: 80)
			VStack(alignment: .leading, spacing: 10) {
				Text(article.titleJP)
					.fontWeight(.bold)
					.lineLimit(2)
					.foregroundColor(Color.primary)
				Text(article.titleID)
					.lineLimit(2)
					.foregroundColor(Color.primary)
				
			}
			Spacer()
			if (article.isSeen) {
				Image(systemName: "eye")
					.foregroundColor(.primary)
			}
//			Image(systemName: "chevron.right")
		}
		
	}
}

struct Dashboard_Previews: PreviewProvider {
	static var previews: some View {
		Dashboard()
	}
}
