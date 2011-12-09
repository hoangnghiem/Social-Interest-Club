# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  # Wrappers are used by the form builder to generate a complete input.
  # You can remove any component from the wrapper, change the order or even
  # add your own to the stack. The options given to the wrappers method
  # are used to wrap the whole input (if any exists).

  config.wrappers :inline, :class => 'clearfix', :error_class => :error do |b|
    b.use :placeholder
    b.use :label
    b.use :tag => 'div', :class => 'input' do |ba|
      ba.use :input
      ba.use :hint,  :tag => :span, :class => :'help-inline'
      ba.use :error, :tag => :span, :class => :'help-block'
    end
  end
  
  config.wrappers :stacked, :class => "clearfix", :error_class => :error do |b|
    b.use :placeholder
    b.use :label
    b.use :hint,  :tag => :span, :class => :'help-block'
    b.use :tag => 'div', :class => 'input' do |input|
      input.use :input
      input.use :error, :tag => :span, :class => :'help-inline'
    end
  end

  config.wrappers :prepend, :class => "clearfix", :error_class => :error do |b|
    b.use :placeholder
    b.use :label
    b.use :hint,  :tag => :span, :class => :'help-block'
    b.use :tag => 'div', :class => 'input' do |input|
      input.use :tag => 'div', :class => 'input-prepend' do |prepend|
        prepend.use :input
      end
      input.use :error, :tag => :span, :class => :'help-inline'
    end
  end

  config.wrappers :append, :class => "clearfix", :error_class => :error do |b|
    b.use :placeholder
    b.use :label
    b.use :hint,  :tag => :span, :class => :'help-block'
    b.use :tag => 'div', :class => 'input' do |input|
      input.use :tag => 'div', :class => 'input-append' do |append|
        append.use :input
      end
      input.use :error, :tag => :span, :class => :'help-inline'
    end
  end

end
