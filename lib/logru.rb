# frozen_string_literal: true

require 'logger'
require 'oj'

# Usage:
class Logru
  def initialize(level: nil)
    @log = Logger.new($stdout)
    @log.level = level || Logger::INFO
  end

  def self.with_hash(hash)
    Logru.new.with_hash(hash)
  end

  def level(level)
    @log.level = level
  end

  def with_hash(hash)
    @log.formatter = proc do |severity, datetime, msg|
      "#{datetime} #{severity} #{msg} #{Oj.dump(hash)}"
    end
    self
  end

  def trace(msg)
    @log.trace(msg)
  end

  def debug(msg)
    @log.debug(msg)
  end

  def info(msg)
    @log.info(msg)
  end

  def warn(msg)
    @log.warn(msg)
  end

  def error(msg)
    @log.error(msg)
  end

  def fatal(msg)
    @log.fatal(msg)
  end

  def unknown(msg)
    @log.unknown(msg)
  end
end
