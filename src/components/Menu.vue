<template lang="pug">
  nav.menu(v-bind:class='menuState')
    .menu__container
      button.menu__closer(type='button', @click='closeMenu')
      .menu__box
        ul.menu__list
          li.menu__item(v-for='link in links')
            router-link.menu__link(:to='link.to', v-on:click.native='closeMenu')
              | {{ $t(link.text) }}
</template>

<script>
import { mapState, mapActions } from 'vuex'

export default {
  name: 'side-menu',
  data: () => {
    return {
      links: [
        { to: 'product', text: 'nav.product' },
        { to: 'news', text: 'nav.news' },
        { to: 'team', text: 'nav.team' },
        { to: 'contact', text: 'nav.contact' }
      ],
      menuState: 'state-closed',
    }
  },
  computed: {
    ...mapState(['menuStatus']),
  },
  methods: {
    ...mapActions(['closeMenu']),
    closeMenuHook() {
      this.closeMenu()
    }
  },
  watch: {
    menuStatus: function(val) {
      if (val) {
        this.menuState = 'state-opened';
      } else {
        this.menuState = 'state-closed';
      }
    }
  }
}
</script>


<style lang='scss' scoped>
@import '../stylesheets/_abstracts/_variables';
@import '../stylesheets/_abstracts/_mixin';
@import '../stylesheets/_abstracts/_grid';
$_menu_left_margin: 50px;
.menu {
  position: fixed;
  overflow: auto;
  right: -100%;
  top: 0;
  z-index: 300;
  width: 30%;
  height: 100%;
  min-width: 320px;
  padding-bottom: 30px;
  background-color: $color-primary;
  transition: right .2s ease;
  &.state-opened {
    right: 0;
  }
  @media (#{$max_phone}) {
    transition-duration: .4s;
  }
  &__box {
    padding-left: $_menu_left_margin;
    padding-right: $_menu_left_margin;
    @media (#{$max_phone}) {
      margin-top: 40px;
      padding-left: $container_side_margin;
      padding-right: $container_side_margin;
    }
    @media (#{$min_phone}) {
      position: absolute;
      left: 0;
      top: 50%;
      transform: translateY(-50%);
      width: 100%;
    }
  }
  &__closer {
    cursor: pointer;
    &:before {
      content: "";
      position: absolute;
      right: 15px;
      top: 8px;
      height: 36px;
      width: 36px;
      background: url(../assets/header__burger_button--close.svg);
    }
  }
  &__title {
    @include font_loader($montserrat, 4, 'n');
    margin: 0 0 20px;
    color: white;
    letter-spacing: .085em;
    text-transform: uppercase;
    font-size: 10px;
  }
  &__list {
    @include clearfix;
    @include clear_list;
    display: block;
    margin-left: 0;
    margin-bottom: 44px;
    padding-bottom: 20px;
    @media (#{$max_tablet}) {
      display: block;
    }
  }
  &__item {
    margin-bottom: 20px;
  }
  &__link,
  &__phone_link {
    @include font_loader($montserrat, 4, 'n');
    font-size: 20px;
    letter-spacing: .05em;
    display: block;
    &, &:hover, &:focus {
      color: white;
      text-decoration: none;
    }
  }
  &__phone_link {
    display: block;
    margin: 0 0 50px 0;
    padding-left: 30px;
    position: relative;
    &:before {
      content: "";
      position: absolute;
      left: 0;
      bottom: 0;
      top: 0;
      width: 20px;
    }
  }
  &__about_text {
    @include font_loader($montserrat, 4, 'n');
    font-size: 13px;
    color: rgba(white, .65);
    line-height: 1.4;
    width: 80%;
  }
}
</style>
