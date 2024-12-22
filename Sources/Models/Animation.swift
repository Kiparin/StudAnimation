//
//  AnimationModel.swift
//  StudAnimation
//
//  Created by Alexey Kiparin on 21.12.2024.
//

import SpringAnimation


struct Animation {
	
	let name: String
	let duration: Float
	let curve: String
	let delay: Float
	let force: Float
	
	public static func generateNewAnimation() -> Animation {
		return Animation(
			name: AnimationPreset.allCases.randomElement()?.rawValue ?? "pop",
			duration: Float.random(in: 0.3...1),
			curve: AnimationCurve.allCases.randomElement()?.rawValue ?? "easeOut",
			delay: Float.random(in: 0.3...1),
			force: Float.random(in: 0.5...5)
		)
	}
	
}


