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
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension DayViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DayCell", for: indexPath) as? DayTableViewCell else { fatalError() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? DayTableViewCell {
            
            UIView.animate(withDuration: 0.3) {
                cell.footerView.isHidden = !cell.footerView.isHidden
            }
            tableView.beginUpdates()
            tableView.endUpdates()
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }

    
}

extension DayViewController: UITableViewDelegate {
        
}
