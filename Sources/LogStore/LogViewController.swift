//  Created by dasdom on 01.11.19.
//  
//

import UIKit

public class LogViewController : UITableViewController {

  let logItems = LogStore.log
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.register(UITableViewCell.self,
                       forCellReuseIdentifier: "Cell")
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
      cell.textLabel?.text = logItems[indexPath.row]
      
      return cell
  }
}
