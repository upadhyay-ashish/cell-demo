class CellLayout < MotionKit::Layout

  def layout

    @cell_title = add UILabel , :cell_title
    @cell_btn_1 = add UIButton.buttonWithType(UIButtonTypeCustom) , :cell_btn_1
    @cell_btn_2 = add UIButton.buttonWithType(UIButtonTypeCustom) , :cell_btn_2

  end

  def add_constraints

    constraints(:cell_title) do
      top_left x:0, y:-10
      width view
      height 20
    end

    constraints(:cell_btn_1) do
      top.equals(:cell_title, :bottom)
      left.equals(:cell_title, :left)
      width.equals(:cell_title, :width).divided_by(2)
      height.equals(:cell_title, :height)
    end

    constraints(:cell_btn_2) do
      top.equals(:cell_btn_1, :top)
      left.equals(:cell_btn_1, :right)
      width.equals(:cell_btn_1, :width)
      height.equals(:cell_btn_1, :height)
    end

  end

  def cell_title_style
    text 'Hello ! Click a button below'
    font UIFont.systemFontOfSize(16)
    text_alignment NSTextAlignmentCenter
  end

  def common_button_style
    title_color UIColor.blackColor
    titleLabel {
      font UIFont.fontWithName("Helvetica-Bold", size:14)
      text_color UIColor.blackColor
      background_color UIColor.clearColor
      text_alignment NSTextAlignmentCenter
    }
    background_color UIColor.colorWithRed(220.0/255.0, green:230.0/255.0, blue:240.0/255.0, alpha:1)
    layer do
      corner_radius 10
    end
  end

  def cell_btn_1_style
    title 'Click 1'
    common_button_style
    target.on :touch do 
      trigger(:touch_first)
    end
  end

  def cell_btn_2_style
    title 'Click 2'
    common_button_style
    target.on :touch do 
      trigger(:touch_second)
    end
  end
end
