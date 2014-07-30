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
    font 'Helvetica-Bold'.uifont(16)
    text_alignment NSTextAlignmentCenter
  end

  def common_button_style
    title_color :black.uicolor
    titleLabel {
      font 'Helvetica-Nueue'.uifont(14)
      text_color :black.uicolor
      background_color :clear.uicolor
      text_alignment NSTextAlignmentCenter
    }
    background_color [220, 230, 240].uicolor
    layer do
      corner_radius 10
    end
  end

  def cell_btn_1_style
    title 'Shake Screen'
    common_button_style
  end

  def cell_btn_2_style
    title 'Slide Screen'
    common_button_style
  end
end
