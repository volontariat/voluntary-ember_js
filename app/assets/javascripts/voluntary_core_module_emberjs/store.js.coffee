VoluntaryOnEmberjs.Store = DS.Store.extend
  revision: 13
  adapter: DS.RESTAdapter.create(namespace: 'api/v1')
