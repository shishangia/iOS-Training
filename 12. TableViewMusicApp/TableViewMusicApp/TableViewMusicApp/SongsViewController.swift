//
//  SongsViewController.swift
//  TableViewMusicApp
//
//  Created by Shivam Shishangia on 04/06/24.
//

import UIKit

class SongsViewController: UIViewController {

    @IBOutlet weak var songsTableView: UITableView!

    var songs: [Song] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        self.navigationItem.title = "Songs"
        songsTableView.dataSource = self
        songsTableView.delegate = self
        songs = Mock.generateSongs()
    }
}

extension SongsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Top Songs"
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SongsTableViewCell", for: indexPath) as? SongsTableViewCell else {
            fatalError("Cannot fetch reusable cell")
        }
        cell.songImage.image = songs[indexPath.row].image
        cell.songName.text = songs[indexPath.row].name
        cell.songArtist.text = songs[indexPath.row].artist
        return cell
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.frame = CGRect(x: 20, y: 8, width: tableView.frame.width, height: 20)
            headerView.textLabel?.textColor = .systemBlue
            headerView.textLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        }
    }
}
