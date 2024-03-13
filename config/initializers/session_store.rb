## Session Store define como os cookies seram estruturados

## Rails.application.config.session_store :cookie_store -> Para as sessions nos vamos usar cookies
## key: nome da sessão cookie
## domain: onde sera o host da API

if Rails.env == 'production'
	Rails.application.config.session_store :cookie_store, key: "_authentication_app", domain: "http://meuhost.com"
else
	Rails.application.config.session_store :cookie_store, key: "_authentication_app"
end
