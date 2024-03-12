## CORS permite dar a permissão de whitelist para certos dominios
## Pq passaremos secury cookies back and forth entre o front e backend aplication nos precisamos usar uma ferramenta chamada credenciais
## Em rails se vc vai usar credenciais e vai trabalhar com sessions vc precisa implementar uma ferramenta como CORS
## Esse da uma especificidade de regras de como vai ser possivel se comunicar, essas regras vao estar no inicializer

## Iniciando um level no middleware e usando o CORS module para fazer isso, e aqui todas as regras seram interceptadas pelo Rails config
## assim podemos limitar as aplicacoes que se comunicaram com nossa API, uma aplicacao que n esta no whitelist nao vai conseguir se comunicar
Rails.application.config.middleware.insert_before 0, Rack::Cors do
	## Listening on http://127.0.0.1:3000
	## Listening on http://[::1]:3000
	## Listening on http://localhost:3000

	allow do 
		origins "http://localhost:3000" 	## dando permissao para localhost usar a API, deveria colocar os host que podem usar aqui
		resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true ## frontend app, vc pode fazer isso, credentials: true eh o q permite passar os headers e cookies entre as apps 
	end

	allow do 
		origins "https://fct-authentication-app-react.herokuapp.com" 	## dando permissao para localhost usar a API, deveria colocar os host que podem usar aqui
		resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true ## frontend app, vc pode fazer isso, credentials: true eh o q permite passar os headers e cookies entre as apps 
	end
end