//
//  ProgressCell.swift
//  Привычки
//
//  Created by Pavel Nebogatov on 28.05.2022.
//

import UIKit

class ProgressCell: UICollectionViewCell {
    
    let progressText: UILabel = {
        let progressText = UILabel()
        progressText.text = "Все получится!"
        progressText.font = .systemFont(ofSize: 13)
        progressText.translatesAutoresizingMaskIntoConstraints = false
        return progressText
    }()
    
    
    let progressPercentLabel: UILabel = {
        let progressPercentLabel = UILabel()
        progressPercentLabel.text = "\(Int(HabitsStore.shared.todayProgress * 100))%"
        progressPercentLabel.font = .systemFont(ofSize: 13)
        progressPercentLabel.translatesAutoresizingMaskIntoConstraints = false
        return progressPercentLabel
    }()
    
    
    let progressLine: UIProgressView = {
        let progressLine = UIProgressView()
        progressLine.setProgress(HabitsStore.shared.todayProgress, animated: true)
        progressLine.progressTintColor = .purple
        progressLine.translatesAutoresizingMaskIntoConstraints = false
        return progressLine
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .white
        contentView.addSubview(progressText)
        contentView.addSubview(progressPercentLabel)
        contentView.addSubview(progressLine)
        contentView.layer.cornerRadius = 8
        
        NSLayoutConstraint.activate([
            
            progressText.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            progressText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            progressText.bottomAnchor.constraint(equalTo: progressLine.topAnchor, constant: -10),
            
            progressPercentLabel.topAnchor.constraint(equalTo: progressText.topAnchor),
            progressPercentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            progressPercentLabel.widthAnchor.constraint(equalToConstant: 40),
            progressPercentLabel.heightAnchor.constraint(equalToConstant: 20),
            
            progressLine.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            progressLine.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            progressLine.heightAnchor.constraint(equalToConstant: 7)
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


