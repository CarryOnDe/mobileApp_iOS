//
//  HelpSearchController.swift
//  Carry On
//
//  Created by Jonas on 21.03.20.
//  Copyright © 2020 Jonas. All rights reserved.
//

import UIKit

class HelpSearchViewController: UIViewController {

    @IBOutlet var taskTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        taskTableView.delegate = self
        taskTableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let sender = sender as? HelpRequestModel {
            let detailViewController = segue.destination as! HelpRequestDetailViewController
            detailViewController.task = sender
        }
    }

}

extension HelpSearchViewController:
    UITableViewDelegate,
    UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskTableCell
        cell.taskTitle = indexPath.row + 1
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        performSegue(withIdentifier: "EditTaskSegue", sender: nil)
        cell?.setSelected(false, animated: true)
    }

    
    
}

class TaskTableCell: UITableViewCell {
    
    @IBOutlet var taskTitleLabel: UILabel!
    @IBOutlet var taskHelperCount: UILabel!
    
    var taskTitle: Int = 0
    
    override func layoutSubviews() {
        super.layoutSubviews()
        taskHelperCount.layer.cornerRadius = 12
        taskHelperCount.clipsToBounds  = true
        let randInt = Int.random(in: 1...9)
        taskHelperCount.text = "\(randInt)"
        taskTitleLabel.text = "Aufgabe \(taskTitle)"

    }
    
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
