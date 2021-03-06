class UserNotifier < ActionMailer::Base
  default :from => 'shiftable@gmail.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def welcome_email(user)
    @user = user
    mail( to: user.email,
    subject: 'Thanks for signing up for Shiftable!',
    sent_on: Time.now )
  end

# # send an email to all admins when user requests shift change
#   def shiftchange_request_email(user)
#     @user = user
#     mail(to: user.company.users.where(is_admin:true) },
#     subject: "#{@user.first_name} Requested a Shift Change" )
#   end

# # send a response email to user by admins when user requests shift change
#   def shiftchange_response_email(user)
#     @user = user
#     mail( to: user.email,
#     subject: 'Status update regarding shift change request' )
#   end

#   # send a reassignment email to user by admins when user requests shift change
#   def shift_reassign_email(user)
#     @user = user
#     mail( to: user.email,
#     from: user.company.users.where(is_admin:true) },
#     subject: 'You have been reassigned a shift, please check your schedule' )
#   end
end
