Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1016787605023657', 'beae5659fe7ef5a51515ffa17ec9f2b6'
end