<template lang="pug">
footer.footer
  .footer__main_box
    .container.footer__container
      .footer__left_box
        router-link.footer__logo_box(to='/')
          span.footer__logo_text
            | IDHub
        span.footer__copyright
          | &copy; IDHub. All Rights Reserved.
        ul.social.footer__social.footer__social_box
          li.social__item(v-for='social__item in social__items')
            a.social__link.social__link--rounded(target='_blank', :href='social__item.href', :title='social__item.title', :class='social__item.class')
      .footer__right_box
        ul.footer__menu
          li.footer__menu__item.footer__menu__title
            | {{ $t('nav.product') }}
          li.footer__menu__item(v-for='linksProduct in linksProducts')
            router-link.footer__menu__link(:to= 'linksProduct.to')
              | {{ $t(linksProduct.text) }}
        ul.footer__menu.footer__menu
          li.footer__menu__item.footer__menu__title
            | {{ $t('information') }}
          li.footer__menu__item(v-for='linksNew in linksNews')
            router-link.footer__menu__link(:to= 'linksNew.to')
              | {{ $t(linksNew.text) }}
        ul.footer__menu.footer__menu
          li.footer__menu__item.footer__menu__title
            | {{ $t('abount_us') }}
          li.footer__menu__item(v-for='linksAbout in linksAbouts')
            router-link.footer__menu__link(:to= 'linksAbout.to')
              | {{ $t(linksAbout.text) }}
        ul.footer__menu.footer__menu
          li.footer__menu__item.footer__menu__title
            | {{ $t('nav.contact') }}
          li.footer__menu__item(v-for='linksContact in linksContacts')
            router-link.footer__menu__link(:to= 'linksContact.to')
              | {{ linksContact.text }}
</template>


<script>
export default {
  name: 'footbar',
  data: () => {
    return {
      close: 'close',
      social__items: [
      { href: 'https://www.facebook.com/IdhubOfficial', title: 'Say hello in Facebook!', class: 'social__link--facebook' },
      { href: 'https://twitter.com/IDHUBOFFICIAL', title: 'Say hello in Twitter!', class: 'social__link--twitter' },
      { href: 'https://idhubnetwork.herokuapp.com', title: 'Say hello in Slack!', class: 'social__link--slack' },
      { href: 'https://github.com/idhubnetwork', title: 'Say hello in Github!', class: 'social__link--github' },
      { href: 'https://t.me/joinchat/GwYlyA8g8aNQCBElmAk1Dw', title: 'Say hello in Telegram!', class: 'social__link--telegram' },
      { href: 'javascript:;', title: 'Say hello in Wechat!', class: 'social__link--wechat' },
      { href: 'javascript:;', title: 'Say hello in QQ!', class: 'social__link--qq' },
      { href: 'javascript:;', title: 'Say hello in Reddit!', class: 'social__link--reddit' }
      ],
      linksProducts: [
        { to: 'product', text: 'nav.product' }
      ],
      linksNews: [
        { to: 'news', text: 'nav.news' },
      ],
      linksAbouts: [
        { to: 'team', text: 'nav.team' }
      ],
      linksContacts: [
        { to: 'contact', text: 'support@idhub.network' }
      ],
    }
  }
}
</script>


<style lang="scss" scoped>

@import '../stylesheets/_abstracts/_variables';
@import '../stylesheets/_abstracts/_mixin';
@import '../stylesheets/_abstracts/_grid';

.footer {
  text-align: center;
  @include tablet {
    text-align: right;
  }
  &__container {
    position: relative;
  }
  &__main_box {
    padding: 35px 0;
    border-bottom: 1px solid rgba($cloud, .12);
    background-image: linear-gradient(-180deg, #123075 0%, #092056 100%);
    position: relative;
    overflow: hidden;
    color: $color-gray-lightest;
    text-align: center;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
    &:before {
      background: #1A47B0;
      width: 1000px;
      height: 1000px;
      border-radius: 100px;
      content: '';
      display: block;
      position: absolute;
      transform: rotate(45deg);
      opacity: .15;
      left: -200px;
      top: -300px;
    }
    @include tablet {
      padding: 50px 0;
    }
    @include laptop {
      padding: 80px 0;
    }
    @include desktop {
      padding: 100px 0;
    }
  }
  &__left_box {
    margin-right: 10%;
    margin-bottom: 50px;
    @include tablet {
      float: left;
      margin-bottom: 0;
    }
  }
  &__right_box {
    @include tablet {
      float: right;
    }
  }
  &__logo_box {
    @include clear_link;
    display: block;
    height: 60px;
    line-height: 60px;
    margin-bottom: 20px;
    img {
      height: 100%;
    }
  }
  &__social_box {
    margin-top: 16px;
  }
  &__nav__item {
    display: inline-block;
  }
  &__nav__link {
    @include clear_link;
  }
  &__logo_text {
    @include font_loader($montserrat, 4, 'n');
    position: relative;
    top: 2px;
    font-size: 48px;
    color: rgba(white, .3);
    letter-spacing: .05em;
  }
  &__description {
    @include font_loader($montserrat, 1, 'n');
    color: white;
    font-size: 11px;
    line-height: 1.6;
    letter-spacing: .05em;
    display: inline-block;
    max-width: 260px;
  }
  &__copyright {
    @include font_loader($montserrat, 1, 'n');
    color: rgba(white, .3);
    font-size: 15px;
    text-transform: uppercase;
    letter-spacing: .05em;
  }
  &__menu {
    @include clear_list;
    @include tablet {
      text-align: left;
      display: inline-block;
      vertical-align: top;
      margin-right: 32px;
      &:last-child {
        margin-right: 0;
      }
    }
    @include laptop {
      margin-right: 48px;
    }
    @include desktop {
      margin-right: 60px;
    }
  }
  &__menu__item {
    margin-bottom: 15px;
    @include tablet {
      &:last-child {
        margin-bottom: 0;
      }
    }
    @media (#{$max_tablet}) {
      float: left;
      margin-right: 20px;
    }
  }
  &__menu__title {
    @include font_loader($montserrat, 4, 'n');
    color: white;
    font-size: 14px;
    letter-spacing: .05em;
    text-transform: uppercase;
  }
  &__menu__link {
    @include font_loader($montserrat, 4, 'n');
    color: $color-primary-light;
    font-size: 13px;
    letter-spacing: .05em;
    &:hover, &:focus {
      color: white;
      text-decoration: none;
    }
  }
}
</style>
