//
//  KanbanColumnCell.swift
//  KanbanView
//
//  Created by octavianus on 24/06/19.
//  Copyright © 2019 octavianus. All rights reserved.
//

import UIKit

class KanbanColumnCell: UICollectionViewCell{
    let kanbanRowCellIdentifier = "KanbanRow"
    var kanbanColor: UIColor { return #colorLiteral(red: 0.9233187437, green: 0.91783005, blue: 0.9275379181, alpha: 1) }
    
    var rows: [KanbanRow] = [] {
        didSet{
            configureKanbanTableView()
            configureInteraction()
        }
    }
    
    //TODO: 1. Create UIDraginteraction Instance
    
    
    var kanbanRowsTable: UITableView!
    private func configureKanbanTableView(){
        kanbanRowsTable = UITableView(frame: bounds)
        kanbanRowsTable.register(KanbanRowCell.self, forCellReuseIdentifier: kanbanRowCellIdentifier)
        kanbanRowsTable.dataSource = self
        kanbanRowsTable.delegate = self
        
        kanbanRowsTable.separatorStyle = .none
        kanbanRowsTable.insetsContentViewsToSafeArea = true
        kanbanRowsTable.backgroundColor = kanbanColor
        kanbanRowsTable.translatesAutoresizingMaskIntoConstraints = false
        addSubview(kanbanRowsTable)
        
        NSLayoutConstraint.activate([
            kanbanRowsTable.topAnchor.constraint(equalTo: topAnchor,constant: 30),
            kanbanRowsTable.rightAnchor.constraint(equalTo: rightAnchor),
            kanbanRowsTable.leftAnchor.constraint(equalTo: leftAnchor),
            kanbanRowsTable.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -30),
        ])
    }
    

}
extension KanbanColumnCell: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: kanbanRowCellIdentifier, for: indexPath) as? KanbanRowCell else { return UITableViewCell() }
        cell.kanbanRow = rows[indexPath.section]
        return cell
    }
}

extension KanbanColumnCell: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0{
            let headerView = UIView()
            headerView.backgroundColor = kanbanColor
            
            let pullView = UIView()
            pullView.backgroundColor = UIColor.black
            pullView.frame.size = CGSize(width: 100, height: 5)
            pullView.layer.cornerRadius = 3
            pullView.center = CGPoint(x: tableView.center.x, y: 10)
            headerView.addSubview(pullView)
            return headerView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension KanbanColumnCell: UIDragInteractionDelegate{
    
    //TODO: 2. Initiate the UIDragInteraction Instance and add the interaction using the addInteraction() method
    private func configureInteraction(){
        // Write Some Code Here
    }
    
    //TODO: 3. Implement How the drag functionality behave
    func dragInteraction(_ interaction: UIDragInteraction, itemsForBeginning session: UIDragSession) -> [UIDragItem] {
        // Write Some Code Here
        return []
    }
}
