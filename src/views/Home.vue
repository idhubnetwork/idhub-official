<template lang="pug">
div(v-bind:class='pageName')
  .cover
    .cover__header
      Header
    .container.cover__container
      .cover__text_box
        h3.cover__sub-title(v-scroll-reveal.reset={ delay: 200 })
          span.cover__sub-title_text
            | {{ $t('cover.subtitle') }}
        h2.cover__title(v-scroll-reveal.reset={ delay: 250 })
          span.cover__title_text
            | {{ $t('cover.title') }}
        a.cover__link(v-bind:href="$t('whitepaperPath')", target='_blank', v-scroll-reveal.reset={ delay: 250 })
          | {{$t('whitepaper')}}
      .cover__pic_box(v-scroll-reveal.reset={ delay: 400 })
        img.cover__img(src='@/assets/page-home__cover-img.svg')
    .cover__footer
      .cover__footer_left_box
        span.cover__footer_text
          | {{$t('cover.message')}}
  .section-vision
    .container.section-vision__container
      .section__header(v-scroll-reveal.reset={ delay: 200 })
        h2 {{ $t('vision.title') }}
        h4 {{ $t('vision.subtitle') }}
        router-link.btn(to='product', title='tech', replace) {{$t('vision.learnMore')}}
      VisionList
  .section-roadmap
    .section__header(v-scroll-reveal.reset={ delay: 200 })
      h2 {{ $t('roadmap.title') }}
    RoadMap(v-scroll-reveal.reset={ delay: 250 })
  .section-social
    .container
      .section__header.left-box(v-scroll-reveal.reset={ delay: 200 })
        h2 {{ $t('community') }}
      .right-box(v-scroll-reveal.reset={ delay: 250 })
        SocialList
  .section-news
    .container
      .section__header(v-scroll-reveal.reset={ delay: 200 })
        h2 {{ $t('nav.news') }}
      NewsList(v-bind:selected='true', v-scroll-reveal.reset={ delay: 250 })
  Footer
</template>


<script>
import Footer from '@/components/Footer'
import Header from '@/components/Header'
import NewsList from '@/views/section/NewsList'
import RoadMap from '@/views/section/RoadMap'
import SocialList from '@/views/section/SocialList'
import VisionList from '@/views/section/VisionList'

export default {
  name: 'home',
  data: () => {
    return {
      pageName: 'page-home',
    }
  },
  components: {
    Header,
    VisionList,
    RoadMap,
    SocialList,
    NewsList,
    Footer
  }
}
</script>


<style lang="scss" scoped>
@import '../stylesheets/_abstracts/_variables';
@import '../stylesheets/_abstracts/_mixin';
@import '../stylesheets/_abstracts/_grid';
.cover {
  overflow: hidden;
  height: auto;
  text-align: center;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  background-image: linear-gradient(-180deg, #123075 0%, #092056 100%);
  > .cover__header {
    position: relative;
    z-index: 111;
  }
  > .cover__container {
    position: relative;
    z-index: 11;
  }
  > .cover__footer {
    position: relative;
    z-index: 1;
  }
  @include tablet {
    text-align: left;
    background-color: white;
    background-position: center top;
    background-size: 100%;
    background-repeat: no-repeat;
    height: 100vh;
    @include tablet {
      background-image: url(../assets/home-cover-1440-bg.svg);
    }
    @include desktop {
      background-image: url(../assets/home-cover-1920-bg.svg);
    }
  }
  &__container {
    display: flex;
    align-items: center;
    flex-direction: column;
    padding: 0 15px;
    min-height: 640px;
    @include tablet {
      flex-direction: row;
      margin-top: -50px;
      padding: 0;
    }
  }
  .center-v {
    @include clearfix;
    transform: translateY(-100px);
  }
  &__text_box {
    order: 2;
    color: $color-gray-lighter;
    padding-bottom: 30px;
    @include tablet {
      @include span(6 of 6);
      order: 1;
      color: $color-gray-dark;
    }
  }
  &__pic_box {
    order: 1;
    @include tablet {
      @include span(6 of 6 end);
      order: 2;
    }
  }
  &__img {
    width: 90%;
    @include tablet {
      width: 120%;
    }
  }
  &__link {
    @include font_loader($montserrat, 7, 'n');
    display: inline-block;
    text-transform: uppercase;
    padding: 15px 100px;
    border-radius: 5px;
    background: linear-gradient(225deg, #FA2B56 0%, #F91C3D 100%);
    box-shadow: 10px 10px 30px 0 rgba($color-gray-darkest, 0.3);
    color: white;
    &:hover {
      text-decoration: none;
      box-shadow: 10px 10px 40px 0 rgba($color-gray-darkest, .5);
    }
  }
  &__title {
    margin-bottom: 35px;
  }
  &__title_text {
    @include font_loader($montserrat, 1, 'n');
    font-size: 42px;
    @include tablet {
      font-size: 60px;
    }
    @include desktop {
      font-size: 72px;
    }
  }
  &__sub-title {
    margin-bottom: 10px;
    @include tablet {
      margin-bottom: 15px;
    }
  }
  &__sub-title_text {
    @include font_loader($montserrat, 1, 'n');
    font-size: 24px;
    @include tablet {
      font-size: 36px;
    }
    @include desktop {
      font-size: 48px;
    }
  }
  &__footer {
    line-height: 20px;
    padding: 20px 0;
    background-image: linear-gradient(-180deg, #FA2B56 0%, #F91C3D 100%);
  }
  &__footer_left_box {
    @extend .container;
  }
  &__footer_title {
    @include font_loader($montserrat, 4, 'n');
    display: inline-block;
    color: white;
    @media (#{$max_phone}) {
      margin-left: 10px;
      font-size: 11px;
    }
  }
  &__footer_text {
    @include font_loader($playfair, 4, 'i');
    margin-left: 30px;
    font-size: 13px;
    font-style: italic;
    color: white;
    @media (#{$max_phone}) {
      margin-left: 10px;
      font-size: 11px;
    }
  }
}

.page-home {
  @include desktop {
    color: #000;
  }
  .header {
    background: none;
  }
}
/* section */
%section-background--primary {
  background-image: linear-gradient(-180deg, #123075 0%, #092056 100%);
  position: relative;
  overflow: hidden;
  color: $color-gray-lightest;
  &:before, &:after {
    background: #1A47B0;
    width: 1000px;
    height: 1000px;
    border-radius: 100px;
    content: '';
    display: block;
    position: absolute;
    transform: rotate(45deg);
    opacity: .15;
  }
}
.section-vision {
  background-color: $color-gray-lightest;
  position: relative;
  overflow: hidden;
  &:before, &:after {
    background-image: linear-gradient(-180deg, #123075 0%, #092056 100%);
    border-radius: 100px;
    content: '';
    display: block;
    width: 1000px;
    height: 1000px;
    position: absolute;
    transform: rotate(45deg);
    z-index: 0;
  }
  &:before {
    opacity: 0.05;
    left: 40%;
    top: -30%;
  }
  &:after {
    opacity: 0.03;
    left: 40%;
    bottom: -60%;
  }
  .section__header {
    @include tablet {
      @include span(6);
      @include push(1);
    }
    @include laptop {
      @include span(10);
      @include push(1);
    }
  }
  &__container {
    position: relative;
  }
}
.section-roadmap {
  background-color: white;
  .section__header {
    margin-bottom: 80px;
    float: none;
  }
}
.section-team {
  background-color: $color-gray-lightest;
  .left-box {
    @include span(12 of 12);
    @include tablet {
      @include span(5 of 12);
      text-align: left;
    }
  }
  .right-box {
    @include span(12 of 12);
    @include tablet {
      @include span(7 of 12);
    }
  }
}
.section-download {
  @extend %section-background--primary;
  .container {
    z-index: 1;
    position: inherit;
  }
  &:before {
    left: 50%;
    top: -10%;
  }
  &:after {
    left: 55%;
    bottom: 10%;
  }
}
.section-social {
  @extend %section-background--primary;
  h2 {
    color: white;
  }
  .container {
    z-index: 1;
    position: inherit;
  }
  .left-box {
    @include span(12 of 12);
    @include tablet {
      @include span(5 of 12);
      text-align: left;
    }
  }
  .right-box {
    @include span(12 of 12);
    @include tablet {
      @include span(7 of 12);
    }
  }
}
.section-news {
  background-color: $color-gray-lightest;
}
.h1.title {
  color: #1F2D51;
}
.btn {
  color: white;
  background: #FA274F;
  padding-left: 4em;
  padding-right: 4em;
}
</style>
