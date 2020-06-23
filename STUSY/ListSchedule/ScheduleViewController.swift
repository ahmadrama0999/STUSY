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
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        guard let navBar = navigationController?.navigationBar else { return }
        navBar.barStyle = .default
    }
    
    @IBAction func addNewScheduleAction(_ sender: UIBarButtonItem) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DaySegue" {
            guard let destination = segue.destination as? DayViewController else { return }
        } else if segue.identifier == "addSchedule" {
            guard let destination = segue.destination as? AddScheduleViewController else { return }
        }
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
        guard let navBar = navigationController?.navigationBar else { return }
        navBar.barStyle = .black
        navBar.setBackgroundImage(UIImage(), for: .default)
        performSegue(withIdentifier: "DaySegue", sender: nil)
        
    }
    
    
}

extension ScheduleViewController: UITableViewDelegate {
    
}
