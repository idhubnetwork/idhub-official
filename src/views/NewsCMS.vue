<template lang="pug">
div(v-bind:class='pageName')
  Header
  .team
    .container
      .section-team
        ul.team__box
          li.team__item-wrapper(v-for='content in contents')
            .team__item
              .item_title {{content.title}}
              .item_img
                img(:src='content.image.url')
              .item_date
                | {{content.publishedDate}}
              .item_short_content(v-html="content.content.brief")
</template>

<script>
import Header from '@/components/Header'

export default {
  name: 'news',
  data: () => {
    return {
      pageName: 'News',
      contents: []
    }
  },
  mounted() {
    this.getContext()
  },
  methods: {
    getContext() {
      const ifetch = new Promise((resolve, reject) => {
        fetch("http://localhost:3001/fake_api/v1/blogs/5af108a30907a14760940f95").then(resp => {
          resp.json().then(d =>
            resolve(d.data)
          )
        }).catch(err =>
          reject(err)
        )
      })
      return ifetch.then(data => {
        this.contents = data
      })
    }
  },
  components: {
    Header
  }
}
</script>


<style lang="scss" scoped>
@import '../stylesheets/_abstracts/_variables';
@import '../stylesheets/_abstracts/_mixin';
@import '../stylesheets/_abstracts/_grid';
.section-team + .section-team {
  padding-top: 0;
}
.team {
  &__item-wrapper {
    @include clear_list;
  }
  &__box {
    @include clearfix;
    margin: 0;
    padding: 0;
  }
  &__item {
    position: absolute;
    top: 0;
    left: 0;
    bottom: 0;
    right: 0;
    background-color: $color-gray-light;
    border-radius: 5px;
    transition: box-shadow 0.4s ease;
    padding-top: 20px;
    padding-left: 10px;
    padding-right: 10px;
    padding-bottom: 50px;
    @media (#{$max_phone}) {
      padding: 20px 15px 20px;
    }
    .item_title {
      font-size: 12px;
    }
    .item_img {
      img { width: 90%; }
    }
    .item_date {
      font-size: 11px;
      color: #4f72cb;
      text-align: left;
      position: relative;
      left: 1.5em;
    }
    .item_short_content {
      text-align: center;
      font-size: 12px;
      overflow: hidden;
      text-overflow: ellipsis;
    }
  }
}
.team__title-box {
  padding-bottom: 100px;
}
/* grid */
.team {
  background-color: white;
  &__item-wrapper {
    @include gallery(6);
    margin-bottom: gutter();
    &:nth-last-child(-n+2) {
      margin-bottom: 0;
    }
    @include tablet {
      @include gallery(4);
      &:nth-last-child(-n+3) {
        margin-bottom: 0;
      }
    }
    @include desktop {
      @include gallery(3);
      &:nth-last-child(-n+4) {
        margin-bottom: 0;
      }
    }
  }
}
</style>
