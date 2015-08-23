Volontariat.LikeOrDislikeComponent = Ember.Component.extend
  likesCount: (-> 
    if @get('likes') == null
      0
    else
      @get('likes')
  ).property('likes')
  
  dislikesCount: (-> 
    if @get('dislikes') == null
      0
    else
      @get('dislikes')
  ).property('dislikes')  
  
  liked: (-> @get('positive') == true).property('positive')
  disliked: (-> @get('positive') == false).property('positive')
  
  actions:
    like: ->
      positiveWas = @get 'positive'
      @set 'dislikesCount', @get('dislikesCount') - 1 if positiveWas == false
      @set 'positive', true
      @set 'likesCount', @get('likesCount') + 1
      
      $.post("/like/#{@get('targetType')}/#{@get('targetId')}").done(=>
      ).fail(->
        alert Volontariat.t('likes.create.like_failed')
        @set 'positive', positiveWas 
        @set 'likesCount', @get('likesCount') - 1
      )
      
    unlike: ->
      @set 'positive', null
      @set 'likesCount', @get('likesCount') - 1
        
      $.post("/unlike/#{@get('targetType')}/#{@get('targetId')}").done(=>
      ).fail(->
        alert Volontariat.t('likes.destroy.unlike_failed')
        @set 'positive', true 
        @set 'likesCount', @get('likesCount') + 1
      )      
      
    dislike: ->
      positiveWas = @get 'positive'
      @set 'positive', false
      
      if positiveWas == true
        @set 'likesCount', @get('likesCount') - 1
        
      @set 'dislikesCount', @get('dislikesCount') + 1
        
      $.post("/dislike/#{@get('targetType')}/#{@get('targetId')}").done(=>
      ).fail(->
        alert Volontariat.t('likes.create.dislike_failed')
        @set 'positive', positiveWas 
        
        if positiveWas == true
          @set 'likesCount', @get('likesCount') + 1
          
        @set 'dislikesCount', @get('dislikesCount') - 1
      )      
      
    undoDislike: ->
      @set 'positive', null
      @set 'dislikesCount', @get('dislikesCount') - 1
        
      $.post("/unlike/#{@get('targetType')}/#{@get('targetId')}").done(=>
      ).fail(->
        alert Volontariat.t('likes.destroy.undo_dislike_failed')
        @set 'positive', false 
        @set 'dislikesCount', @get('dislikesCount') + 1
      )    