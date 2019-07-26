<template lang="pug">
#header
  nav.header
    .container.header__container
      router-link.header__logo_box(to='/', title='Home')
        .header__logo_img
        .header__logo_text
          | IDHub
      ul.header__menu_list.header__item--desktop
        li.header__menu_item(v-for='link in links')
          router-link.header__menu_link.header__menu_link--white(:to='link.to')
            | {{ $t(link.text) }}
        li.header__menu_item
          a.link.header__menu_link.header__menu_link--white(href='/IDHub.apk', target='_blank')
            | {{ $t(download) }}
      button.header__burger_button.header__item--mobile(type='button', @click='openMenu')
</template>


<script>
import Vue from 'vue'
import { mapActions } from 'vuex'
import Modal from '@/components/Modal'
import store from '@/store'

export default {
  name: 'navbar',
  data: () => {
    return {
      showModal: false,
      download: 'nav.download',
      links: [
        { to: 'product', text: 'nav.product' },
        { to: 'news', text: 'nav.news' },
        { to: 'team', text: 'nav.team' },
        { to: 'contact', text: 'nav.contact' }
      ]
    }
  },
  components: {
    Modal
  },
  store,
  methods: {
    ...mapActions(['openMenu']),
    changeLang(target) {
      target.preventDefault()
      const locale = target.target.textContent
      Vue.config.lang = locale
      this.$i18n.locale = locale
      this.closeModal()
    },
    closeModal() {
      this.showModal = !this.showModal
    }
  }
}
</script>


<style lang='scss' scoped>
@import '../stylesheets/_abstracts/_variables';
@import '../stylesheets/_abstracts/_mixin';
@import '../stylesheets/_abstracts/_grid';
.header__left_box {
  button {
    color: white;
  }
}
.page-team,
.page-tech,
.page-activities,
.page-careers,
.page-contact {
  .cover {
    .header {
      background: none;
    }
  }
}
.header {
  background-image: linear-gradient(-180deg, #123075 0%, #092056 100%);
  &__container {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
    &:before, &:after {
      display: none;
    }
  }
  &__logo_box {
    padding-top: 5px;
    padding-bottom: 5px;
    order: 1;
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
    &:hover {
      text-decoration: none;
    }
  }
  &__logo_img {
    background-image: url(../assets/logo-w.png);
    background-size: cover;
    width: 42px;
    height: 42px;
    @include laptop {
      width: 60px;
      height: 60px;
    }
    @include desktop {
      width: 75px;
      height: 75px;
    }
    .page-home & {
      background-image: url(../assets/logo-w.png);
      @include tablet {
        background-image: url(../assets/logo.png);
      }
    }
  }
  &__logo_text {
    vertical-align: top;
    margin-left: 17px;
    color: white;
    height: 42px;
    line-height: 42px;
    font-size: 32px;
    font-weight: 400;
    @include laptop {
      font-size: 42px;
      height: 60px;
      line-height: 60px;
    }
    @include desktop {
      font-size: 48px;
      line-height: 75px;
      height: 75px;
    }
    .page-home & {
      @include tablet {
        color: $color-primary-dark;
      }
    }
  }
  &__link {
    margin-right: 30px;
    color: white;
    font-size: 12px;
    text-transform: uppercase;
    letter-spacing: 0.065em;
    &:hover, &:focus, &:active, &:visited {
      color: white;
      text-decoration: none;
    }
  }
  &__menu_list {
    @include clear_list;
    order: 2;
  }
  &__menu_item {
    display: inline-block;
    margin: 0 20px 0 0;
    &:last-child {
      margin-right: 0;
    }
  }
  &__menu_link {
    @include clear_link;
    position: relative;
    text-transform: uppercase;
    font-size: 16px;
    line-height: 20px;
    display: block;
    padding: 30px 15px;
    @include desktop {
      padding: 40px 20px;
    }
    &:before {
      content: "";
      position: absolute;
      width: 0;
      height: 4px;
      left: 0;
      bottom: 0;
      background-color: red;
      transition: width .4s cubic-bezier(.1, 0.88, 0.25, 1);
    }
    &:hover,
    &.router-link-active {
      &:before {
        width: 100%;
      }
      text-decoration: none;
    }
    &.router-link-active {
      cursor: default;
    }
    &--white:before {
      background-color: white;
    }
    &--white,
    &--white:hover,
    &--white:focus
    &--white:active,
    &--white:visited {
      color: white;
      text-decoration: none;
    }
  }
  &__burger_button {
    position: relative;
    vertical-align: middle;
    height: 36px;
    width: 36px;
    background: url(../assets/header__burger_button.svg);
    cursor: pointer;
    order: 3;
  }
  .page-home & {
    background: none;
  }
  &__item--desktop {
    @media (#{ $max_tablet }) {
      display: none;
    }
  }
  &__item--mobile {
    @media (#{ $min_tablet }) {
      display: none;
    }
  }
}
#show-modal {
  background-color: white;
  padding: 5px 10px;
  border-radius: 5px;
  &:hover {
    cursor: pointer;
  }
}

</style>
