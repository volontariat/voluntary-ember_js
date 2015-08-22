Volontariat.Argument = DS.Model.extend
  vote: DS.attr('boolean')
  topicId: DS.attr('number')
  topicName: DS.attr('string')
  argumentableType: DS.attr('string')
  argumentableId: DS.attr('number')
  argumentableName: DS.attr('string')
  value: DS.attr('string')
  
  pro: (-> @get('vote') == true).property('vote')
  contra: (-> @get('vote') == false).property('vote')
  neutral: (-> @get('vote') == null).property('vote')

  