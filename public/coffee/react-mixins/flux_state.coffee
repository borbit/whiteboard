module.exports = (storeClassName) ->
  
  getStateFromFlux: ->
    flux = @getFlux()
    flux.stores[storeClassName].getState()

