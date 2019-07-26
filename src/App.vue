<template lang="pug">
#app.page_wrapper
  Sitemenu
  router-view
</template>

<script>
import Vue from 'vue'
import VueI18n from 'vue-i18n'
import Sitemenu from '@/components/Menu'
import i18n from '@/i18n'
import store from '@/store'

Vue.use(VueI18n)
Vue.config.productionTip = false

export default {
  name: 'App',
  i18n,
  components: {
    Sitemenu
  },
  store
}
</script>
<style lang="scss">
  @import './stylesheets/main';
</style>
