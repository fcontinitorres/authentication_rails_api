class ApplicationController < ActionController::Base
	## Rails tem um conjunto de regras para qndo vc tenta cominicacao com a rota
	## Uma das regras eh a CSRF token, gera um token que verifica se o usario que esta digitando no rails form eh um usuario de vdd, n eh injecao de dados
	## Mas no nosso app API n deve cuidar disso, verificacao para o outro sistema
	## Com isso vamos pular essa verificacao
	skip_before_action :verify_authenticity_token
end
