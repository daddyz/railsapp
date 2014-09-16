Slim::Engine.set_default_options shortcut: {
    '&' => {:tag => 'input', :attr => 'type'},
    '#' => {:attr => 'id'},
    '.' => {:attr => 'class'}
}, pretty: true, sort_attrs: false