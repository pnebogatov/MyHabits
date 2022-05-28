//
//  HabitCollectionViewCell.swift
//  Привычки
//
//  Created by Pavel Nebogatov on 28.05.2022.
//

import UIKit

class HabitCollectionViewCell: UICollectionViewCell {
    
    weak var delegateHabitCell: TestDelegate?
    
    var habit: Habit? {
        didSet{
            habitNameLabel.text = habit?.name
            timeLabel.text = habit?.dateString
            colorButtton1.layer.borderColor = habit?.color.cgColor
            habitNameLabel.textColor = habit?.color
            daysLabel.text = ("Подряд: \(habit!.trackDates.count)")
        }
    }
    
    
    var habitNameLabel: UILabel = {
        var habitNameLabel = UILabel()
        habitNameLabel.translatesAutoresizingMaskIntoConstraints = false
        habitNameLabel.numberOfLines = 2
        habitNameLabel.font = .systemFont(ofSize: 15)
        return habitNameLabel
    }()
    
    
    var timeLabel: UILabel = {
        var timeLabel = UILabel()
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.textColor = .systemGray
        return timeLabel
    }()
    
    
    var daysLabel: UILabel = {
        var daysLabel = UILabel()
        daysLabel.translatesAutoresizingMaskIntoConstraints = false
        daysLabel.textColor = .systemGray
        return daysLabel
    }()
    
    
    lazy var colorButtton1: UIButton = {
        var colorButtton1 = UIButton(type: .system)
        colorButtton1.translatesAutoresizingMaskIntoConstraints = false
        colorButtton1.backgroundColor = .white
        colorButtton1.layer.borderWidth = 1
        colorButtton1.layer.cornerRadius = 18
        colorButtton1.layer.masksToBounds = true
        colorButtton1.addTarget(self, action: #selector(trackHabit), for: .touchUpInside)
        
        return colorButtton1
    }()
    
    
    @objc func trackHabit() {
        print(#function)
        
        
        if habit?.isAlreadyTakenToday == true {
            print("уже затрекана сегодня")
        } else {
            print("трекаем время привычки")
            HabitsStore.shared.track(habit!)
            contentView.reloadInputViews()
            self.delegateHabitCell?.updCollection()
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(habitNameLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(daysLabel)
        contentView.addSubview(colorButtton1)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        
        let constraints = [
            habitNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            habitNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            habitNameLabel.bottomAnchor.constraint(equalTo: timeLabel.topAnchor, constant: -4),
            habitNameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            
            timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            timeLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4),
            timeLabel.heightAnchor.constraint(equalToConstant: 20),
            
            daysLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            daysLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            daysLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            daysLabel.heightAnchor.constraint(equalToConstant: 20),
            
            colorButtton1.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 47),
            colorButtton1.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -47),
            colorButtton1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -26),
            colorButtton1.widthAnchor.constraint(equalToConstant: 36)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
