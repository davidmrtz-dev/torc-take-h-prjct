#!/usr/bin/env ruby
require_relative './lib/application'

class RunTime
  def self.execute
    loop { Application.run }
  end
end

RunTime.execute
