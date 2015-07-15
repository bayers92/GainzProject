# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = Category.create([
	{name: 'Squat Snatch', style: '1'},{name: 'Power Snatch', style: '2'},{name: 'Hang Power Snatch', style: '3'},{name: 'Snatch Balance', style: '4'},
	{name: 'Squat Clean', style: '5'},{name: 'Power Clean', style: '6'},{name: 'Hang Power Clean', style: '7'},{name: 'Clean and Jerk', style: '8'},
	{name: 'Front Squat', style: '9'},{name: 'Overhead Squat', style: '10'},{name: 'Back Squat', style: '11'},{name: 'Thruster', style: '12'},
	{name: 'Shoulder Press', style: '13'},{name: 'Push Press', style: '14'},{name: 'Jerk', style: '15'},{name: 'Split Jerk', style: '16'},
	{name: 'Deadlift', style: '17'},{name: 'Sumo Deadlift', style: '18'},{name: 'Bench Press', style: '19'},{name: 'Sumo Deadlift High Pull', style: '20'}])