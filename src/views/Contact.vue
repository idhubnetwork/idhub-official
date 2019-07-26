<template lang="pug">
div(v-bind:class='pageName')
  .cover
    Header
    .container
      .section__header
        h2 {{ $t('contact_page.title') }}
        //- h3 {{ $t('contact_page.subtitle') }}
  .section-contact
    .container.contact-container
      form.contact-formbox(action='mailto:support@idhub.network', method='GET')
        textarea(v-bind:placeholder="$t('contact_page.forms.content')", name='body')
        input(type='text', v-bind:placeholder="$t('contact_page.forms.name')")
        input(type='email',v-bind:placeholder="$t('contact_page.forms.mail')")
        input(type='tel', v-bind:placeholder="$t('contact_page.forms.phone')")
        input(type='submit', v-bind:value="$t('contact_page.forms.sumbit')")
  Footer
</template>

<script>
import Header from '@/components/Header'
import Footer from '@/components/Footer'

export default {
  name: 'contact',
  data: () => {
    return {
      pageName: 'page-contact'
    }
  },
  components: {
    Header,
    Footer
  }
}
</script>


<style lang="scss" scoped>
@import '../stylesheets/_abstracts/_variables';
@import '../stylesheets/_abstracts/_mixin';
@import '../stylesheets/_abstracts/_grid';
$assets-path: '../assets';

.page-contact {
  .cover {
    height: auto;
    background-image: url(#{$assets-path}/page-cover-bg.svg);
    background-position: 0 center;
    background-color: $color-primary-dark;
    background-repeat: no-repeat;
    .header {
      background: none;
    }
    .section__header {
      h2, h3 {
        color: $color-gray-lightest;
      }
      text-align: center;
      padding-top: 60px;
      padding-bottom: 60px;
      @include tablet {
        padding-top: 80px;
        padding-bottom: 80px;
      }
      @include laptop {
        padding-top: 100px;
        padding-bottom: 100px;
      }
      @include desktop {
        padding-top: 120px;
        padding-bottom: 120px;
      }
      @include fhd {
        padding-top: 150px;
        padding-bottom: 150px;
      }
    }
  }
  .section-contact {
    background-image: linear-gradient(-180deg, #061843 0%, #05112E 100%);
  }
  .contact {
    &-formbox {
      background: $white;
      box-shadow: 40px 40px 80px 0 rgba(2, 8, 22, 0.3);
      border-radius: 5px;
      text-align: center;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      padding: 30px 40px;
      @include tablet {
        @include span(6 of 8);
        @include push(1);
        padding: 30px 60px;
      }
      @include laptop {
        @include span(8 of 12);
        @include push(2);
        padding: 50px 100px;
      }
      input, textarea, input {
        border: 1px solid #DDDFE7;
        border-radius: 5px;
        padding: 10px 15px;
        margin-bottom: 30px;
        @include laptop {
          padding: 20px 30px;
          margin-bottom: 30px;
        }
        &:active, &:focus {
          box-shadow: 0 10px 20px 0 rgba(0, 0, 0, 0.1);
        }
      }
      textarea {
        height: 150px;
      }
      input[type='submit'] {
        background-image: linear-gradient(-180deg, #123075 0%, #092056 100%);
        color: white;
        border-width: 0;
        &:hover {
          color: white;
          background: #1A47B0;
          box-shadow: 20px 20px 60px 0 rgba(0, 0, 0, 0.4);
        }
      }
    }
  }
}
</style>
