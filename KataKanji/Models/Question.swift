//
//  Question.swift
//  KataKanji
//
//  Created by Aldino Efendi on 2022/05/02.
//

import Foundation

struct QuestionModel: Identifiable {
	let id: String = UUID().uuidString
	let questionTitle : String
	let answers : [String]
	let correctAnswerIndex : Int
	var isKanji: Bool
	var kanjitext : String
}
