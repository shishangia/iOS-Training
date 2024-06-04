//
//  CollectionViewViewController.swift
//  TabBarTableViewCollectionView
//
//  Created by Shivam Shishangia on 31/05/24.
//

import UIKit

class CollectionViewViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    var data: [Data] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        generateData()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func generateData() {
        for i in 1...20 {
            data.append(Data(data: String(i), image: UIImage(named: "Image")))
        }
    }
}

extension CollectionViewViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell else {
            print("Error fetching cell")
            return CollectionViewCell()
        }
        cell.labelView.text = data[indexPath.row].data
        cell.imageView.image = data[indexPath.row].image
        cell.contentView.layer.cornerRadius = 75
        cell.contentView.layer.masksToBounds = true
        return cell
    }
}
