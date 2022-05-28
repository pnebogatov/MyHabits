//
//  HabitsViewController.swift
//  Привычки
//
//  Created by Pavel Nebogatov on 28.05.2022.
//

import UIKit

class HabitsViewController: UIViewController {
    
    var habitDetailsViewController: HabitDetailsViewController?
    
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
       // HabitsStore.shared.habits.removeAll()
        
        self.navigationItem.title = "Сегодня"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(modalyShowHabitVC))
        
        collectionView.register(HabitCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: HabitCollectionViewCell.self))
        collectionView.register(ProgressCell.self, forCellWithReuseIdentifier: String(describing: ProgressCell.self))
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        view.backgroundColor = .white
        navigationController?.navigationBar.backgroundColor = .white
        navigationItem.rightBarButtonItem?.tintColor = .purple
        
        
        
        navigationController?.navigationBar.prefersLargeTitles = true
        collectionView.backgroundColor = .systemGray6
    }
    
    
    @objc func modalyShowHabitVC (){
        
        let correctVcForCreateNewHabit = CorrectHabitViewController(habit: Habit(name: "", date: Date(timeIntervalSinceNow: 0), color: .orange), openForCreateNewHabit: true)
        
        correctVcForCreateNewHabit.delegate1 = self
        
        present(correctVcForCreateNewHabit, animated: true)
    }
    
}


extension HabitsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            let width: CGFloat = collectionView.bounds.width - 32
            return CGSize(width: width, height: 60)
        } else {
            let width: CGFloat = collectionView.bounds.width - 32
            return CGSize(width: width, height: 130)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsets(top: 22, left: 16, bottom: 0, right: 16)
        } else if section == 1 {
            return UIEdgeInsets(top: 18, left: 16, bottom: 12, right: 16)
        } else {
            return UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.section != 0 {
            let habit = HabitsStore.shared.habits[indexPath.item]
            habitDetailsViewController = HabitDetailsViewController(habit: habit)
            
            if habitDetailsViewController != nil {
                navigationController?.pushViewController(habitDetailsViewController!, animated: true)
                habitDetailsViewController!.callFromDetailToHabits = self
            }
            
        }
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
}


extension HabitsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        default:
            return HabitsStore.shared.habits.count
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ProgressCell.self), for: indexPath) as! ProgressCell
            cell.progressLine.setProgress(HabitsStore.shared.todayProgress, animated: true)
            cell.progressPercentLabel.text = "\(Int(HabitsStore.shared.todayProgress * 100))%"
            return cell
            
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HabitCollectionViewCell.self), for: indexPath) as! HabitCollectionViewCell
            cell.delegateHabitCell = self
            cell.habit = HabitsStore.shared.habits[indexPath.item]
            
            if cell.habit?.isAlreadyTakenToday == true {
                cell.colorButtton1.tintColor = cell.habit?.color
                cell.colorButtton1.backgroundColor = cell.habit?.color
                cell.colorButtton1.setImage(.checkmark, for: .normal)
            } else {
                cell.colorButtton1.backgroundColor = .clear
                cell.colorButtton1.setImage(nil, for: .normal)
            }
            return cell
        }
    }
}

extension HabitsViewController: TestDelegate {
    func updCollection() {
        collectionView.reloadData()
        collectionView.reloadInputViews()
        print("Вызвался collectionView.reloadData()")
    }
}
