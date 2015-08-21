Volontariat.ToggleTextComponent = Ember.Component.extend
  length: 140
  collapsed: 'more'
  
  currentText: (-> if @get('collapsed') == 'more' then @get('text').truncate(@get('length')) else @get('text')).property('text', 'collapsed', 'length')
  tooLong: (-> @get('text').length > @get('length')).property('text', 'length')
  
  actions:
    
    toggle: ->
      @set 'collapsed', if @get('collapsed') == 'more' then 'less' else 'more'