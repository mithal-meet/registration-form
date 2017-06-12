task :test1 => :environment do
for i in 1..User.all.count do
 @user = User.find(i)
 print "#{@user.name}"	
 puts" -: #{@user.email}"
end
end