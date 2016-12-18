require_relative 'lib/freckle'

access_token = 'l32ra7e0uguo2ku791b6oybtr34vr2t-he149no7z8v6h07s01a0khqm52tdu6s'

service = Freckle::Service.new(access_token)

# project = service.projects.first
# puts "Project #{project.id} #{project.name}"
# sleep(1)
# puts service.create_tags(['#test-api-tag'])
# sleep(1)
# tag = service.tags.first
# puts "Tag #{tag.id} #{tag.name}"
# sleep(1)
# res = service.start_timer(project.id, '#test-api-tag')
# debugger
# res
