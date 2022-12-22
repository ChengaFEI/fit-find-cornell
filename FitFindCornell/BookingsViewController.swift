//
//  BookingsViewController.swift
//  FitFindCornell
//
//  Created by Cheng Fei on 11/25/22.
//

import UIKit

class BookingsViewController: UIViewController, UITableViewDelegate {
 
    

    

    
    let appearance = UINavigationBarAppearance()
    var reservations: [Reservation] = []
    let reservedTable = UITableView()
    let reusableidentifier = "reservationReuseidentifier"
    init(reservations: [Reservation]){
        self.reservations = reservations
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "bookings"
        
        reservedTable.translatesAutoresizingMaskIntoConstraints = false
        reservedTable.backgroundColor = .white
        view.addSubview(reservedTable)
        reservedTable.dataSource = self
        reservedTable.delegate = self
        reservedTable.register(ReservationTableViewCell.self, forCellReuseIdentifier: reusableidentifier)
        
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.backgroundColor = .systemYellow
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        
        
        setupConstraints()

        // Do any additional setup after loading the view.
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            reservedTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            reservedTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            reservedTable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            reservedTable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        
    }
    


}

extension BookingsViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reservations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = reservedTable.dequeueReusableCell(withIdentifier: reusableidentifier, for: indexPath) as? ReservationTableViewCell{
            cell.configure(reservation: reservations[indexPath.row])
            return cell
            
        }
        
        else{
            return UITableViewCell()
        }
    }
    
    
}



    
