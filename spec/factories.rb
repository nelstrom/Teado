require 'ffaker'

Factory.define :task do |t|
  t.name { Faker::Lorem.sentence[0,64] }
  t.bucket "due_asap"
end

Factory.define :tag do |t|
  t.name { Faker::Lorem.words(3).join(" ") }
end
