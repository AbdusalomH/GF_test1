//
//  FolowersListVC.swift
//  GF_test1
//
//  Created by Abdusalom Hojiev on 2/4/21.
//  Copyright © 2021 Abdusalom Hojiev. All rights reserved.
//

import UIKit

class FolowersListVC: UIViewController {
    
    enum Section { case main }

    var username: String!
    var uicollectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
    var followers: [Follower]           = []
    var filteredFollower: [Follower]    = []
    var page                            = 1
    var isMorethanHundred: Bool         = true
    var isSearching: Bool               = false

    override func viewDidLoad() {
        super.viewDidLoad()
        configiewViewController()
        configureSearchController()
        creatCollectioView()
        getFollowerRequest(username: username, pageNumber: page)
        configureDataSource()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    
    func configiewViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    func configureSearchController() {
        
        let searchController                                    = UISearchController()
        searchController.searchResultsUpdater                   = self
        searchController.searchBar.delegate                     = self
        searchController.searchBar.placeholder                  = "Search a username"
        searchController.obscuresBackgroundDuringPresentation   = false
        navigationItem.searchController                         = searchController
        
  
    }
    
    func getFollowerRequest(username: String, pageNumber: Int) {
        
        showAnimation()
        
        NetworkManager.shared.getFollowers(for: username, page: pageNumber) { [weak self] result in
           
            guard let self = self else { return }
            
            self.dismissAnimation()
            
            switch result {
            case .success(let resultsfollowers):
                
                if resultsfollowers.count < 100 { self.isMorethanHundred = false }
                self.followers.append(contentsOf: resultsfollowers)
                if resultsfollowers.isEmpty {
                    DispatchQueue.main.async {
                        self.emptyStateView(message: GFError.noFollowers.rawValue, view: self.view)
                        return
                    }
                }
                self.updateData(follower: self.followers)
                
            case .failure(let errorMessage):
                self.presentGFalertOnMainThread(title: "Error", message: errorMessage.rawValue, buttonTitle: "Ok")

            }
        }
    }
    
    func creatCollectioView() {
        
        uicollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        view.addSubview(uicollectionView)
        uicollectionView.backgroundColor = .systemBackground
        uicollectionView.delegate = self
        uicollectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
    }

    func configureDataSource() {
        
        dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: uicollectionView, cellProvider: { (collectionview, indexPath, follower) -> UICollectionViewCell? in
            
            let cell = collectionview.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as! FollowerCell
            
            cell.set(follower: follower)
            return cell
        })
    }
    
    func updateData(follower: [Follower]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(follower)

        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
}

extension FolowersListVC: UICollectionViewDelegate {
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        let offsetY = scrollView.contentOffset.y
        let contentHeigth = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeigth - height {
            guard isMorethanHundred else { return }
            page += 1
            getFollowerRequest(username: username, pageNumber: page)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let activeArray = isSearching ? filteredFollower : followers
        let selectedFollower = activeArray[indexPath.item]
    
        let destVC = UserInfoVC()
        let navController = UINavigationController(rootViewController: destVC)
        
        destVC.username = selectedFollower.login
        present(navController, animated: true)
  
    }
}

extension FolowersListVC: UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter = searchController.searchBar.text, !filter.isEmpty else {return}
        isSearching = true
        filteredFollower = followers.filter {$0.login.lowercased().contains(filter.lowercased())}
        updateData(follower: filteredFollower)
        }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        updateData(follower: followers)
        
    }
}

