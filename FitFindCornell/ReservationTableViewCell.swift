//
//  ReservationTableViewCell.swift
//  FitFindCornell
//
//  Created by Cheng Fei on 11/25/22.
//

import UIKit

class ReservationTableViewCell: UITableViewCell {
    
    let time = UILabel()
    let date = UILabel()
    let gym = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        time.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(time)
        
        date.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(date)
        
        gym.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(gym)
        
        setupContraints()
    }
    
    func configure(reservation: Reservation){
        time.text = reservation.time
        date.text = reservation.date
        gym.text = reservation.gym
    }
    
    func setupContraints(){
        let padding:CGFloat = 10
        NSLayoutConstraint.activate([
            
            gym.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            gym.topAnchor.constraint(equalTo: contentView.topAnchor,constant: padding),
            //contentView.topAnchor.constraint(equalTo: gym.topAnchor, constant: -100)
        
        ])
        NSLayoutConstraint.activate([
            date.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            date.topAnchor.constraint(equalTo: gym.bottomAnchor)
        
        ])
        
        NSLayoutConstraint.activate([
            time.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            time.topAnchor.constraint(equalTo: date.bottomAnchor),
            contentView.bottomAnchor.constraint(equalTo: time.bottomAnchor, constant: padding)
        
        ])
        
        
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
