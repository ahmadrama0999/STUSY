//
//  DayViewController.swift
//  STUSY
//
//  Created by Ramin Akhmad on 15.06.2020.
//  Copyright © 2020 Ramin Akhmad. All rights reserved.
//

import UIKit

class DayViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var chooseSegmentedControl: UISegmentedControl!
    var colapsableArray = [ColapsableCell<Weekday>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController?.navigationBar.shadowImage = UIImage()
//        navigationController?.navigationBar.isTranslucent = false
        guard let navBar = navigationController?.navigationBar else { return }
        navBar.barStyle = .black
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()
        navBar.isTranslucent = true
        navBar.isHidden = false
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        colapsableArray.append(ColapsableCell(isOpened: false, value: Weekday(weekday: .monday, arrayLessons: [Lesson(name: "123", lector: "Bolt", classRoom: "172"), Lesson(name: "Alg", lector: "Babilunga", classRoom: "150"), Lesson(name: "Phil", lector: "Marina", classRoom: "130")])))
        colapsableArray.append(ColapsableCell(isOpened: false, value: Weekday(weekday: .tuesday, arrayLessons: [Lesson(name: "123", lector: "Bolt", classRoom: "172"), Lesson(name: "Phil", lector: "Marina", classRoom: "130")])))
        colapsableArray.append(ColapsableCell(isOpened: false, value: Weekday(weekday: .wednesday, arrayLessons: [Lesson(name: "123", lector: "Bolt", classRoom: "172")])))
        colapsableArray.append(ColapsableCell(isOpened: false, value: Weekday(weekday: .thursday, arrayLessons: [Lesson(name: "123", lector: "Bolt", classRoom: "172")])))
        colapsableArray.append(ColapsableCell(isOpened: false, value: Weekday(weekday: .friday, arrayLessons: [Lesson(name: "123", lector: "Bolt", classRoom: "172"), Lesson(name: "Phil", lector: "Marina", classRoom: "130"), Lesson(name: "Phil", lector: "Marina", classRoom: "130")])))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let leftColor = UIColor(hex: 0x9BD56D)
        let rightColor = UIColor(hex: 0x0F9E98)
        view.setGradientBackground(leftColor: leftColor, rightColor: rightColor, direction: .topToBottom)
        view.layer.masksToBounds = true
        tableView.backgroundColor = .none
        chooseSegmentedControl.backgroundColor = chooseSegmentedControl.backgroundColor?.withAlphaComponent(0.7)
    }
    
}

extension DayViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return colapsableArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return colapsableArray[section].isOpened ? colapsableArray[section].value.arrayLessons.count + 1 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DayCell", for: indexPath) as? DayTableViewCell else { return UITableViewCell() }
            cell.dayLabel.text = colapsableArray[indexPath.section].value.weekday.name
            return cell
        } else {
            guard let cell2 = tableView.dequeueReusableCell(withIdentifier: "LessonCell", for: indexPath) as? LessonTableViewCell else { return UITableViewCell() }
            
            let item = colapsableArray[indexPath.section].value.arrayLessons[indexPath.row - 1]
            cell2.audLabel.text = item.classRoom
            cell2.nameLabel.text = item.name
            cell2.prepodLabel.text = item.lector
            return cell2
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard indexPath.row == 0 else { return }
        
        colapsableArray[indexPath.section].isOpened = !colapsableArray[indexPath.section].isOpened
        tableView.reloadSections(.init(integer: indexPath.section), with: .automatic)
    }
    
    
}

extension DayViewController: UITableViewDelegate {
    
}


struct ColapsableCell<T> {
    var isOpened = false
    let value: T
}
