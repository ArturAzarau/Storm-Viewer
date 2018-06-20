//
//  ViewController.swift
//  Storm Viewer
//
//  Created by Артур Азаров on 20.06.2018.
//  Copyright © 2018 Артур Азаров. All rights reserved.
//

import UIKit

private let cellID = "PictureCell"
private let segueID = "ShowPhoto"

final class PicturesController: UITableViewController {

    // MARK: - Properties
    
    private var pictures = [String]()
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        getPictures()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        getPictures()
    }
    
    // MARK: - Methods
    
    private func getPictures() {
        let path = Bundle.main.resourcePath!
        let items = try! FileManager.default.contentsOfDirectory(atPath: path)
        
        self.pictures = items.filter { $0.hasPrefix("nssl") }
    }
    
    // MARK: - For Table View
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    // MARK: -
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    // MARK: -
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let image = UIImage(named: pictures[indexPath.row])
        performSegue(withIdentifier: segueID, sender: image)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            fatalError("There is no segue identifier")
        }
        
        switch identifier {
        case segueID:
            guard let image = sender as? UIImage, let destination = segue.destination as? ViewPhotoVC else { return }
            destination.pictureToShow = image
        default: break
        }
    }
}

