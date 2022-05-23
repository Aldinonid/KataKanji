//
//  User.swift
//  KataKanji
//
//  Created by Aldino Efendi on 2022/04/19.
//

import Foundation

struct UserModel {
	let level: String
	let articleReaded: Int
	let quizDone: Int
	let listArticle: Int
	let listQuiz: Int
	let progress: Float
}

enum Level: String {
	case Pemula
	case Menengah
	case Mahir
}
