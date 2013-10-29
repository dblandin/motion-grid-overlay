class Motion
  class GridOverlayView < UIView
    DEFAULTS = { stroke_color: UIColor.grayColor,
                 stroke_width: 1.0,
                 x_lines: 2,
                 y_lines: 2 }

    attr_accessor :x_interval, :y_interval
    attr_reader   :stroke_color, :stroke_width, :x_lines, :y_lines

    def initWithFrame(frame)
      super.tap do |view|
        view.backgroundColor = UIColor.clearColor

        self.x_lines      = DEFAULTS[:x_lines]
        self.y_lines      = DEFAULTS[:y_lines]
        @stroke_color = DEFAULTS[:stroke_color]
        @stroke_width = DEFAULTS[:stroke_width]
      end
    end

    def toggle
      setHidden(!hidden?)

      setNeedsDisplay
    end

    def x_lines=(lines)
      @x_lines = lines
      self.y_interval = frame.size.height / (lines + 1)

      setNeedsDisplay
    end

    def y_lines=(lines)
      @y_lines = lines
      self.x_interval = frame.size.width / (lines + 1)

      setNeedsDisplay
    end

    def stroke_width=(width)
      @stroke_width = width

      setNeedsDisplay
    end

    def stroke_color=(color)
      @stroke_color = color

      setNeedsDisplay
    end

    def drawRect(rect)
      super

      setup_drawing

      CGContextClearRect(context, bounds)

      unless hidden?
        draw_horizontal_lines
        draw_vertical_lines

        fill_path
      end
    end

    private

    def setup_drawing
      CGContextSetStrokeColorWithColor(context, stroke_color.colorWithAlphaComponent(0.5).CGColor)

      CGContextSetLineWidth(context, stroke_width)
    end

    def draw_horizontal_lines
      draw_line([0, 0], [size.width, 0])

      (1..x_lines).each do |i|
        draw_line([0, y_interval * i], [size.width, y_interval * i])
      end

      draw_line([0, size.height], [size.width, size.height])
    end

    def draw_vertical_lines
      (1..y_lines).each do |i|
        draw_line([x_interval * i, 0], [x_interval * i, size.height])
      end
    end

    def fill_path
      CGContextStrokePath(context)
    end

    def draw_line(start_point, end_point)
      CGContextMoveToPoint(context, start_point[0], start_point[1])

      CGContextAddLineToPoint(context, end_point[0], end_point[1])
    end

    def context
      @context ||= UIGraphicsGetCurrentContext()
    end
  end
end
