require_dependency "discourse_hide_old_text_constraint"

DiscourseHideOldText::Engine.routes.draw do
  get "/" => "discourse_hide_old_text#index", constraints: DiscourseHideOldTextConstraint.new
  get "/actions" => "actions#index", constraints: DiscourseHideOldTextConstraint.new
  get "/actions/:id" => "actions#show", constraints: DiscourseHideOldTextConstraint.new
end
