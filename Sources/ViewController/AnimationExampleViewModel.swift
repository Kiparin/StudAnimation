//
//  ViewController.swift
//  StudAnimation
//
//  Created by Alexey Kiparin on 21.12.2024.
//

import UIKit
import SpringAnimation

final class AnimationExampleViewModel: UIViewController {
	
	@IBOutlet weak var nameOfAnimatio: UILabel!
	@IBOutlet weak var curve: UILabel!
	@IBOutlet weak var force: UILabel!
	@IBOutlet weak var delay: UILabel!
	@IBOutlet weak var duration: UILabel!
	@IBOutlet weak var viewAnimation: SpringView!
	
	private var nextAnimation: AnimationModel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setData(generateNewAnimation())
		nextAnimation = generateNewAnimation()
	}
	
	@IBAction func animationButtonTapped(_ sender: UIButton) {
		setData(nextAnimation)
		nextAnimation = generateNewAnimation()
		sender.setTitle("Run \(nextAnimation.name)", for: .normal)
	}
	
	private func generateNewAnimation() -> AnimationModel {
		return AnimationModel(
			name: AnimationPreset.allCases.randomElement()?.rawValue ?? "pop",
			duration: Float.random(in: 0.3...1),
			curve: AnimationCurve.allCases.randomElement()?.rawValue ?? "easeOut",
			delay: Float.random(in: 0.3...1),
			force: Float.random(in: 0.5...5)
		)
	}
	
	private func setData(_ model: AnimationModel) {
			self.setViewData(model)
			self.SetAnimation(model)
	}
	
	private func setViewData(_ model: AnimationModel) {
		nameOfAnimatio.text = model.name
		curve.text = "Curve:\(model.curve)"
		force.text = "Force:\(model.force)"
		delay.text = "Delay:\(model.delay)"
		duration.text = "Duaration:\(model.duration)"
	}
	
	private func SetAnimation(_ model: AnimationModel) {
		viewAnimation.animation = model.name
		viewAnimation.curve = model.curve
		viewAnimation.force = CGFloat(model.force)
		viewAnimation.delay = CGFloat(model.delay)
		viewAnimation.duration = CGFloat(model.duration)
		viewAnimation.animate()
	}
	
}

