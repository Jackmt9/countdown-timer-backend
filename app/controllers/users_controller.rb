class UsersController < ApplicationController
        
    before_action :authorized, only: [:validate_token]
  
    def create
      @user = User.create(user_params)
      if @user.valid?
        wristband = encode_token({user_id: @user.id})
        Playlist.create_favorites(@user.id)
        render json: {
          user: @user,
          token: wristband
        }
      else
        render json: {message: "Failed to create a new user"}, status: 403
      end
    end
  
  
    def login
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        wristband = encode_token({user_id: @user.id})
        playlists = Playlist.get_playlists_with_bookmarks(@user)

        render json: {
          user: {id: @user.id, first_name: @user.first_name, last_name: @user.last_name, email: @user.email, playlists: playlists},
          token: wristband
        }
      else
        render json: {message: "Incorrect username or password"}, status: 401
      end
    end
  
  
  
    def validate_token
      # @user comes from the before_action
      wristband = encode_token({user_id: @user.id})

      playlists = Playlist.get_playlists_with_bookmarks(@user)

      render json: {
        user: {id: @user.id, first_name: @user.first_name, last_name: @user.last_name, email: @user.email, playlists: playlists},
        token: wristband
      }
    end
  
  
    private
  
    def user_params
      params.permit(:email, :password, :first_name, :last_name)
    end
  
end
