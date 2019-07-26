<template lang="pug">
div(v-bind:class='pageName')
  Header
  .team
    .container
      .section-team
        .team__title-box
          h2.team__title
            | {{ $t('team') }}
        ul.team__box
          li.team__item-wrapper(v-for="(item, index) in $t('members')")
            .ratio-1-1
              .team__item
                .team__item__avatar
                  img(:src="require('@/assets/team_' + item.avatar + '.png')")
                .team__item__name
                  | {{ item.name }}
                .team__item__title
                  | {{ item.title }}
                .team__item__content(v-for="(exp) in item.content")
                  | {{ exp }}
  Footer
  //- Joinus
</template>

<script>
import Footer from '@/components/Footer'
import Header from '@/components/Header'
// import Joinus from '@/components/Joinus'

export default {
  name: 'team',
  data: () => {
    return {
      pageName: 'page-team'
    }
  },
  components: {
    Header,
    Footer
    // Joinus
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
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
    &:hover {
      background-image: linear-gradient(-180deg, #1B47AD 0%, #0D2F80 100%);
      box-shadow: 30px 30px 60px 0 rgba($color-gray-darkest, .3);
      color: $color-gray-lightest;
      .team__item__avatar {
        opacity: .1;
        transition: opacify, .4s;
      }
    }
    &__avatar {
      position: absolute;
      left: 0;
      top: 0;
      z-index: 0;
      img {
        width: 100%;
      }
    }
    &__name {
      font-size: 24px;
      font-weight: 700;
      margin-bottom: 8px;
    }
    @media (#{$max_phone}) {
      padding: 20px 15px 20px;
    }
  }
}
.team__title-box {
  padding-bottom: 100px;
}

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
    @include laptop {
      @include gallery(3);
      &:nth-last-child(-n+4) {
        margin-bottom: 0;
      }
    }
  }
}
</style>
