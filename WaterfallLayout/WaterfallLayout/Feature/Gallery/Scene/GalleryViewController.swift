//
//  GalleryViewController.swift
//  WaterfallLayout
//
//  Created by ParulParima on 11/7/22.
//

import Foundation
import UIKit

class GalleryViewController: UIViewController {
    
    
    @IBOutlet weak var leftTableView: UITableView!
    @IBOutlet weak var rightTableView: UITableView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    var viewModel: GalleryViewModel!
    
    init(viewModel: GalleryViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "GalleryViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showLoader()
        leftTableView.delegate = self
        leftTableView.dataSource = self
        rightTableView.delegate = self
        rightTableView.dataSource = self
        leftTableView.register(GalleryTableCell.nib(), forCellReuseIdentifier: GalleryTableCell.identifier)
        rightTableView.register(GalleryTableCell.nib(), forCellReuseIdentifier: GalleryTableCell.identifier)
        leftTableView.showsVerticalScrollIndicator = false
        rightTableView.showsVerticalScrollIndicator = false
        getImages()
    }
    
    func showLoader() {
        indicator.isHidden = false
        indicator.startAnimating()
    }
    
    func hideLoader() {
        indicator.stopAnimating()
        indicator.isHidden = true
    }
    
    func getImages() {
        self.viewModel.getdata(width: (UIScreen.main.bounds.width-30)/2) {
            DispatchQueue.main.async{
                self.hideLoader()
                self.leftTableView.reloadData()
                self.rightTableView.reloadData()
            }
        }
    }
    
}

extension GalleryViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        leftTableView.contentOffset = scrollView.contentOffset
        rightTableView.contentOffset = scrollView.contentOffset
    }
}
extension GalleryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == leftTableView {
            return viewModel.leftStack.count
        }
        else {
            return viewModel.rightStack.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GalleryTableCell.identifier, for: indexPath) as! GalleryTableCell
        if tableView == leftTableView {
            cell.photo.image = viewModel.leftStack[indexPath.row].image
        }
        else {
            cell.photo.image = viewModel.rightStack[indexPath.row].image
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == leftTableView {
            return viewModel.leftStack[indexPath.row].height + 10
        }
        else {
            return viewModel.rightStack[indexPath.row].height + 10
        }
    }
    
}
