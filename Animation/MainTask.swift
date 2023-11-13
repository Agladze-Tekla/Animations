//
//  MainTask.swift
//  Animation
//
//  Created by Tekla on 11/12/23.
//

import UIKit

class MainTask: UIViewController {

    //MARK: - Properties
    private let tbcLabel: UILabel = {
        let label = UILabel()
        label.text = "TBC IT Academy"
        label.textColor = .systemPink
        label.font = .boldSystemFont(ofSize: 26)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: - Private Methods
    private func setupView() {
        setupBackground()
        addSubview()
        setupConstraints()
        animateLabel()
    }
    
    private func setupBackground() {
        view.backgroundColor = .systemIndigo
    }
    
    private func addSubview() {
        view.addSubview(tbcLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([tbcLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor), tbcLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
    }
    
    private func animateLabel() {
        DispatchQueue.main.async { [self] in //I know in the last last assignment you said it doesn't need self, but it keeps erroring it, saying self. is needed.
            moveLabel()
            fadeLabel()
        }
    }
    
    private func moveLabel() {
       let animate = CABasicAnimation(keyPath: "position")
        animate.repeatDuration = .infinity //Used this in both moveLabel and fadeLabel, instead of repeating the animateLabel function, probably not a good practise for future more complex animations?
        let startY = tbcLabel.frame.midY
        let labelX = tbcLabel.frame.midX
        let moveThisMuch = CGFloat(50)
        let finishY = startY - moveThisMuch
        animate.fromValue = [labelX, startY]
        animate.toValue = [labelX, finishY]
        animate.duration = 2.4
        animate.autoreverses = true
        tbcLabel.layer.add(animate, forKey: "position")
    }
    
    private func fadeLabel() {
        let fade = CABasicAnimation(keyPath: "opacity")
        fade.repeatDuration = .infinity
        fade.fromValue = 0
        fade.toValue = 1
        fade.duration = 2.4
        fade.autoreverses = true
        tbcLabel.layer.add(fade, forKey: "opacity")
    }
   
}
