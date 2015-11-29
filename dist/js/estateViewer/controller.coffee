EV = window.ToT.EstateViewer

class EV.Controller
    constructor: (@container) ->
        @model = new EV.Model(@)
        @view = new EV.View(@container, @, @model)


