{WaveView} = require('../wave/view')
{renderWave} = require('./template')


class PlaybackWaveView extends WaveView

    constructor: (args..., originalView, @_blipWithPermanentMenu) ->
        originalView.clearActiveBlip()
        super(args...)

    _init: (waveViewModel, participants) ->
        ###
        @param waveViewModel: WaveViewModel
        @param participants: array, часть ShareJS-документа, отвечающего за участников
        ###
        @_inEditMode = no
        @_isAnonymous = !window.userInfo?.id?
        @_model = waveViewModel.getModel()
        @_editable = no
        @_createDOM(renderWave)
        @_reservedHeaderSpace = 0
        @_$wavePanel = $(@container).find('.js-wave-panel')
        @_initRootBlip(waveViewModel)
        @_initDragScroll()
        waveViewModel.on('waveLoaded', =>
            $(@_waveBlips).on 'scroll', @_setOnScrollMenuPosition
            $(window).on('scroll', @_setOnScrollMenuPosition)
            $(window).on 'resize resizeTopicByResizer', @_resizerRepositionMenu
        )
        @_initBuffer()

    _deinitActiveBlipControls: () ->
        #Because i disable editing menu initialization

module.exports.PlaybackWaveView = PlaybackWaveView
