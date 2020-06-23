//
//  AddDayViewController.swift
//  STUSY
//
//  Created by Ramin Akhmad on 23.06.2020.
//  Copyright © 2020 Ramin Akhmad. All rights reserved.
//

import UIKit

class AddDayViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let colapsableArray = [ColapsableCell<Weekday>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let leftColor = UIColor(hex: 0x9BD56D)
        let rightColor = UIColor(hex: 0x0F9E98)
        view.setGradientBackground(leftColor: leftColor, rightColor: rightColor, direction: .topToBottom)
        view.layer.masksToBounds = true
        tableView.backgroundColor = .none
//        chooseSegmentedControl.backgroundColor = chooseSegmentedControl.backgroundColor?.withAlphaComponent(0.7)
    }

    

}

extension AddDayViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return colapsableArray.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colapsableArray[section].isOpened ? colapsableArray[section].value.arrayLessons.count + 1 : 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DayCell", for: indexPath) as? DayTableViewCell else { return UITableViewCell() }
            cell.dayLabel.text = colapsableArray[indexPath.section].value.weekday.name
            return cell
        }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        guard indexPath.row == 0 else { return }
//
//        colapsableArray[indexPath.section].isOpened = !colapsableArray[indexPath.section].isOpened
//        tableView.reloadSections(.init(integer: indexPath.section), with: .automatic)
    }


}

extension AddDayViewController: UITableViewDelegate {

}
