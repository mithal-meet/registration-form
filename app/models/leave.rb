
class Leave < ActiveRecord::Base
belongs_to :user
#validate :duration_contains_sunday
validate :exceeds_leave_balance
validate :prior_1_day
validate :sick_leave
validate :priv_leave
validate :from_to
validate :select_ltype

def start_time
	self.from_date

end

def from_to
if (self.from_date >= self.to_date)
	self.errors.add(:duration, "invalid date to and from date")
end

end

def select_ltype

	if (self.leave_type == 'choose leave_type')

	self.errors.add(:duration, "please select a  proper leave type")
end
end

def duration_contains_sunday
@lv = self
from = @lv.from_date
to = @lv.to_date
@ul = UserLeave.where(:user_id => self.user_id, :leave_type => self.leave_type)
@ul1 = @ul[0]
a = self.duration.to_i
for i in from..to
if i.sunday?
self.errors.add(:duration, "Contains a Sunday")


break
end
end
end

def exceeds_leave_balance
if (self.leave_type != 'choose leave_type')
@ul = UserLeave.where(:user_id => self.user_id, :leave_type => self.leave_type)
#@ul = UserLeave.where(:leave_type => self.leave_type, :user_id => self.user_id)
@ul1 = @ul[0]
d1 = self.duration.to_i
d2 = @ul1.leave_left.to_i
if d2 < d1
self.errors.add(:duration, "exceeds leave balance by #{d1-d2} days")
end
end
end

def prior_1_day
d1 = self.from_date
d2 = Date.today
if ((d1-d2).to_i <= 1)
self.errors.add(:duration, "Leave should be applied before 1 day")
end
end

def sick_leave
if self.leave_type == 'SL'
@u = User.find(self.user_id)
@leaves = Leave.where(:user_id => @u.id, :leave_type => "SL", :status => true)
sorted = @leaves.sort_by &:created_at
if sorted.any?
@lv = sorted.last
from_d = self.from_date
m_frm = from_date.month
m_last = @lv.created_at.month
if m_frm - m_last < 2 || self.duration.to_i > 1
self.errors.add(:duration, "Only 1 SL is allowed in 2 months")
end
end
end
end

def priv_leave
if self.leave_type == 'PL'
@u = User.find(self.user_id)
jd = @u.joining_date
td = Date.today
month = (td.year * 12 + td.month) - (jd.year * 12 + jd.month)
month.divmod(12)
if(month < 12)
self.errors.add(:duration, "PL applicable after 1 year of service only")
end

end
end

end
