<template lang="pug">
div(v-bind:class='pageName')
  .cover
    Header
    .container
      .row
        .section__header
          h2 {{ $t('component.title') }}
      .row
        ul.component-list
          li.component-list-item(v-for="(item, index) in $t('component.list')")
            div(v-bind:class='item.icon')
              img(:src="require('@/assets/' + item.img + '.svg')")
            .text
              h6 {{ item.note }}
              h5 {{ item.name }}
  .section-operation-flow
    .container
      .row
        .section__header
          h2 {{ $t('flow.title') }}
      .row
        ol.optration-flow-nav
        swiper(:options='swiperOption')
          swiper-slide
            .icon
              img(src='@/assets/icon--optration-success.svg')
            .title {{ $t('flow.steps[0].title') }}
            .content {{ $t('flow.steps[0].content') }}
          swiper-slide
            .icon
              img(src='@/assets/icon--optration-success.svg')
            .title {{ $t('flow.steps[1].title') }}
            .content {{ $t('flow.steps[1].content') }}
          swiper-slide
            .icon
              img(src='@/assets/icon--optration-success.svg')
            .title {{ $t('flow.steps[2].title') }}
            .content {{ $t('flow.steps[2].content') }}
          swiper-slide
            .icon
              img(src='@/assets/icon--optration-success.svg')
            .title {{ $t('flow.steps[3].title') }}
            .content {{ $t('flow.steps[3].content') }}
  .section-key-tech
    .container
      .row
        .section__header
          h2 {{ $t('techs.title') }}
        ul.key-tech-list
          li.key-tech-list-item(v-for="(item, index) in $t('techs.list')")
            .icon-box
              img(:src="require('@/assets/' + item.icon + '.svg')")
              h5 {{ item.title }}
            .text-box
              p {{ item.content }}
  Footer
</template>

<script>
import Header from '@/components/Header'
import { swiper, swiperSlide } from 'vue-awesome-swiper'
import Footer from '@/components/Footer'

export default {
  name: 'product',
  data: () => {
    return {
      pageName: 'page-product',
      flowTitle: ['flow.steps[0].title', 'flow.steps[1].title', 'flow.steps[2].title', 'flow.steps[3].title'],
    }
  },
  components: {
    Header,
    swiper,
    swiperSlide,
    Footer
  },
  computed: {
    swiperOption() {
      let flowTitle = this.flowTitle
      let translate = this.$t
      return {
        spaceBetween: 30,
        centeredSlides: true,
        autoplay: {
          delay: 2500,
          disableOnInteraction: false
        },
        pagination: {
          el: '.optration-flow-nav',
          clickable: true,
          renderBullet(index, className) {
            return `<li class="${className} swiper-pagination-bullet-custom"><div class='num'>0${index + 1}</div><div class='title'> ${translate(flowTitle[index])} </div><div class='step'> Step 0${index + 1} </div></li>`
          }
        }
      }
    }
  }
}
</script>


<style lang="scss">
@import '../stylesheets/_abstracts/_variables';
@import '../stylesheets/_abstracts/_mixin';
@import '../stylesheets/_abstracts/_grid';
@import '../../node_modules/swiper/dist/css/swiper.css';
.page-product {
  .cover {
    height: auto;
    background-image: url(../assets/page-cover-bg.svg);
    background-position: 0 center;
    background-color: $color-primary-dark;
    background-repeat: no-repeat;
    .header { background: none; }
    .section__header {
      h2, h3 { color: $color-gray-lightest; }
      text-align: center;
      @include pt60;
      @include pb60;
      @include tablet {
        @include pt80;
        @include pb80;
      }
      @include laptop {
        @include pt100;
        @include pb100;
      }
      @include desktop {
        @include pt120;
        @include pb120;
      }
      @include fhd {
        @include pt150;
        @include pb150;
      }
    }
  }
  .component-list {
    width: 100%;
    @include clear_list;
    margin-top: -50px;
    margin-bottom: 150px;
    &-item {
      @include span(1 of 1);
      margin-bottom: 30px;
      border: 2px solid #D7DDED;
      box-shadow: 40px 40px 80px 0 rgba(2, 8, 22, 0.3);
      border-radius: 5px;
      color: $color-gray-light;
      padding: 30px;
      display: flex;
      flex-direction: column;
      align-items: center;
      text-align: center;
      [class^='icon-component'] + .text {
        margin-top: 20px;
      }
      h5 { font-size: 24px; }
      h6 { font-size: 16px; }
      @include tablet {
        @include span(6 of 12);
        flex-direction: row;
        text-align: left;
        [class^='icon-component'] {
          margin-right: 24px;
        }
      }
      @include laptop {
        padding: 30px 90px 30px;
      }
    }
  }
  .optration-flow-nav,
  .swiper-pagination {
    @include clear_list;
    display: flex;
    width: 100%;
    margin-bottom: 50px;
    li {
      &:focus {
        outline-style: none;
        box-shadow: none;
        border-color: transparent;
      }
    }
    .num {
      border: 1px solid #B4BFD9;
      border-radius: 100%;
      line-height: 67px;
      width: 67px;
      height: 67px;
      font-size: 36px;
      font-weight: 700;
      color: $color-gray-light;
      float: left;
      margin-right: 12px;
    }
    .title { text-align: left; }
    .step { text-align: left; }
  }
  .section-operation-flow {
    background-color: white;
    .section__header h2 {
      color: $color-gray-dark;
    }
  }
  .optration-flow-content,
  .swiper-slide {
    @include clear_list;
    color: white;
    padding: 100px 25%;
    text-align: center;
    .icon {
      margin-bottom: 40px;
    }
    .title {
      font-size: 48px;
      font-weight: 700;
      letter-spacing: -1px;
      margin-bottom: 30px;
    }
  }
  .section-key-tech {
    background-color: $color-gray-lightest;
    .section__header {
      padding-bottom: 60px;
      margin-bottom: 0;
      h2 {
        color: $color-gray-dark;
      }
    }
  }
  .key-tech-list {
    @include clear_list;
    &-item {
      display: flex;
      flex-direction: column;
      .icon-box {
        padding: 56px 0;
        background-image: linear-gradient(-225deg, #FA2B56 0%, #F91C3D 100%);
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        color: $color-gray-lightest;
        h5 {
          font-size: 32px;
          margin-top: 10px;
        }
        h6 { font-size: 18px; }
        img {
          width: 96px;
          height: 96px;
        }
      }
      .text-box {
        background-color: white;
        vertical-align: middle;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 5%;
      }
      @include phone {
        flex-direction: row;
        &:nth-child(even) {
          .icon-box { order: 1; }
          .text-box { order: 2; }
        }
        &:nth-child(odd) {
          .icon-box { order: 2; }
          .text-box { order: 1; }
        }
        .icon-box {
          width: 50%;
          padding: 48px 0;
          h5 {
            font-size: 36px;
            margin-top: 20px;
          }
        }
        .text-box {
          width: 50%;
        }
      }
      @include tablet {
        .icon-box {
          h5 { font-size: 42px; }
          img {
            width: 128px;
            height: 128px;
          }
        }
      }
      @include fhd {
        .icon-box {
          h5 { font-size: 48px; }
        }
      }
    }
  }
  .swiper-container {
    background-image: linear-gradient(-180deg, #123075 0%, #092056 100%);
    border-radius: 5px;
  }
  .swiper-pagination-bullet-custom {
    display: inline-block;
    width: 25%;
    height: auto;
    background: transparent;
    opacity: 1;
  }
  .swiper-pagination-bullet-custom.swiper-pagination-bullet-active {
    .num {
      background-image: linear-gradient(-180deg, #123075 0%, #092056 100%);
      box-shadow: 10px 10px 40px 0 rgba(0, 0, 0, 0.4);
      border-radius: 100%;
      color: #fff;
    }
  }
}

</style>
