require 'thor'
require 'lazycuke/version'

module Lazycuke
  class App < Thor
    include Thor::Actions
    map %w(-v -V --version) => :version
    def self.source_root
      File.expand_path('../../scaffold', File.dirname(__FILE__))
    end

    desc "version", "current version"
    def version
      say Lazycuke::VERSION
    end

    desc "setup", "Set up cucumber framework with all the directories"
    def setup
      generate_rakefile
      copy_file "features/test.feature"
      copy_file "Gemfile"
      copy_file "cucumber.yml"
      copy_file "README.md"
      copy_file "features/support/env.rb"
      copy_file "features/support/hooks.rb"
      copy_file "features/step_definitions/steps.rb"
      init_gitignore
    end

    private

    def project_name
      destination_root.split(/\/|\\/).last
    end

    def genarate_gemfile
      unless destination_file_exists?("Gemfile")
        add_file "Gemfile"
        append_file "Gemfile" do
          "source 'http://rubygems.org'\n\n" +
          "gem 'rake'\n"
          "gem 'nokogiri', '1.6.1'\n"
        end
      end
    end

    def generate_rakefile
      unless destination_file_exists?("Rakefile")
        add_file "Rakefile"
        append_file "Rakefile" do
          "require 'rubygems'\n" +
          "require 'bundler'\n" +
          "require 'bundler/setup'\n\n"
        end
      end
    end

    def init_gitignore
      add_file ".gitignore" unless destination_file_exists?(".gitignore")
      ensure_eof_newline(".gitignore")
    end

    def destination_file_exists?(filename)
      File.exist?(File.join(destination_root, filename))
    end

    def insert_gem(gem_name)
      ensure_eof_newline("Gemfile")
      append_file "Gemfile", "gem '#{gem_name}'\n"
    end

    def add_task(the_task)
      append_file "Rakefile", "\n\n#{the_task}\n"
    end

    def ensure_eof_newline(filename)
      gsub_file(filename, /([^\n])\z/, "\\1\n")
    end
  end
end
