<template lang="pug">
ul.news__list(v-if='selected')
  li.news__list-item(v-for='item in news', v-if='item.selected')
    a(:href='item.url', target='_blank')
      .news__list-item__photo.ratio-1-1
        img(:src='item.img')
      .news__list-item__text-box
        .news__list-item__date
          | {{ item.date }}
        .news__list-item__text
          | {{ item.title }}
ul.news__list(v-else)
  li.news__list-item(v-for='item in news')
    a(:href='item.url', target='_blank')
      .news__list-item__photo.ratio-1-1
        img(:src='item.img')
      .news__list-item__text-box
        .news__list-item__date
          | {{ item.date }}
        .news__list-item__text
          | {{ item.title }}
</template>

<script>
export default {
  name: 'section-news',
  props: ['selected'],
  data: () => {
    return {
      news: [
        {
          date: '2018-06-08',
          img: require('@/assets/20180608-jinse.png'),
          selected: true,
          title: "IDHub 正式加入企業以太坊聯盟 (EEA)，開啓國際化新征程...",
          url: 'https://www.jinse.com/blockchain/201058.html'
        },
        {
          date: '2018-06-06',
          img: require('@/assets/20180606-ifeng.png'),
          selected: false,
          title: 'IDHub 创始人曲明出席以太坊技术大会 破解数字身份的基因密码...',
          url: 'http://biz.ifeng.com/a/20180606/45015468_0.shtml'
        },
        {
          date: '2018-06-03',
          img: require('@/assets/20180603-csdn.png'),
          selected: true,
          title: "IDHub 创始人曲明：数字身份将是下一个万亿市场...",
          url: 'https://blog.csdn.net/dev_csdn/article/details/80559351'
        },
        {
          date: '2018-06-03',
          img: require('@/assets/20180603-wechat.png'),
          selected: true,
          title: "IDHub 与 Hivelocity 达成战略合作，为 60 万用户提供身份验证服务...",
          url: 'https://mp.weixin.qq.com/s/yWeebwVxsU_vNKc512vtkQ'
        },
        {
          date: '2018-05-29',
          img: require('@/assets/20180529-medium.png'),
          selected: false,
          title: '“Build a better world with ACO.” IDHub to be the ﬁrst use case on ACO platform...',
          url: 'https://medium.com/theacoplatform/build-a-better-world-with-aco-idhub-to-be-the-%EF%AC%81rst-use-case-on-aco-platform-f1ebf42d1c62'
        },
        {
          date: '2018-05-22',
          img: require('@/assets/20150522-yahoofinace.png'),
          selected: false,
          title: "China's Blockchain Community Correction application bestows a human touch...",
          url: 'https://finance.yahoo.com/news/chinas-blockchain-community-correction-application-161300613.html'
        },
        {
          date: '2018-05-21',
          img: require('@/assets/20180521-marketsinsider.png'),
          selected: false,
          title: "China's Blockchain Community Correction application bestows a human touch...",
          url: 'https://markets.businessinsider.com/news/stocks/china-s-blockchain-community-correction-application-bestows-a-human-touch-1025068125'
        },
        {
          date: '2018-05-30',
          img: require('@/assets/20180530-weixin.png'),
          selected: false,
          title: '拆解 IDHub：如何成为未来价值互联网的基石？...',
          url: 'https://mp.weixin.qq.com/s/qUD97Q5EW5lPqQQC4DD68A'
        },
        {
          date: '2018-05-15',
          img: require('@/assets/20180515-it168.png'),
          selected: false,
          title: 'IDHub 助力全国首个“区块链+社区矫正”应用禅城发布...',
          url: 'http://software.it168.com/a2018/0515/3203/000003203255.shtml'
        },
        {
          date: '2018-03-27',
          img: require('@/assets/20180327-blockcast.png'),
          selected: false,
          title: '發展區塊鏈數位身份 IDHub 讓你於社群與商業展現個人價值...',
          url: 'https://blockcast.it/2018/03/27/blcokchain-based-digital-identity-idhub/'
        },
        {
          date: '2018-03-24',
          img: require('@/assets/20180324-taiwan-forum.png'),
          selected: true,
          title: "IDHub was invited to participate in Taiwan Digital Identity Forum...",
          url: 'https://twitter.com/IDHUBOFFICIAL/status/978106995512434689'
        },
        {
          date: '2018-03-09',
          img: require('@/assets/20180309-hub2018.png'),
          selected: true,
          title: "IDHub 亮相 HUB2018 国际高峰论坛...",
          url: 'https://medium.com/@IDHUBOFFICIAL/%E5%8C%BA%E5%9D%97%E9%93%BE%E6%9C%AA%E6%9D%A5%E6%8C%87%E5%90%91%E4%BD%95%E6%96%B9-idhub%E4%BA%AE%E7%9B%B8hub2018%E5%9B%BD%E9%99%85%E9%AB%98%E5%B3%B0%E8%AE%BA%E5%9D%9B-2240d0f48472'
        },
        {
          date: '2018-03-09',
          img: require('@/assets/20180309-kuala-lumpur.png'),
          selected: false,
          title: "HUB2018 International Blockchain Summit...",
          url: 'https://twitter.com/IDHUBOFFICIAL/status/972006783253295109'
        },
        {
          date: '2017-12-09',
          img: require('@/assets/20171209-guiyang-contest.png'),
          selected: true,
          title: 'IDHub 荣获中国区块链技术创新应用大赛二等奖...',
          url: 'https://mp.weixin.qq.com/s/zp2hA4sdr33Jkcn77r2roA'
        },
        {
          date: '2017-06-24',
          img: require('@/assets/20170624-chancheng.png'),
          selected: false,
          title: '光载无限助力佛山禅城打造全国首个区块链政务应用，市民办事...',
          url: 'http://chainb.com/?P=Cont&id=4910'
        },
        {
          date: '2017-06-23',
          img: require('@/assets/20170623-coindesk.png'),
          selected: false,
          title: 'Local Government in China Trials Blockchain for Public Services...',
          url: 'https://www.coindesk.com/local-government-china-trials-blockchain-public-services/'
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
.news {
  &__list {
    @include container;
    @include clear_list;
    margin-top: 100px;
    width: 100%;
    &-item {
      background: white;
      box-shadow: 20px 20px 60px 0 rgba($color-gray-darkest, 0.1);
      border-radius: 5px;
      padding: 15px;
      &:hover {
        box-shadow: 20px 20px 60px 0 rgba($color-gray-darkest, 0.3);
        text-decoration: none;
      }
      @include span(1 of 1);
      margin-bottom: gutter();
      @include tablet {
        @include span(2 of 4);
        margin-bottom: gutter();
        height: 550px;
      }
      @include laptop {
        @include span(2 of 6);
        margin-bottom: gutter();
        height: 450px;
      }
      @include desktop {
        @include span(4 of 12);
        margin-bottom: gutter();
        height: 445px;
      }
      a {
        &:hover {
          text-decoration: none;
        }
      }
      &__photo {
        background-image: linear-gradient(-225deg, #FA2B56 0%, #F91C3D 100%);
        border-radius: 5px;
        overflow: hidden;
        position: relative;
        display: flex;
        justify-content: center;
        align-items: center;
      }
      &__text-box {
        margin-top: 30px;
        margin-bottom: 5px;
        text-align: left;
      }
      &__date {
        font-size: 12px;
        color: $color-gray-dark;
      }
      &__text {
        font-size: 18px;
        color: $color-gray-darker;
        @include font_loader($notosans, 4, 'n');
      }
    }
  }
}
</style>
