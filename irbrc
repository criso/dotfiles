require 'irb/completion'
require 'irb/ext/save-history'
require 'wirble'
require 'ap'


# load wirble
Wirble.init
Wirble.colorize


IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

IRB.conf[:PROMPT_MODE] = :SIMPLE

IRB.conf[:AUTO_INDENT] = true

IRB::Irb.class_eval do
def output_value
  ap @context.last_value
end
end
