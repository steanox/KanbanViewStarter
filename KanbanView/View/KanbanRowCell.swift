//
//  KanbanRowCell.swift
//  KanbanView
//
//  Created by octavianus on 25/06/19.
//  Copyright © 2019 octavianus. All rights reserved.
//

import UIKit
import Foundation


class KanbanRowCell: UITableViewCell{
    let baseViewColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    let priorityColor = [#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1),#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1),#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1),#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)]
    
    var rowView: UIView = UIView()
    var rowLabel: UILabel = UILabel()
    
    var kanbanRow: KanbanRow! {
        didSet{
            configureCell()
            configureBaseView()
            configureRowLabel()
        }
    }
    
    private func configureCell(){
        self.backgroundColor = priorityColor[kanbanRow.priority]
        self.layer.cornerRadius = 15
        
    }
    
    private func configureBaseView(){
        rowView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(rowView)
        
        NSLayoutConstraint.activate([
            rowView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            rowView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            rowView.heightAnchor.constraint(equalTo: rowView.heightAnchor),
            rowView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func configureRowLabel(){
        rowLabel.textAlignment = .left
        rowLabel.font = UIFont(name: "System", size: 12)
        rowLabel.numberOfLines = 0
        rowLabel.translatesAutoresizingMaskIntoConstraints = false
        rowLabel.text = kanbanRow.title
        rowView.addSubview(rowLabel)
        NSLayoutConstraint.activate([
            rowLabel.leftAnchor.constraint(equalTo: rowView.leftAnchor, constant: 5),
            rowLabel.centerYAnchor.constraint(equalTo: rowView.centerYAnchor)
        ])
    }
}

