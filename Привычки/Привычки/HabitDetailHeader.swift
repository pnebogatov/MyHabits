//
//  HabitDetailHeader.swift
//  Привычки
//
//  Created by Pavel Nebogatov on 28.05.2022.
//

import UIKit


class HabitDetailHeader: UITableViewHeaderFooterView {

    
    let habitActivityLabel: UILabel = {
        let activity = UILabel()
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.text = "АКТИВНОСТЬ"
        activity.font = .systemFont(ofSize: 13)
        activity.textColor = .darkGray
        activity.translatesAutoresizingMaskIntoConstraints = false
        return activity
    }()
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupViews() {
        
        contentView.backgroundColor = .systemGray6
        contentView.addSubview(habitActivityLabel)
        
        let constraints = [
            habitActivityLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            habitActivityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
