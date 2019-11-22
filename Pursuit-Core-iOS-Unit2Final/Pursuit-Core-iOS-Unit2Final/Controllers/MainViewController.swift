//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var crayons = [Crayon]()
    
    override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        loadData()
  }

    func loadData() {
        crayons = Crayon.allTheCrayons
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let CAViewController = segue.destination as? ColorAdjusterViewController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("Unable to access Color Adjuster View controller")
        }
        
        let crayon = crayons[indexPath.row]
        CAViewController.crayon = crayon
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        crayons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "crayonCell", for: indexPath)
        
        let crayon = crayons[indexPath.row]
        
        
        cell.textLabel?.text = crayon.name
        cell.detailTextLabel?.text = crayon.hex
        cell.backgroundColor = UIColor(red: CGFloat(crayon.red/255) , green: CGFloat(crayon.green/255), blue: CGFloat(crayon.blue/255), alpha: 1)
        
        return cell
    }
    
    
}



