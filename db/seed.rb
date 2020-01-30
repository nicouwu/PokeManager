require_relative 'shared'
require_relative '../models/pokemon'


user = find_one_user_by_email('nicouwu@ga.co')

create_user('dkdk', 'dk@ga.co', 'donkeykong')

user = find_one_user_by_email('dk@ga.co')