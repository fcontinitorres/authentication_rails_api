class SessionsController < ApplicationController
	include CurrentUserConcern

	## Method que vai logar no sistema
	## Inicia com um post request vindo do front-end, qndo hit API vai fazer um post request para o create e esse metodo deve rodar
	def create
		## params veem do front-end
		## teste with: curl --header "Content-Type: application/json" --request POST --data '{"user": {"email": "fe", "password": "123123"}}' http://localhost:3000/sessions
		user = User
				.find_by(email: params["user"]["email"])
				.try(:authenticate, params["user"]["password"]) ## metodo da gem, has_securety_password
		
		## se passar no authenticate, vamos armazenar user
		if user
			## comunica com session, set user_id que achamos. Aqui q estamos trabalhando com os cookies, se o usuario estiver lgoado, add o cookie no seu sistema
			## Isso vai criptografado para o cliente, broswer, mobile device
			session[:user_id] = user.id
			render json: {
				status: "created",
				logged_in: true,
				user: user
			}
		else
			## Codigo universao para nao autorizado no login
			render json: {status: 401}
		end
	end

	## Veriica se usuario esta logado, metodo Get
	## curl --header "Content-Type: application/json" --request GET http://localhost:3000/logged_in
	def logged_in
		if @current_user
			render json: {
				logged_in: true,
				user: @current_user
			}
		else
			render json: {
				logged_in: false
			}
		end
	end


	def logout
		reset_session
		render json: {status: 200, logged_out: true}
	end

end
