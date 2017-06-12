task :create => :environment  do
j =User.all.count+1
k=j+10
for i in j..k do
	@user=User.new
	@user.name =Faker::Name.name
	@user.id =i
	@user.email =Faker::Internet.email(@user.name)
	@user.password ="12345678"
		@user.password_confirmation ="12345678"
	@user.address=Faker::Address.city
	@user.save
end
	end
	
	
	
	