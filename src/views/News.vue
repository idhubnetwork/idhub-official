<template lang="pug">
div(v-bind:class='pageName')
  Header
  .section-news
    .container
      .section__header
        h2 {{ $t('nav.news') }}
      NewsList(v-bind:selected='false')
  Footer
</template>


<script>
import Footer from '@/components/Footer'
import Header from '@/components/Header'
import NewsList from '@/views/section/NewsList'

export default {
  name: 'news',
  data: () => {
    return {
      pageName: 'page-news',
      contents: []
    }
  },
  components: {
    Header,
    NewsList,
    Footer
  },
}
</script>


<style lang="scss" scoped>
</style>
