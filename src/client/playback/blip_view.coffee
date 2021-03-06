{BlipView} = require('../blip/view')
{PlaybackInteractor} = require('./interactor')
DOM = require('../utils/dom')

class PlaybackBlipView extends BlipView

    _addRootBlipClasses: () ->
        DOM.addClass(@_blipContainer, 'root-blip')

    _initBlipEventsInteractor: () ->
        @_interactor = new PlaybackInteractor(@_blipViewModel, @)

    markAsPlaybackRoot: () ->
        @_isPlaybackRoot = yes

    attachPlaybackRootMenu: (menu) ->
        return if not @_isPlaybackRoot
        @_interactor.attachMenu(menu, @_menuContainer, {})
        DOM.addClass(@_menuContainer, 'active')

    setReadState: () ->

    markActive: ->
        return if @_isPlaybackRoot
        super()

    unmarkActive: ->
        return if @_isPlaybackRoot
        super()

    setCalendarDate: (date) ->
        @_interactor?.setCalendarDate(date)

    setCalendarDateIfGreater: (date) ->
        @_interactor?.setCalendarDateIfGreater(date)

    showOperationLoadingSpinner: () ->
        @_interactor?.showOperationLoadingSpinner()

    hideOperationLoadingSpinner: () ->
        @_interactor?.hideOperationLoadingSpinner()

    switchForwardButtonsState: (isDisable) ->
        @_interactor?.switchForwardButtonsState(isDisable)

    switchBackButtonsState: (isDisable) ->
        @_interactor?.switchBackButtonsState(isDisable)

module.exports = {PlaybackBlipView}
