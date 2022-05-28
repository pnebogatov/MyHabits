//
//  HabitDetailViewCell.swift
//  Привычки
//
//  Created by Pavel Nebogatov on 28.05.2022.
//

import UIKit

class HabitDetailViewCell: UITableViewCell {
    
    var trackedDay: UILabel = {
        var day = UILabel()
        day.font = UIFont.systemFont(ofSize: 22)
        day.translatesAutoresizingMaskIntoConstraints = false
        return day
    }()
    
    
    var checkMark: UILabel = {
        var check = UILabel()
        check.font = UIFont.systemFont(ofSize: 22)
        check.translatesAutoresizingMaskIntoConstraints = false
        check.text = "✓"
        check.textColor = .purple
        check.textAlignment = .right
        check.isHidden = true
        return check
    }()
    
    
    func setupViews() {
        contentView.addSubview(trackedDay)
        contentView.addSubview(checkMark)
        let constraints = [
            trackedDay.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            trackedDay.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            trackedDay.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            trackedDay.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            checkMark.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            checkMark.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            checkMark.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            checkMark.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

