#!/bin/env ruby
# frozen_string_literal: true

require 'every_politician_scraper/scraper_data'
require 'pry'

class MemberList
  class Member
    def name
      Name.new(
        full: noko.css('.team-name').text.tidy,
        prefixes: %w[H.E Hon.],
      ).short
    end

    def position
      noko.css('.team-content').text.tidy
    end
  end

  class Members
    def member_container
      noko.css('.info')
    end
  end
end

file = Pathname.new 'official.html'
puts EveryPoliticianScraper::FileData.new(file).csv
