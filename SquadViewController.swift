//
//  SquadViewController.swift
//  BrokeBoys FC
//
//  Created by Zhuravlev Dmitry on 23.08.2022.
//

import UIKit


class SquadViewController: UITableViewController {
    
    //var players = Player.getPlayerList()
    var players: [Player] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.getDocument(as: Player.self, collection: "players") { result in
            switch result {
            case .success(let players):
                self.players = players
                self.tableView.reloadData()
                
            case .failure(let error):
                print("error")
            }
        }
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        players.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerID", for: indexPath)

       var content = cell.defaultContentConfiguration()
        
       let player = players[indexPath.row]
        
        content.text = player.name
      cell.contentConfiguration = content
return cell

    }


  


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsPlayerVC = segue.destination as? DetailsPlayerViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
      //  let player = players[indexPath.row]
     //   detailsPlayerVC.player = player
        
    }


}
