//
//  Infos.swift
//  BasicLogin
//
//  Created by Victor Felipe dos Santos on 07/02/21.
//

import UIKit

class Infos : UITableViewController {
    var pictures = [String]()

    override func viewDidLoad() {
        title = "Pictures"
        navigationController?.navigationBar.prefersLargeTitles = true

        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)

        for item in items{
            if item.hasPrefix("nssl"){
                pictures.append(item)
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        pictures.sort()
        let cell = tableView.dequeueReusableCell(withIdentifier: "Pictures", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let dvc = self.storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            dvc.selectedPictureNumber = indexPath.row + 1
            dvc.totalPictures = pictures.count
            dvc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(dvc, animated: true)
        }
    }
}
