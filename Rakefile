# monkeypatch due to Rake 12.0 loving backwards-compabitility-breaking changes
module TempFixForRakeLastComment
  def last_comment
    last_description
  end
end
Rake::Application.send :include, TempFixForRakeLastComment

require 'knife_cookbook_doc/rake_task'

KnifeCookbookDoc::RakeTask.new(:doc) do |t|
  t.options[:constraints] = {
    constraints: true
  }
end
