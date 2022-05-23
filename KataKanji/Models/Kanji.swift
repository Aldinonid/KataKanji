//
//  Kanji.swift
//  KataKanji
//
//  Created by Aldino Efendi on 2022/05/02.
//

import Foundation

struct KanjiModel: Identifiable {
	let id: String = UUID().uuidString
	let kanji: String
	let kunyomi: String
	let onyomi: String
	let meaning: String
	let level: String
}
