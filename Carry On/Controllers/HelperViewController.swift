//
//  HelperViewController.swift
//  Carry On
//
//  Created by Jonas on 21.03.20.
//  Copyright © 2020 Jonas. All rights reserved.
//

import UIKit

class HelperViewController: UIViewController {

    let entryArray = ["Erntehelfer", "Einkaufshilfe"]
    
    @IBOutlet var helpRequestTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        helpRequestTable.dataSource = self
        helpRequestTable.delegate = self
        
    }

}

extension HelperViewController:
    UITableViewDataSource,
    UITableViewDelegate
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HelpTableViewCell
        cell.helpRequestTitle.text = entryArray[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
}


class HelpTableViewCell: UITableViewCell {
    
    @IBOutlet var helpRequestTitle: UILabel!
    
    
}
