//
//  ViewController.swift
//  StudAnimation
//
//  Created by Alexey Kiparin on 21.12.2024.
//

import UIKit
import SpringAnimation

final class AnimationExampleViewModel: UIViewController {
	
	@IBOutlet weak var nameOfAnimation: UILabel!
	@IBOutlet weak var curve: UILabel!
	@IBOutlet weak var force: UILabel!
	@IBOutlet weak var delay: UILabel!
	@IBOutlet weak var duration: UILabel!
	@IBOutlet weak var viewAnimation: SpringView!
	
	private var nextAnimation: Animation!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setData(Animation.generateNewAnimation())
		nextAnimation = Animation.generateNewAnimation()
	}
	
	@IBAction func animationButtonTapped(_ sender: UIButton) {
		setData(nextAnimation)
		nextAnimation = Animation.generateNewAnimation()
		sender.setTitle("Run \(nextAnimation.name)", for: .normal)
	}
	
	private func setData(_ model: Animation) {
		setViewData(model)
		setAnimation(model)
	}
	
	private func setViewData(_ model: Animation) {
		nameOfAnimation.text = model.name
		curve.text = "Curve:\(model.curve)"
		force.text = "Force:\(model.force)"
		delay.text = "Delay:\(model.delay)"
		duration.text = "Duaration:\(model.duration)"
	}
	
	private func setAnimation(_ model: Animation) {
		viewAnimation.animation = model.name
		viewAnimation.curve = model.curve
		viewAnimation.force = CGFloat(model.force)
		viewAnimation.delay = CGFloat(model.delay)
		viewAnimation.duration = CGFloat(model.duration)
		viewAnimation.animate()
	}
	
}

