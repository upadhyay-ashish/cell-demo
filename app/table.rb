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

    @btn1 = @layout.get(:cell_btn_1)
    @btn2 = @layout.get(:cell_btn_2)

    @btn1.on(:touch) { touch_first }
    @btn2.on(:touch) { touch_second }

    @layout.on(:touch_second) do
      touch_second
    end

    cell.selectionStyle = UITableViewCellSelectionStyleNone

    cell.contentView.addSubview(@layout.view)

    cell
  end

  def touch_first
    self.view.shake
  end

  def touch_second
    UIView.animation_chain do
      view.fade_out
      view.slide :left
    end.and_then do
      view.fade_in
      view.slide :right
    end.start
  end

  def viewDidLoad
    self.navigationItem.title = "The Numbers"
  end

end
