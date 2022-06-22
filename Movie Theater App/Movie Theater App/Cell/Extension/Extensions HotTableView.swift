//
//  Extensions HotTableView.swift
//  CollectionView and TableView
//
//  Created by Brad on 6/18/22.
//

import Foundation
import UIKit

extension HotViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = hotTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HotTableViewCell else { return UITableViewCell () }
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return " ❤️‍🔥 Everyone's Watching "
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }
}
