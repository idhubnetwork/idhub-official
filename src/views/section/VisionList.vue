<template lang="pug">
ul.vision__list
  li.vision__list-item(v-scroll-reveal.reset={ delay: 300 })
    img.vision__list-item__icon(src='@/assets/icon--vision-service.svg')
    h5.vision__list-item__title ID as a Service
    p.vision__list-item__text {{$t('vision.service')}}
  li.vision__list-item(v-scroll-reveal.reset={ delay: 350 })
    img.vision__list-item__icon(src='@/assets/icon--vision-digiasset.svg')
    h5.vision__list-item__title ID as a Digital Asset
    p.vision__list-item__text {{$t('vision.asset')}}
  li.vision__list-item(v-scroll-reveal.reset={ delay: 400 })
    img.vision__list-item__icon(src='@/assets/icon--vision-digilife.svg')
    h5.vision__list-item__title ID as a Digital Life
    p.vision__list-item__text {{$t('vision.life')}}
</template>

<script>
export default {
  name: 'section-vision'
}
</script>

<style lang="scss" scoped>
@import '../../stylesheets/_abstracts/_variables';
@import '../../stylesheets/_abstracts/_mixin';
@import '../../stylesheets/_abstracts/_grid';
.vision {
  &__list {
    @include clear_list;
    margin-top: 80px;
    &-item {
      padding: 0 30px;
      margin-bottom: gutter();
      @include tablet {
        padding: 0;
        @include span(1 of 3);
      }
      &__icon {
        margin-bottom: 24px;
      }
      &__title {
        font-size: 18px;
        color: $color-primary-dark;
        margin-bottom: 12px;
      }
      &__text {
        font-size: 14px;
        line-height: 21px;
        color: $color-gray-darker;
        @include font_loader($notosans, 4, 'n');
      }
    }
  }
}
</style>
