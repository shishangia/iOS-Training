//
//  VideoDetailViewController.swift
//  APIJSONParsingTabViewController
//
//  Created by Shivam Shishangia on 19/06/24.
//

import UIKit

class VideoDetailViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var transcodingsTableView: UITableView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    let videoViewModel = VideoViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchData()
    }
}

extension VideoDetailViewController {
    private func setupUI() {
        transcodingsTableView.dataSource = self
        containerView.isHidden = true
    }

    private func fetchData() {
        videoViewModel.fetchVideoDetail {
            DispatchQueue.main.async {
                self.stopAnimatingAndReloadView()
            }
        }
    }

    private func stopAnimatingAndReloadView() {
        titleLabel.text = Constants.LabelPrefix.title.rawValue + (videoViewModel.getVideoTitle() ?? "")
        createdAtLabel.text = Constants.LabelPrefix.created.rawValue + (videoViewModel.getVideoCreated() ?? "")
        activityIndicator.stopAnimating()
        containerView.isHidden = false
        transcodingsTableView.reloadData()
    }
}
