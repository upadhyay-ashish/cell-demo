class Table < UITableViewController

  def numberOfSectionsInTableView(tableView)
    1
  end

  def tableView(tableView, numberOfRowsInSection:section)
    20
  end

  def tableView(tableView, heightForRowAtIndexPath:indexPath)
    60
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:nil)

    @layout = CellLayout.new
    @layout.add_constraints

    @layout.on(:touch_first) do
      touch_first
    end

    @layout.on(:touch_second) do
      touch_second
    end

    cell.contentView.addSubview(@layout.view)

    cell
  end

  def viewDidLoad
    self.navigationItem.title = "The Numbers"
  end

end
