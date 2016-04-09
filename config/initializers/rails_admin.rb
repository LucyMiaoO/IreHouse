RailsAdmin.config do |config|

  config.authenticate_with do
    authenticate_or_request_with_http_basic('Authentication') do |username, password|
      username == 'admin' && password == '80230412'
    end
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app



    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
