# motion-grid-overlay

Simple grid overlay UIView subclass

## Usage

``` ruby
grid_overlay = Motion::GridOverlayView.alloc.initWithFrame(target_view.bounds)

grid_overlay.x_lines      = 3                # defaults to 2
grid_overlay.y_lines      = 3                # defaults to 2
grid_overlay.stroke_color = UIColor.redColor # defaults to UIColor.grayColor
grid_overlay.stroke_width = 2.0              # defaults to 1.0

grid_overlay.hide
grid_overlay.show
grid_overlay.toggle

target_view.addSubview(grid_overlay)
```

## Setup

Add this line to your application's Gemfile:

    gem 'motion-grid-overlay'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install motion-grid-overlay

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
