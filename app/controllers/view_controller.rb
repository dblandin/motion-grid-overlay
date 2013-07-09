class ViewController < UIViewController
  def viewDidLoad
    super
    view.backgroundColor = UIColor.whiteColor

    view.addSubview(grid_overlay)
    view.addSubview(grid_control_button)
  end

  def toggle_grid(sender)
    sender.selected = !sender.isSelected

    grid_overlay.toggle
  end

  def grid_control_button
    UIButton.buttonWithType(UIButtonTypeCustom).tap do |button|
      x, y, w, h = 10, 0, 100, 100

      button.frame = [[x, y], [w, h]]
      button.setImage(UIImage.imageNamed('grid-off'), forState: UIControlStateNormal)
      button.setImage(UIImage.imageNamed('grid-on'),  forState: UIControlStateHighlighted)
      button.setImage(UIImage.imageNamed('grid-on'),  forState: UIControlStateSelected)
      button.selected = true
      button.adjustsImageWhenHighlighted = false
      button.addTarget(self, action: 'toggle_grid:', forControlEvents: UIControlEventTouchUpInside)
    end
  end

  def grid_overlay
    @_grid_overlay ||= Motion::GridOverlayView.alloc.initWithFrame(view.bounds)
  end
end
