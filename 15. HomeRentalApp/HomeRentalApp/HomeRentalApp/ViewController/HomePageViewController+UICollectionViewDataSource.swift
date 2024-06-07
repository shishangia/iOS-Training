//
//  HomePageViewController+UICollectionViewDataSource.swift
//  HomeRentalApp
//
//  Created by Shivam Shishangia on 06/06/24.
//

import UIKit

extension HomePageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView.tag == 1 ? categories.count : properties.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as? CategoryCollectionViewCell else {
                fatalError()
            }
            cell.categoryName.text = categories[indexPath.row].name
            cell.categoryImageView.image = categories[indexPath.row].image
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PropertyListCollectionViewCell", for: indexPath) as? PropertyListCollectionViewCell else {
                fatalError()
            }
            cell.propertyImageView.image = properties[indexPath.row].image
            cell.propertyPrice.text = "$\(properties[indexPath.row].price)"
            cell.propertyDetails.text = "\(properties[indexPath.row].bedroom) Bed • \(properties[indexPath.row].bathroom) Bath"
            cell.propertyAddress.text = properties[indexPath.row].address
            return cell
        }
    }
}

