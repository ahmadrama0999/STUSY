//
//  ScheduleViewController.swift
//  STUSY
//
//  Created by Ramin Akhmad on 11.06.2020.
//  Copyright © 2020 Ramin Akhmad. All rights reserved.
//

import UIKit

struct Schedule {
    let uni: String
    let groupName: String
}

class ScheduleViewController: UIViewController {
    
    let array: [Schedule] = [Schedule(uni: "ICS",groupName: "AI 172")]

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addNewScheduleAction(_ sender: UIBarButtonItem) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "DaySegue" else { return }
        guard let destination = segue.destination as? DayViewController else { return }
    }

}

extension ScheduleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ScheduleCell", for: indexPath) as? ScheduleTableViewCell else { fatalError() }
        cell.setupCell(schedule: array[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

    
}

extension ScheduleViewController: UITableViewDelegate {
        
}
