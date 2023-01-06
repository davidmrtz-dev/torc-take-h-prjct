#!/usr/bin/env ruby
require 'byebug'
require 'ostruct'
require_relative './lib/application'

class RunTime
  def self.execute
    Application.run
  end
end

RunTime.execute
