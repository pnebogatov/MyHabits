//
//  CorrectHabitViewController.swift
//  Привычки
//
//  Created by Pavel Nebogatov on 28.05.2022.
//

import UIKit


class CorrectHabitViewController: UIViewController {
    
    weak var delegate1: TestDelegate?
    
    weak var delegateCorrectVC: ProtocolForCallFromCorrectToDetail?
    
    let scrollView = UIScrollView()
    
    public var habit: Habit
    
    public var openForCreateNewHabit: Bool
    
    init(habit: Habit, openForCreateNewHabit: Bool) {
        self.habit = habit
        self.openForCreateNewHabit = openForCreateNewHabit
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "НАЗВАНИЕ"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.numberOfLines = 1
        return label
    }()
    
    let textInput: UITextField = {
        let input = UITextField()
        input.translatesAutoresizingMaskIntoConstraints = false
        input.layer.borderWidth = 0
        input.font = .systemFont(ofSize: 13)
        return input
    }()
    
    let colorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ЦВЕТ"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 13)
        return label
    }()
    
    let colorButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(colorButtonPressed), for: .touchUpInside)
        button.layer.masksToBounds = true
        return button
    }()
    let timeLabel: UILabel = {
        let time = UILabel()
        time.translatesAutoresizingMaskIntoConstraints = false
        time.text = "ВРЕМЯ"
        time.textColor = .black
        time.font = .boldSystemFont(ofSize: 13)
        return time
    }()
    
    let dateText: UILabel = {
        let date = UILabel()
        date.text =   "Каждый день в: "
        date.translatesAutoresizingMaskIntoConstraints = false
        date.font = .systemFont(ofSize: 13)
        date.textColor = .black
        return date
    }()
    let time: UILabel = {
        let txtdata = UILabel()
        txtdata.translatesAutoresizingMaskIntoConstraints = false
        txtdata.textColor = .purple
        txtdata.text = "00:00"
        return txtdata
    }()
    
    
    let deleteButton: UIButton = {
        let delete = UIButton(type: .system)
        delete.translatesAutoresizingMaskIntoConstraints = false
        delete.setTitle("Удалить привычку", for: .normal)
        delete.setTitleColor(.red, for: .normal)
        delete.addTarget(self, action: #selector(showAlert(_:)), for: .touchUpInside)
        return delete
    }()
    
    
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm a"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        
        return dateFormatter
    }()
    
    
    private let datePicker: UIDatePicker = {
        let newHabitTimeDatePicker = UIDatePicker()
        newHabitTimeDatePicker.datePickerMode = .time
        newHabitTimeDatePicker.preferredDatePickerStyle = .wheels
       // newHabitTimeDatePicker.date
        
        
        newHabitTimeDatePicker.addTarget(self, action: #selector(dateHasBeenChenged), for: .valueChanged)
        
        return newHabitTimeDatePicker
    }()
    
    
    @objc func dateHasBeenChenged(sender: UIDatePicker) {
        time.text = dateFormatter.string(from: sender.date)
    }
    
    @objc func showAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "Удалить привычку?", message: "Вы хотите удалить привычку \(habit.name)?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .default) { _ in
            print("Отмена")
        }
        
        let deleteAction = UIAlertAction(title: "Удалить", style: .destructive) { _ in
            if let oldHabit = HabitsStore.shared.habits.firstIndex(where: ({ $0.name == self.habit.name })) {
                HabitsStore.shared.habits.remove(at: oldHabit )
            }
            
            self.dismiss(animated: true) { [weak self] in
                self?.delegateCorrectVC?.callFromCorrectToDetailPopToRoot()
                self?.delegateCorrectVC?.updateHabitsCollection()
            }
        }
        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    func setupViews() {
        print(#function)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(nameLabel)
        scrollView.addSubview(textInput)
        scrollView.addSubview(colorLabel)
        scrollView.addSubview(colorButton)
        scrollView.addSubview(timeLabel)
        scrollView.addSubview(dateText)
        scrollView.addSubview(time)
        scrollView.addSubview(datePicker)
        scrollView.addSubview(deleteButton)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor, constant: 66),
            nameLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            nameLabel.bottomAnchor.constraint(equalTo: textInput.topAnchor, constant: -7),
            nameLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            
            textInput.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            textInput.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textInput.bottomAnchor.constraint(equalTo: colorLabel.topAnchor, constant: -15),
            
            colorLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            colorLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            
            colorButton.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 7),
            colorButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            colorButton.widthAnchor.constraint(equalToConstant: 30),
            colorButton.heightAnchor.constraint(equalToConstant: 30),
            
            timeLabel.topAnchor.constraint(equalTo: colorButton.bottomAnchor, constant: 15),
            timeLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            timeLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            timeLabel.heightAnchor.constraint(equalToConstant: 30),
            
            dateText.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 7),
            dateText.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            dateText.trailingAnchor.constraint(equalTo: time.leadingAnchor, constant: -10),
            dateText.widthAnchor.constraint(equalToConstant: 100),
            dateText.heightAnchor.constraint(equalToConstant: 30),
            
            time.heightAnchor.constraint(equalToConstant: 30),
            time.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            time.topAnchor.constraint(equalTo: dateText.topAnchor),
            
            datePicker.topAnchor.constraint(equalTo: time.bottomAnchor, constant: 15),
            datePicker.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            datePicker.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            
            deleteButton.bottomAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            deleteButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    
    @objc func colorButtonPressed() {
        print(#function)
        let picker = UIColorPickerViewController()
        self.present(picker, animated: true, completion: nil)

       // picker.selectedColor = .systemPink
        picker.selectedColor = colorButton.backgroundColor!
        colorButton.backgroundColor = picker.selectedColor
        
        picker.delegate = self
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.backgroundColor = .white
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 44))
        scrollView.addSubview(navBar)
        
        
        if openForCreateNewHabit == true {
            
            let navItem = UINavigationItem(title: "Создать")
            let saveItem = UIBarButtonItem(title: "Сохранить", style: .plain, target: self, action: #selector(saveBarButtonForCreateNewHabit))
            navItem.rightBarButtonItem = saveItem
            saveItem.tintColor = .purple
            deleteButton.isHidden = true
            let cancelItem = UIBarButtonItem(title: "Отменить", style: .plain, target: self, action: #selector(cancelBarButton))
            navItem.leftBarButtonItem = cancelItem
            navBar.setItems([navItem], animated: false)
            cancelItem.tintColor = .purple
          //  datePicker.date = Date(timeIntervalSinceNow: 1000)
            textInput.placeholder = "Новая привычка"
            
        } else {
            
            let navItem = UINavigationItem(title: "Править")
            let saveItem = UIBarButtonItem(title: "Сохранить", style: .plain, target: self, action: #selector(saveBarButtonForChanges))
            navItem.rightBarButtonItem = saveItem
            saveItem.tintColor = .purple
            let cancelItem = UIBarButtonItem(title: "Отменить", style: .plain, target: self, action: #selector(cancelBarButton))
            navItem.leftBarButtonItem = cancelItem
            navBar.setItems([navItem], animated: false)
            cancelItem.tintColor = .purple
            
            time.text = dateFormatter.string(from: habit.date)
            datePicker.date = habit.date


        }
        setupViews()
        textInput.text = habit.name
        textInput.textColor = habit.color
        colorButton.backgroundColor = habit.color
    }
    

    @objc func saveBarButtonForCreateNewHabit() {
        print(#function)
        print("СОЗДАНИЕ ННОВОЙ ПРИВЫЧКИ")

        let newHabit = Habit(name: textInput.text!,
                             date:  datePicker.date,
                             color: colorButton.backgroundColor!)
        let store = HabitsStore.shared
        store.habits.append(newHabit)
        reloadInputViews()
        
        dismiss(animated: true) { [weak self] in
            print( "self?.delegate1?.updCollection()")
            print( self?.delegate1?.updCollection() as Any)
            self?.delegate1?.updCollection()
           // self?.navigationController?.pushViewController(HabitsViewController(), animated: true)
        }
        
    }

    @objc func saveBarButtonForChanges() {
        print("ВНЕСЕНИЕ ИЗМЕНЕНИЙ")
        reloadInputViews()
       // store1.habits[habi]
        habit.name = textInput.text!
        habit.date = datePicker.date
        habit.color = colorButton.backgroundColor!
    
        delegateCorrectVC?.updateTitle(newTitle: textInput.text!)
        store1.save()
        dismiss(animated: true) { [weak self] in
           // print(" ЗВОНИМ self?.delegateCorrectVC?.callFromCorrectToDetail()")
           // print(self?.delegateCorrectVC?.callFromCorrectToDetailPopToRoot() as Any)
            self?.delegateCorrectVC?.updateHabitsCollection()

            
        }

    }
    
    
    @objc func cancelBarButton() {
        print(#function)
        self.dismiss(animated: true, completion: nil)
    }
}

extension CorrectHabitViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        colorButton.backgroundColor = viewController.selectedColor
        textInput.textColor = viewController.selectedColor

    }
}
