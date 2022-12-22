//
//  DetailsViewController.swift
//  FitFindCornell
//
//  Created by Cheng Fei on 10/24/22.
//

import UIKit
import DropDown

class DetailsViewController: UIViewController {
    
    
    let cover = UIImageView()
    let bookingLable = UILabel()
    let appearance = UINavigationBarAppearance()
    let name = UITextView()
    let saveinfo = UIButton()
    
    var setTime = ""
    var date = ""
    let menuOpen = UIButton()
    let datePicker : UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.locale = .current
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        datePicker.tintColor = .blue
        
        return datePicker
    }()
    var dateFormatter: DateFormatter{
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    //random times for show final version will pull from backend
    let timeSelect: DropDown = {
        let timeSelect = DropDown()
        timeSelect.dataSource = [
            "12:00-1:00",
            "1:00-2:00",
            "2:00-3:00",
            "4:00-5:00",
            "6:00-7:00",
            "8:00-9:00"
            
        ]
        
        return timeSelect
    }()
    
    let gym: GYM
    //let reservation:Reservation
    weak var delegate: addBooking?
    
    init(gym: GYM, delegate: addBooking){
        
        self.delegate = delegate
        self.gym = gym
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        
        title = gym.gymName

        saveinfo.setTitle("save reservation", for: .normal)
        saveinfo.setTitleColor(.black, for: .normal)
        saveinfo.addTarget(self, action: #selector(addRes), for: .touchUpInside)
        saveinfo.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(saveinfo)
        saveinfo.backgroundColor = .lightGray
        saveinfo.clipsToBounds = true
        saveinfo.layer.cornerRadius = 10

        menuOpen.setTitle("select time", for: .normal)
        menuOpen.addTarget(self, action: #selector(openMenu), for: .touchUpInside)
        menuOpen.backgroundColor = .lightGray
        menuOpen.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(menuOpen)
        menuOpen.clipsToBounds = false
        menuOpen.layer.cornerRadius = 10
        menuOpen.setTitleColor(.black, for: .normal)

        timeSelect.backgroundColor = .lightGray
        timeSelect.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(timeSelect)
        timeSelect.anchorView = menuOpen
        timeSelect.clipsToBounds = false
        timeSelect.cornerRadius = 10
        
        
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.backgroundColor = .systemYellow
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        
        
        
        

        timeSelect.selectionAction = { index, title in
            self.setTime = String(title)
            
            self.menuOpen.setTitle(title, for: .normal)

        }
        
        
        
        bookingLable.text = "Booking Details:"
        
        bookingLable.font = .systemFont(ofSize: 20)
        bookingLable.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bookingLable)
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(datePicker)
        
        
        

        
        setupconstraints()
        
        
        

        // Do any additional setup after loading the view.
    }
    
    func setupconstraints(){

        
        NSLayoutConstraint.activate([
            bookingLable.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor, constant: 20),
            bookingLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
        
        ])
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo:bookingLable.bottomAnchor, constant: 20),
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        
        ])
        
        
 
        NSLayoutConstraint.activate([
            saveinfo.topAnchor.constraint(equalTo:menuOpen.bottomAnchor, constant: 20),
            saveinfo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveinfo.widthAnchor.constraint(equalToConstant: 200 ),
            saveinfo.heightAnchor.constraint(equalToConstant: 40)


        ])
        NSLayoutConstraint.activate([
            menuOpen.topAnchor.constraint(equalTo:datePicker.bottomAnchor, constant: 20),
            menuOpen.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            menuOpen.widthAnchor.constraint(equalToConstant: 200 ),
            menuOpen.heightAnchor.constraint(equalToConstant: 40)


        ])
        
        
        
    }

   @objc func addRes(){
       date = (dateFormatter.string(from: datePicker.date))
       
       if (setTime == ""){
           
           invalidtimeAlert()
           
       }
       else{
           
           let newRes = Reservation(time: setTime, date: date, gym: gym.gymName)
           delegate?.addRes(res: newRes)
           
           
           
           self.navigationController?.popViewController(animated: true)
       }

    }
    @objc func openMenu(){
        timeSelect.show()
        
    }
    @objc func invalidtimeAlert(){
        let alert = UIAlertController(title: "You are missing a time", message: "Please select a time", preferredStyle: .alert)
        present(alert, animated: true)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
    }
    

 

}


protocol addBooking: ViewController{
    func addRes(res: Reservation)
}
