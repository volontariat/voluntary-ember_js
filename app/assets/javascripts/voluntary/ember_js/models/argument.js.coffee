Volontariat.Argument = DS.Model.extend
  topicId: DS.attr('number')
  topicName: DS.attr('string')
  argumentableType: DS.attr('string')
  argumentableId: DS.attr('number')
  argumentableName: DS.attr('string')
  value: DS.attr('string')