<template lang="pug">
.section-joinus
  .container
    .row
      .text-box
        h4 {{ joinUsTitle }}
        h5 {{ joinUsDesction }}
      .btn-box
        router-link.btn(to='/careers', title='careers', replace) {{ joinUsBtn }}
</template>


<script>
export default {
  name: 'section-joinus',
  data: () => {
    return {
      joinUsTitle: '加入我们',
      joinUsDesction: '发展区块链数位身份 IDHub 让你于社群与商业展现个人价值',
      joinUsBtn:'职务清单'
    }
  }
}
</script>


<style lang="scss" scoped>

@import '../stylesheets/_abstracts/_variables';
@import '../stylesheets/_abstracts/_mixin';
@import '../stylesheets/_abstracts/_grid';
.section-joinus {
  background-image: url(../assets/bg-joinus.png);
  background-size: cover;
  .row {
    display: flex;
    align-items: center;
    flex-direction: column;
    @include laptop {
      flex-direction: row;
    }
  }
  .text-box {
    color: $color-gray-lightest;
    @include laptop {
      @include span(5);
      @include push(2);
      text-align: left;
    }
    h4 {
      font-size: 48px;
      font-weight: 700;
    }
    h5 {
      font-size: 18px;
      font-weight: 100;
    }
  }
  .btn-box {
    margin: 0 auto;
    margin-top: 20px;
    @include laptop {
      @include span(3);
      margin-top: 0;
    }
    .btn {
      background: $white;
      box-shadow: 20px 20px 20px 0 rgba(0, 0, 0, 0.2);
      border-radius: 5px;
      padding: 15px 30px;
      color: $color-primary-dark;
      &:hover {
        box-shadow: 20px 20px 60px 0 rgba(0, 0, 0, 0.4);
      }
    }
  }
}
</style>
