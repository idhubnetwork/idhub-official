<template lang="pug">
div(v-bind:class='pageName')
  .cover
    Header
    slot(name='header')
  slot(name='body')
  slot(name='footer')
</template>

<script>
import Header from '@/components/Header'

export default {
  name: 'page-layout',
  data: () => {
    return {
      pageName: 'page-layout'
    }
  },
  components: {
    Header
  }
}
</script>


<style lang="scss" scoped>
</style>
