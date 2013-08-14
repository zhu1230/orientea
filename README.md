orientea: command pattern for active record. 
========

#### This is one command pattern implementation for ruby. Designed to use with rails (ActiveRecord).
You can store the command object , perform it by action method , or undo it by undo method. ########

Note: this gem use postgresql with hstore extension.

```ruby
  @record = Record.new
  reate_command = Orientea::CreatingCommand.build(@record)  # would build and save the command
  record.name = "changed name"
  hange_command = Orientea::ChangingCommand.build(@record)  
  hange_command.action # would apply the changes
  hange_command.undo # would discard the changes
```



== Contributing to orientea
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

== Copyright

Copyright (c) 2013 Vincent Zhu. See LICENSE.txt for
further details.


One Command Pattern Implementation For Ruby with ActiveRecord
