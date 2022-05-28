//
//  InfoViewController.swift
//  Привычки
//
//  Created by Pavel Nebogatov on 28.05.2022.
//

import UIKit

class InfoViewController : UIViewController , UIScrollViewDelegate {
   
    var scrollView : (UIScrollView) = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = true
        view.showsHorizontalScrollIndicator = false
        view.isScrollEnabled = true
        
        return view
            
    }()

  
    let  headline : (UILabel) = {
        
        let headline = UILabel()
        headline.text = "Привычка за 21 день"
        headline.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    
        return headline
    }()
    
    let preViewLabel : (UILabel) = {
        
        let preViewLabel = UILabel()
        preViewLabel.text = "Прохождение этапов, за которые за 21 день вырабатывается привычка, подчиняется следующему алгоритму:"
        preViewLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        preViewLabel.numberOfLines = 3
    
    return preViewLabel
    }()
    
    let view1 : (UILabel) = {
       
        let view1 = UILabel()
        view1.text = "1. Провести 1 день без обращения к старым привычкам, стараться вести себя так, как будто цель, загаданная в перспективу, находится на расстоянии шага."
        view1.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        view1.numberOfLines = 5
    
    return view1
    }()
    
    
    let view2 : (UILabel) = {
       
        let view2 = UILabel()
        view2.text = "2. Выдержать 2 дня в прежнем состоянии самоконтроля."
        view2.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        view2.numberOfLines = 2
    
    return view2
    }()
    
    let view3 : (UILabel) = {
       
        let view3 = UILabel()
        view3.text = "3. Отметить в дневнике первую неделю изменений и подвести первые итоги — что оказалось тяжело, что — легче, с чем еще предстоит серьезно бороться."
        view3.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        view3.numberOfLines = 4
    
    return view3
    }()
    
    let view4 : (UILabel) = {
       
        let view4 = UILabel()
        view4.text = "4. Поздравить себя с прохождением первого серьезного порога в 21 день. За это время отказ от дурных наклонностей уже примет форму осознанного преодоления и человек сможет больше работать в сторону принятия положительных качеств."
        view4.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        view4.numberOfLines = 7
    
    return view4
    }()
    
    let view5 : (UILabel) = {
       
        let view5 = UILabel()
        view5.text = "5. Держать планку 40 дней. Практикующий методику уже чувствует себя освободившимся от прошлого негатива и двигается в нужном направлении с хорошей динамикой."
        view5.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        view5.numberOfLines = 5
    
    return view5
    }()
    
    let view6 : (UILabel) = {
       
        let view6 = UILabel()
        view6.text = "6. На 90-й день соблюдения техники все лишнее из «прошлой жизни» перестает напоминать о себе, и человек, оглянувшись назад, осознает себя полностью обновившимся."
        view6.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        view6.numberOfLines = 5
    
    return view6
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.navigationItem.title = "Информация"
        self.navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        
    
        
       
            addLayout()

    }

    func addLayout() {
        
        view.addSubview(scrollView)
        view.addSubview(headline)
        view.addSubview(preViewLabel)
        view.addSubview(view1)
        view.addSubview(view2)
        view.addSubview(view3)
        view.addSubview(view4)
        view.addSubview(view5)
        view.addSubview(view6)
        
        scrollView.addSubview(headline)
        scrollView.addSubview(preViewLabel)
        scrollView.addSubview(view1)
        scrollView.addSubview(view2)
        scrollView.addSubview(view3)
        scrollView.addSubview(view4)
        scrollView.addSubview(view5)
        scrollView.addSubview(view6)
        
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        headline.translatesAutoresizingMaskIntoConstraints = false
        preViewLabel.translatesAutoresizingMaskIntoConstraints = false
        view1.translatesAutoresizingMaskIntoConstraints = false
        view2.translatesAutoresizingMaskIntoConstraints = false
        view3.translatesAutoresizingMaskIntoConstraints = false
        view4.translatesAutoresizingMaskIntoConstraints = false
        view5.translatesAutoresizingMaskIntoConstraints = false
        view6.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            scrollView.widthAnchor.constraint(equalToConstant: 343),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            
            headline.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 22),
            headline.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            headline.widthAnchor.constraint(equalToConstant: 218),
            headline.heightAnchor.constraint(equalToConstant: 24),

            preViewLabel.topAnchor.constraint(equalTo: headline.bottomAnchor, constant: 16),
            preViewLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            preViewLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            preViewLabel.heightAnchor.constraint(equalToConstant: 66),
            preViewLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            view1.topAnchor.constraint(equalTo: preViewLabel.bottomAnchor, constant: 12),
            view1.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            view1.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            view1.heightAnchor.constraint(equalToConstant: 109),
            view1.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            view2.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: 12),
            view2.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            view2.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            view2.heightAnchor.constraint(equalToConstant: 43),
            view2.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            view3.topAnchor.constraint(equalTo: view2.bottomAnchor, constant: 12),
            view3.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            view3.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            view3.heightAnchor.constraint(equalToConstant: 89),
            view3.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            view4.topAnchor.constraint(equalTo: view3.bottomAnchor, constant: 12),
            view4.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            view4.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            view4.heightAnchor.constraint(equalToConstant: 155),
            view4.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            view5.topAnchor.constraint(equalTo: view4.bottomAnchor, constant: 12),
            view5.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            view5.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            view5.heightAnchor.constraint(equalToConstant: 110),
            view5.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            view6.topAnchor.constraint(equalTo: view5.bottomAnchor, constant: 12),
            view6.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            view6.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            view6.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            view6.heightAnchor.constraint(equalToConstant: 110),
            view6.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

        ])
        
        
    }
    
}
