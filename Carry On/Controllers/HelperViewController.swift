//
//  HelperViewController.swift
//  Carry On
//
//  Created by Jonas on 21.03.20.
//  Copyright © 2020 Jonas. All rights reserved.
//

import UIKit
import BadgeSwift

class HelperViewController: UIViewController {

    let entryArray = ["Erntehelfer", "Einkaufshilfe"]
    var newEntryArray: [HelpRequestModel] = []
    
    let loremIpsum = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum."
    
    @IBOutlet var helpRequestTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        helpRequestTable.dataSource = self
        helpRequestTable.delegate = self
        helpRequestTable.rowHeight = 110
        helpRequestTable.delaysContentTouches = false
        
        newEntryArray.append(
            HelpRequestModel(
                title: "In der Konstanzer Kita aushelfen",
                description: loremIpsum,
                category: 1,
                date: "19.06.2020",
                duration: "3 Stunden",
                organization: "Kita Konstanz",
                location: nil,
                contact: nil
            )
        )

        newEntryArray.append(
            HelpRequestModel(
                title: "Mit Tierheimhunden Gassi gehen",
                description: loremIpsum,
                category: 1,
                date: "22.06.2020",
                duration: "1.5 Stunden",
                organization: "Tierheim Gelsenkirchen",
                location: nil,
                contact: nil
            )
        )
        
        newEntryArray.append(
            HelpRequestModel(
                title: "Für Obdachlose kochen",
                description: loremIpsum,
                category: 1,
                date: "23.06.2020",
                duration: "2 Stunden",
                organization: "Caritas Konstanz",
                location: nil,
                contact: nil
            )
        )


                
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let sender = sender as? HelpRequestModel {
            let detailViewController = segue.destination as! HelpRequestDetailViewController
            detailViewController.task = sender
        }
    }
    
}

extension HelperViewController:
    UITableViewDataSource,
    UITableViewDelegate
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newEntryArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HelpTableViewCell
//        cell.helpRequestTitle.text = newEntryArray[indexPath.row].title
//        cell.descriptionLabel.text = newEntryArray[indexPath.row].description
//
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "CardCell",
            for: indexPath
        ) as! HelpTableViewCardCell
        
        cell.helpRequest = newEntryArray[indexPath.row]
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        //performSegue(withIdentifier: "requestDetailSegue", sender: newEntryArray[indexPath.row])
        cell?.setSelected(false, animated: true)
        
        guard let taskDetailsVC = self.storyboard?.instantiateViewController(
            withIdentifier: "HelpRequestDetailViewController"
        ) as? HelpRequestDetailViewController else {return}
        
        taskDetailsVC.task = newEntryArray[indexPath.row]
        
        let navController = UINavigationController(rootViewController: taskDetailsVC)
        self.navigationController?.present(navController, animated: true, completion: nil)

        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //return 100
        return 280
    }

    
}


class HelpTableViewCell: UITableViewCell {
    
    @IBOutlet var helpRequestTitle: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.numberOfLines = 0
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

class HelpTableViewCardCell: UITableViewCell {
    
    @IBOutlet var outerView: UIView!
    @IBOutlet var orgaNameLabel: BadgeSwift!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var distanceLabel: UILabel!
    
    var helpRequest: HelpRequestModel!

    override func layoutSubviews() {
        self.selectionStyle = .none
        outerView.layer.cornerRadius = 10
        
        orgaNameLabel.text = helpRequest.organization
        orgaNameLabel.insets = CGSize(width: 10, height: 0)
        orgaNameLabel.sizeToFit()
        descriptionLabel.text = helpRequest.description
        titleLabel.text = helpRequest.title
        dateLabel.text = helpRequest.date
        durationLabel.text = helpRequest.duration
        //distanceLabel.text = helpRequest.dista
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        animShrink()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        animReset()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        animReset()
    }

    public func animShrink(){

        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseOut,animations: {
            self.outerView.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
        })

    }
    
    public func animReset(){

        UIView.animate(withDuration: 0.12, animations: {
            self.outerView.transform = CGAffineTransform.identity
        })
        
    }
    
}
