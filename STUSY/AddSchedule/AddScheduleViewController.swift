//
//  AddScheduleViewController.swift
//  STUSY
//
//  Created by Ramin Akhmad on 23.06.2020.
//  Copyright © 2020 Ramin Akhmad. All rights reserved.
//

import UIKit

enum WeekDays: String, CaseIterable {
    case monday = "Monday"
    case tuesday = "Tuesday"
    case wednesday = "Wednesday"
    case thursday = "Thursday"
    case friday = "Friday"
    case saturday = "Saturday"

    static let weekdays = WeekDays.allCases
}

class AddScheduleViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var smsLabel: UILabel!
    @IBOutlet weak var labelStack: UIStackView!
    
    @IBOutlet var steps: [UIImageView]!
    
    var stepCount = 1
    let weekdays = WeekDays.weekdays
    var selectedDays = Set<WeekDays>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        weekdays.forEach({ selectedDays.insert($0) })
    }
    
    func updateUI() {
        hidingUI(step: stepCount)
    }
    
    func hidingUI(step: Int) {
        steps.forEach { (image) in
            image.image = #imageLiteral(resourceName: "ellipseEmpty")
        }
        steps[stepCount - 1].image = #imageLiteral(resourceName: "ellipseFill")
        
        switch stepCount {
        case 1: break
        case 2:
            labelStack.isHidden = true
            tableView.isHidden = false
            smsLabel.isHidden = false
        default: break
        }
    }
    
    
    
    
    @IBAction func nextStepAction(_ sender: Any) {
        let selectedDays = Array(self.selectedDays)
        // дальше делаешь что тебе нужно.
        if stepCount < 2{
            stepCount += 1
            updateUI()
        } else {
            performSegue(withIdentifier: "AddScheduleTable", sender: nil)
        }
    }
}


extension AddScheduleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weekdays.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChooseCell") as? ChooseDayCellTableViewCell else { fatalError()}
        cell.choiceSwitch.isOn = true
        let day = weekdays[indexPath.row]
        cell.setup(day: day.rawValue) { [weak self] isOn in
            guard let self = self else { return }
            if isOn {
                self.selectedDays.insert(day)
            } else {
                self.selectedDays.remove(day)
            }
        }
        return cell
    }
    
    
}
extension AddScheduleViewController: UITableViewDelegate {

}
