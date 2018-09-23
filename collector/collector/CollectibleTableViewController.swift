//
//  CollectibleTableViewController.swift
//  collector
//
//  Created by Jonathan Cochran on 9/5/18.
//  Copyright © 2018 Jonathan Cochran. All rights reserved.
//

import UIKit

class CollectibleTableViewController: UITableViewController {
    
    var collection: [Collectible] = []
    
    override func viewWillAppear(_ animated: Bool) {
        getCollectables()
    }

    func getCollectables() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            if let collectables = try? context.fetch(Collectible.fetchRequest()){
                if let theCollectables = collectables as? [Collectible]{
                  collection = theCollectables
                    tableView.reloadData()
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return collection.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()

       let collectables = collection[indexPath.row]
        cell.textLabel?.text = collectables.title
        if let data = collectables.image {
        cell.imageView?.image = UIImage(data: data)
        }
        return cell
    }

}
