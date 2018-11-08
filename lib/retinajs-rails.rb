module RetinaJs
  class Engine < ::Rails::Engine
    initializer 'retinajs-rails.assets.precompile' do |app|
      app.config.assets.precompile += %w( retina.js )
    end
  end
end

module ImageHelper
  def image_tag_with_at2x(name_at_1x, options={})
    name_at_2x = name_at_1x.gsub(%r{\.\w+$}, '@2x\0')
    image_tag(name_at_1x, options.merge("data-rjs" => asset_path(name_at_2x)))
  end
end
ActionView::Base.send :include, ImageHelper
