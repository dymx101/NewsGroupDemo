//
//  PhotoListViewController.swift
//  codeChallengeApp
//
//  Created by Yiming Dong on 2019/4/24.
//  Copyright © 2019 Yiming Dong. All rights reserved.
//

import UIKit
import SVProgressHUD

protocol PhotoListViewControllerDelegate: class {
    func showDetail(_ photo: Photo)
}

class PhotoListViewController: BaseViewController {
    
    weak var delegate: PhotoListViewControllerDelegate?
    
    let refreshControl = UIRefreshControl()
    
    @IBOutlet weak var photoListView: UICollectionView! {
        didSet {
            photoListView.backgroundColor = UIColor.clear
            let nib = UINib(nibName: PhotoListItemCell.NIB_NAME, bundle: nil)
            photoListView.register(nib, forCellWithReuseIdentifier: PhotoListItemCell.REGISTER_ID)
        }
    }

    let viewModel = DependencyInjector.shared.resolve(PhotoListViewModelProtocol.self)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = viewModel.title

        setupPullToRefresh()
        
        // Start loading photos
        refreshControl.beginRefreshing()
        loadPhotos()
    }
    
    override func viewDidLayoutSubviews() {
        updateListLayout()
    }
    
    private func setupPullToRefresh() {
        photoListView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshPhotos), for: .valueChanged)
    }
    
    @objc private func refreshPhotos() {
        loadPhotos(refresh: true)
    }
    
    private func loadPhotos(refresh: Bool = false) {
        viewModel.getPhotos(refresh: refresh) { [weak self] (error) in
            self?.refreshControl.endRefreshing()
            
            if let error = error {
                SVProgressHUD.showError(withStatus: Localized(key: "msg_get_photos_error"))
                print("load photos error: \(error.localizedDescription)")
            }
            
            self?.photoListView.reloadData()
        }
    }
    
    private func updateListLayout() {
        let layout = photoListView.collectionViewLayout as! UICollectionViewFlowLayout
        let sectionInsets = layout.sectionInset
        let itemSpacing = layout.minimumInteritemSpacing
        
        let itemCountPerRow = viewModel.photosInRow
        
        let colletionViewWidth = photoListView.frame.size.width
        let gap = (sectionInsets.left + sectionInsets.right) + itemSpacing * CGFloat(itemCountPerRow - 1)
        let itemWidth = (colletionViewWidth - gap) / CGFloat(itemCountPerRow)
        
        let itemSize = CGSize(width: itemWidth, height: itemWidth)
        if layout.itemSize != itemSize {
            layout.itemSize = itemSize
        }
    }
}

extension PhotoListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoListItemCell.REUSE_ID, for: indexPath) as! PhotoListItemCell
        
        let photo = viewModel.photos[indexPath.item]
        
        var cellViewModel = DependencyInjector.shared.resolve(PhotoListItemCellViewModelProtocol.self)
        cellViewModel?.photo = photo
        cell.viewModel = cellViewModel
        cell.accessibilityIdentifier = "id_list_cell_\(indexPath.item)"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.showDetail(viewModel.photos[indexPath.item])
        print("showDetail at index: \(indexPath.item)")
    }
}
