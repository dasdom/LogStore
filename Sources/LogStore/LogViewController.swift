//  Created by dasdom on 01.11.19.
//  
//

import UIKit

class LogViewController : UITableViewController {

  let logItems = LogStore.log.reversed()
  let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.timeStyle = .short
    dateFormatter.dateStyle = .short
    return dateFormatter
  }()
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.register(UITableViewCell.self,
                       forCellReuseIdentifier: "Cell")
    tableView.separatorStyle = .none
  }
  
  // MARK: - UITableViewDataSource
  public override func tableView(_ tableView: UITableView,
                                 numberOfRowsInSection section: Int)
    -> Int {
      
      logItems.count
  }
  
  public override func tableView(_ tableView: UITableView,
                                 cellForRowAt indexPath: IndexPath)
    -> UITableViewCell {
      
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",
                                               for: indexPath)
      
      let logItem = logItems[indexPath.row]
      cell.textLabel?.text = "(\(dateFormatter.string(from: logItem.date))) \(logItem.text)"
      cell.textLabel?.numberOfLines = 0
      
      return cell
  }
}
