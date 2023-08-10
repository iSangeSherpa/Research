//
//  MainTableViewController.swift
//  Tutorial
//
//  Created by Sange Sherpa on 07/08/2023.
//

import UIKit
import SnapKit
import MaterialComponents.MaterialDialogs

class MainTableViewController: UIViewController {
    
    let sectionView: UIView = {
        let v = UIView()
        v.backgroundColor = .lightGray
        return v
    }()
    
    var sectionTitles: [String] = [ "Recent Orders", "Recent Table Booking"]
    
    var orders: [Order] = [
        Order(orderImage: UIImage(named: "img1"), orderedBy: "John Sneddon", orderedFrom: "Palo Alto", orderDate: "04 Aug 2019", orderTime: "05:13", orderPrice: "$34"),
        Order(orderImage: UIImage(named: "img2"), orderedBy: "Farrokh Hashemi", orderedFrom: "5b Sutton place, Farrer", orderDate: "04 Aug 2019", orderTime: "05:13", orderPrice: "$34"),
        Order(orderImage: UIImage(named: "img3"), orderedBy: "Takamaru Ayako", orderedFrom: "Seville", orderDate: "04 Aug 2019", orderTime: "05:13", orderPrice: "$34"),
        Order(orderImage: UIImage(named: "img1"), orderedBy: "John Sneddon", orderedFrom: "Palo Alto", orderDate: "04 Aug 2019", orderTime: "05:13", orderPrice: "$34"),
    ]
    
    lazy var bookings: [Booking] = [
        Booking(orderedBy: "John Sneddon", orderDesc: "Looking forward to eating with you", orderDate: "04 Aug 2019", orderTime: "05:13", statusButton: getButton("Booked", backgroundColor: .orange)),
        Booking(orderedBy: "John Sneddon", orderDesc: "Looking forward to eating with you", orderDate: "04 Aug 2019", orderTime: "05:13", statusButton: getButton("Checked Out", backgroundColor: .blue))
    ]
    
    var table: UITableView = {
        var table = UITableView()
        table.register(OrderTableViewCell.self, forCellReuseIdentifier: OrderTableViewCell.identifier)
        table.register(BookingsTableViewCell.self, forCellReuseIdentifier: BookingsTableViewCell.identifier)
        table.backgroundColor = .white
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(systemName: "highlighter")
        let leftBarButton = UIBarButtonItem(image: image, style: .plain, target: .none, action: .none)
        let rightBarButton = UIBarButtonItem(image: image, style: .plain, target: .none, action: .none)
        
        self.navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.barTintColor = .orange
        navigationItem.title = "the mustang".uppercased()
        navigationItem.leftBarButtonItem = leftBarButton
        navigationItem.rightBarButtonItem = rightBarButton
        
        self.view.backgroundColor = .white
        
        table.delegate = self
        table.dataSource = self
        
        setupUI()
    }
    
    private func setupUI() {
        self.view.addSubview(table)
        
        table.snp.makeConstraints { make in
            make.left.top.right.bottom.equalToSuperview()
        }
    }
    
    func getButton(_ title: String, backgroundColor: UIColor) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = 8
        return button
    }

}


extension MainTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int { sectionTitles.count }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return orders.count
       } else if section == 1 {
           return bookings.count
       }
       return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: OrderTableViewCell.identifier, for: indexPath) as! OrderTableViewCell
            
            // Cell Configuration
            let currentOrder = orders[indexPath.row]
            cell.orderImage.image = currentOrder.orderImage
            cell.orderedByLabel.text = currentOrder.orderedBy
            cell.orderedFromLabel.text = currentOrder.orderedFrom
            cell.dateLabel.text = currentOrder.orderDate
            cell.timeLabel.text = currentOrder.orderTime
            cell.priceLabel.text = currentOrder.orderPrice
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: BookingsTableViewCell.identifier, for: indexPath) as! BookingsTableViewCell
            
            // Cell Configuration
            let currentBooking = bookings[indexPath.row]
            cell.orderedByLabel.text = currentBooking.orderedBy
            cell.orderDescription.text = currentBooking.orderDesc
            cell.dateLabel.text = currentBooking.orderDate
            cell.timeLabel.text = currentBooking.orderTime
            cell.statusBtn = currentBooking.statusButton
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 100 }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.lightGray
        
        let titleLabel = UILabel()
        titleLabel.frame = CGRect(x: 15, y: 0, width: tableView.frame.width - 30, height: 30)
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.text = sectionTitles[section]
        
        headerView.addSubview(titleLabel)
        return headerView
    }
}
