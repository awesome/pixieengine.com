###*
A base view for our frontbone framework.
###

namespace "Pixie", (Pixie) ->
  class Pixie.View extends Backbone.View
    initialize: ->
      # Force jQuery Element
      @el = $(@el)

      # Set up HTML if template exists
      if @template?
        @el.html $.tmpl(@template)

      # Settings is now backbone special too
      @settings = @options.settings

    include: (module) ->
      Object.extend this, module(this, this)
