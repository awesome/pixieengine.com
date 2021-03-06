#= require models/sprites_collection

describe "Sprites collection", ->
  beforeEach ->
    @collection = new Pixie.Models.SpritesCollection
      params: new Backbone.Model

  it "should have correct default url", ->
    expect(@collection.url()).toEqual("/sprites")

  it "should request new data when tags are provided", ->
    filterSpy = sinon.spy(@collection, 'filterTagged')

    @collection.filterTagged('Nethack')

    expect(filterSpy).toHaveBeenCalledOnce()
