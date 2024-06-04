//
//  ContactListViewController.swift
//  TableView
//
//  Created by Shivam Shishangia on 29/05/24.
//

import UIKit

struct ContactData {
    var name: String
    var age: Int
    var showImage: Bool = false
}

struct Section {
    var sectionName: String
    var sectionStudents: [ContactData]
    var isExpanded: Bool
}

class ContactListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var sections: [Section] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        sections = generateSingleSection()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    func generateData() -> [Section] {
        return [
            Section(sectionName: "Apolis Batch 1",
                    sectionStudents: [ContactData(name: "Shivam Shishangia", age: 26),
                           ContactData(name: "Chinmay Ashtikar", age: 22),
                           ContactData(name: "Sagar Sharma", age: 25),
                           ContactData(name: "Kuldeep Singh", age: 24)],
                    isExpanded: false),
            Section(sectionName: "Apolis Batch 2",
                    sectionStudents: [ContactData(name: "Siran Li", age: 21),
                                      ContactData(name: "Disha Patel", age: 23),
                                      ContactData(name: "Sai Charan", age: 27)],
                    isExpanded: false),
            Section(sectionName: "Apolis Batch 3",
                    sectionStudents: [ContactData(name: "Varshith Chilamkurthi", age: 25),
                                      ContactData(name: "Venkat Chenna Reddy", age: 23)],
                    isExpanded: false)
        ]
    }
    
    func generateSingleSection() -> [Section] {
        return [
            Section(sectionName: "Section Name",
                    sectionStudents: [ContactData(name: "Shivam Shishangia", age: 26),
                                      ContactData(name: "Chinmay Ashtikar", age: 22),
                                      ContactData(name: "Sagar Sharma", age: 25),
                                      ContactData(name: "Kuldeep Singh", age: 24),
                                      ContactData(name: "Siran Li", age: 21),
                                      ContactData(name: "Disha Patel", age: 23),
                                      ContactData(name: "Sai Charan", age: 27),
                                      ContactData(name: "Varshith Chilamkurthi", age: 25),
                                      ContactData(name: "Venkat Chenna Reddy", age: 23),
                                      ContactData(name: "Shivam Shishangia", age: 26),
                                      ContactData(name: "Chinmay Ashtikar", age: 22),
                                      ContactData(name: "Sagar Sharma", age: 25),
                                      ContactData(name: "Kuldeep Singh", age: 24),
                                      ContactData(name: "Siran Li", age: 21),
                                      ContactData(name: "Disha Patel", age: 23),
                                      ContactData(name: "Sai Charan", age: 27),
                                      ContactData(name: "Varshith Chilamkurthi", age: 25),
                                      ContactData(name: "Venkat Chenna Reddy", age: 23)],
                    isExpanded: true)
        ]
    }
}

extension ContactListViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].isExpanded ? sections[section].sectionStudents.count : 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].sectionName
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ContactTableViewCell.self),
                                                       for: indexPath) as? ContactTableViewCell else {
            return ContactTableViewCell()
        }
        let contactInfo = sections[indexPath.section].sectionStudents[indexPath.row]
        cell.nameLabel.text = contactInfo.name
        cell.tickImage.isHidden = !contactInfo.showImage
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cell = tableView.cellForRow(at: indexPath) as? ContactTableViewCell else {
            return
        }
        sections[indexPath.section].sectionStudents[indexPath.row].showImage.toggle()
        tableView.reloadRows(at: [indexPath], with: .automatic)
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        guard let nextViewController = storyboard.instantiateViewController(withIdentifier: "ContactDetailViewController") as? ContactDetailViewController else {
//            print("Could not initialize ContactDetailViewController")
//            return
//        }
//        nextViewController.contactData = sections[indexPath.section].sectionStudents[indexPath.row]
//        self.navigationController?.pushViewController(nextViewController, animated: true)
        
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = SectionView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 57))
        headerView.label.text = sections[section].sectionName
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleExpandCollapse(_:)))
        headerView.addGestureRecognizer(tapGesture)
        headerView.tag = section
        
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 57
    }
        
    @objc func handleExpandCollapse(_ gesture: UITapGestureRecognizer) {
        guard let section = gesture.view?.tag else {
            return
        }
        
        sections[section].isExpanded.toggle()
        tableView.reloadSections([section], with: .automatic)
    }
}
