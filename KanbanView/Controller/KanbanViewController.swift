//
//  ViewController.swift
//  KanbanView
//
//  Created by octavianus on 24/06/19.
//  Copyright © 2019 octavianus. All rights reserved.
//

import UIKit

class KanbanViewController: UIViewController {
    
    let columnCellIdentifier: String = "KanbanColumnCell"
    
    var horizontalCollectionView: UICollectionView?
    var collectionHeight: CGFloat{ return view.bounds.height }
    var collectionWidth: CGFloat { return view.bounds.width / 4 }
    let columns: [KanbanColumn] = KanbanColumn.fetchTestData()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        view.translatesAutoresizingMaskIntoConstraints = false
        configureCollectionView()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        horizontalCollectionView?.collectionViewLayout.invalidateLayout()
    }


}

extension KanbanViewController{
    private func configureCollectionView(){
        horizontalCollectionView = UICollectionView(frame: view.bounds , collectionViewLayout: setupCollectionViewLayout())
        horizontalCollectionView?.translatesAutoresizingMaskIntoConstraints = false
        horizontalCollectionView?.register(KanbanColumnCell.self, forCellWithReuseIdentifier: columnCellIdentifier)
        horizontalCollectionView?.dataSource = self
        horizontalCollectionView?.delegate = self
        horizontalCollectionView?.backgroundColor = UIColor.white
        
        
        if let kanbanColumnCollection = horizontalCollectionView{
            self.view.addSubview(kanbanColumnCollection)
            NSLayoutConstraint.activate([
                horizontalCollectionView!.topAnchor.constraint(equalTo: view.topAnchor),
                horizontalCollectionView!.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                horizontalCollectionView!.leftAnchor.constraint(equalTo: view.leftAnchor),
                horizontalCollectionView!.rightAnchor.constraint(equalTo: view.rightAnchor)]
            )
        }
    }
    
    
    private func setupCollectionViewLayout() -> UICollectionViewFlowLayout{
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: collectionWidth, height: collectionHeight)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        return layout
    }
}

extension KanbanViewController: UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return columns.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: columnCellIdentifier, for: indexPath) as! KanbanColumnCell
        cell.rows = columns[indexPath.row].row
        return cell
    }
}



