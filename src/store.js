import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    menuStatus: false
  },
  mutations: {
    changeMstatue(state, newState){
      state.menuStatus = newState
    }
  },
  actions: {
    openMenu({commit}) {
      commit('changeMstatue', true)
    },
    closeMenu({commit}) {
      commit('changeMstatue', false)
    }
  }
})
