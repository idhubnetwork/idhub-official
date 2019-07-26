<template lang="pug">
ul.social__list
  li.social__list-item(v-for='social in socials')
    .social__list-item-wrapper(:style="'background-color: '+ social.background ")
      .social__list-item__logo
        img(:src='social.img' )
      .social__list-item__name
        | {{ social.name }}
      a.btn(:href='social.url', target='_blank')
</template>

<script>
export default {
  name: 'section-social',
  data: () => {
    return {
      socials: [
        {
          background: '#34579A',
          img: require('@/assets/community_facebook.svg'),
          name: 'Facebook',
          url: 'https://www.facebook.com/IdhubOfficial'
        },
        {
          background: '#009FF4',
          img: require('@/assets/community_twitter.svg'),
          name: 'Twitter',
          url: 'https://twitter.com/IDHUBOFFICIAL'
        },
        {
          background: '#303030',
          img: require('@/assets/community_github.svg'),
          name: 'GitHub',
          url: 'https://github.com/idhubnetwork'
        },
        {
          background: '#FF496B',
          img: require('@/assets/community_slack.svg'),
          name: 'Slack',
          url: 'https://idhubnetwork.herokuapp.com/'
        },
        {
          background: '#00B871',
          img: require('@/assets/community_medium.svg'),
          name: 'Medium',
          url: 'https://medium.com/@IDHUBOFFICIAL'
        },
        {
          background: '#00AADF',
          img: require('@/assets/community_telegram.svg'),
          name: 'Telegram',
          url: 'https://t.me/joinchat/GwYlyA8g8aNQCBElmAk1Dw'
        }
      ]
    }
  }
}
</script>

<style lang="scss" scoped>
@import '../../stylesheets/_abstracts/_variables';
@import '../../stylesheets/_abstracts/_mixin';
@import '../../stylesheets/_abstracts/_grid';
$assets-path: '../../assets';

.social__list {
  @include clear_list;
  &-item {
    @include span(1 of 1);
    margin-bottom: gutter();
    @include phone {
      @include span(1 of 2);
      margin-bottom: gutter();
    }
    @include tablet {
      @include span(4 of 8);
      margin-bottom: gutter();
    }
    @include desktop {
      @include span(2 of 6);
      margin-bottom: gutter();
    }
    &-wrapper {
      padding: 25px 15px;
      border-radius: 5px;
      box-shadow: 0 30px 70px 0 rgba($color-gray-darkest, 0.1);
      &:hover {
        box-shadow: 0 10px 70px 0 rgba($color-gray-darkest, 0.5);
      }
    }
    &__name {
      color: $color-gray-lightest;
      margin-top: 8px;
      margin-bottom: 8px;
      font-size: 16px;
      line-height: 28px;
      font-weight: 400;
    }
    .btn {
      line-height: 42px;
      height: 42px;
      border-radius: 21px;
      border: 2px solid $color-gray-lightest;
      background-color: transparent;
      background-image: url(#{$assets-path}/icon--social-item-go.svg);
      background-position: center;
      background-repeat: no-repeat;
      padding-left: 4em;
      padding-right: 4em;
      &:hover {
        $btn-color: #FA2B56;
        border: 2px solid $btn-color;
        background-color: $btn-color;
      }
    }
  }
}
</style>
