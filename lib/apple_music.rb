# frozen_string_literal: true

require 'date'

require 'apple_music/connection'
require 'apple_music/version'

module AppleMusic # :nodoc:
  autoload :Activity,       'apple_music/activity'
  autoload :Album,          'apple_music/album'
  autoload :AppleCurator,   'apple_music/apple_curator'
  autoload :Artist,         'apple_music/artist'
  autoload :Artwork,        'apple_music/artwork'
  autoload :Chart,          'apple_music/chart'
  autoload :ChartResponse,  'apple_music/chart_response'
  autoload :Curator,        'apple_music/curator'
  autoload :EditorialNotes, 'apple_music/editorial_notes'
  autoload :Error,          'apple_music/error'
  autoload :Genre,          'apple_music/genre'
  autoload :MusicVideo,     'apple_music/music_video'
  autoload :PlayParameters, 'apple_music/play_parameters'
  autoload :Playlist,       'apple_music/playlist'
  autoload :Preview,        'apple_music/preview'
  autoload :Relationship,   'apple_music/relationship'
  autoload :Resource,       'apple_music/resource'
  autoload :Response,       'apple_music/response'
  autoload :Search,         'apple_music/search'
  autoload :SearchResult,   'apple_music/search_result'
  autoload :Song,           'apple_music/song'
  autoload :Station,        'apple_music/station'
  autoload :Storefront,     'apple_music/storefront'

  class RequestError < StandardError
    attr_reader :response

    def initialize(response)
      @response = response
      super("Status: #{response.status} (#{response.reason_phrase})")
    end
  end

  class EmptyResponse
    attr_reader :response

    def initialize(response)
      @response = response
    end

    def body
      {}
    end

    def status
      404
    end
  end

  class << self
    def search(**options)
      Search.search(**options)
    end

    def search_hint(**options)
      Search.search_hint(**options)
    end

    def get(path, options = {})
      response = super(path, **options)

      raise ::AppleMusic::RequestError.new(response) if response.status != 200

      response
    end
  end
end
