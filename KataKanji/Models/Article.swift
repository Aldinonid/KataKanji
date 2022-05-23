//
//  Article.swift
//  KataKanji
//
//  Created by Aldino Efendi on 2022/05/02.
//

import Foundation

struct ArticleModel: Identifiable {
	let id: String = UUID().uuidString
	let image: String
	let titleJP: String
	let titleID: String
	let level: String
	let topic: String
	let articleJP: String
	let articleID: String
	let articleSource: String
	let isSeen: Bool
	let isQuizTaken: Bool
	let kanji: [KanjiModel]
	let quiz: [QuestionModel]
	let quizscore : Int
}
