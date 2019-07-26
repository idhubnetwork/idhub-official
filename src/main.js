import Vue from 'vue'
import App from '@/App'
import router from '@/router'
import store from '@/store'
import i18n from '@/i18n'
import VueScrollReveal from 'vue-scroll-reveal'

Vue.use(VueScrollReveal)
Vue.config.productionTip = false

router.afterEach(() => {
  window.scrollTo(0, 0)
})

new Vue({
  router,
  store,
  i18n,
  render: h => h(App)
}).$mount('#app')