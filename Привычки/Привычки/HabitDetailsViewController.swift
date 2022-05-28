//
//  HabitDetailsViewController.swift
//  Привычки
//
//  Created by Pavel Nebogatov on 28.05.2022.
//

import UIKit

let store1 = HabitsStore.shared

class HabitDetailsViewController: UIViewController {

    weak var callFromDetailToHabits: TestDelegate?

    private lazy var habitDetailTableView: UITableView = {
        let habitDetailTableView = UITableView(frame: .zero, style: .grouped)
        habitDetailTableView.translatesAutoresizingMaskIntoConstraints = false
        habitDetailTableView.register(HabitDetailHeader.self, forHeaderFooterViewReuseIdentifier: String(describing: HabitDetailHeader.self))
        habitDetailTableView.register(HabitDetailViewCell.self, forCellReuseIdentifier: String(describing: HabitDetailViewCell.self))
        habitDetailTableView.delegate = self
        habitDetailTableView.dataSource = self
        return habitDetailTableView
    }()

    private lazy var correctHabitVC = CorrectHabitViewController(habit: habit, openForCreateNewHabit: false)

    var habit: Habit
    init(habit: Habit) {
        self.habit = habit
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.tintColor = .purple
        navigationItem.largeTitleDisplayMode = .never
        
        correctHabitVC.delegateCorrectVC = self

        view.backgroundColor = .systemGray6
        habitDetailTableView.backgroundColor = .systemGray6
        title = habit.name
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Править", style: .plain, target: self, action: #selector(correctHabit))
        navigationItem.rightBarButtonItem?.tintColor = .purple

        view.addSubview(habitDetailTableView)
        NSLayoutConstraint.activate([
            habitDetailTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            habitDetailTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            habitDetailTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            habitDetailTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

    }



    @objc func correctHabit() {
        navigationController?.present(correctHabitVC, animated: true, completion: nil)
    }
}

extension HabitDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}

extension HabitDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store1.dates.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: HabitDetailViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: HabitDetailViewCell.self)) as! HabitDetailViewCell

        cell.textLabel?.text = store1.trackDateString(forIndex: HabitsStore.shared.dates.count - 1 - indexPath.item)

        if store1.habit(habit, isTrackedIn: store1.dates[HabitsStore.shared.dates.count - 1 - indexPath.item]) == true {
            cell.checkMark.isHidden = false
        } else {
            cell.checkMark.isHidden = true
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return HabitDetailHeader()
    }
}


extension HabitDetailsViewController: ProtocolForCallFromCorrectToDetail {

    func updateHabitsCollection() {
        self.callFromDetailToHabits?.updCollection()
    }

    func updateTitle(newTitle: String) {
        title = newTitle
    }

    func callFromCorrectToDetailPopToRoot() {

        print("эта функция выполняется по нажатию на кнопку сохранить")
        dismiss(animated: true) {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
}
