<template lang="pug">
.roadmap-content
  .container
    .item
      #timeline
        div
          section.year(v-for="(item, index) in $t('roadmap.content')")
            h3 {{ item.year }}
            section.title(v-for="(item, index) in item.quarters")
              h4 {{ item.title }}
              ul
                li(v-for="(event) in item.events")
                  | {{ event }}

</template>

<script>
export default {
  name: 'section-roadmap'
}
</script>

<style lang="scss" scoped>
.timeline-box {
  position: relative;
  height: 365px;
  overflow-x: scroll;
  .timeline-graph {
    position: absolute;
    width: 100%;
    left: 0;
    bottom: 0;
    text-align: center;
    img {
      width: 1011px;
    }
  }
}
.timeline-line {
  margin-top: -16px;
  width: 100%;
  border-top: 4px solid #0F358E;
  height: 8px;
}

@mixin border-radius($radius) {
  -webkit-border-radius: $radius;
  -moz-border-radius: $radius;
  -ms-border-radius: $radius;
  border-radius: $radius;
}

.roadmap-content {
  display: flex;
  flex-direction: column;
  text-align: initial;
  height: 50vh;
  overflow-x: scroll;
  a {
    color: #50585f;
    text-decoration: none;
    &:hover {
      color: #383e44;
    }
  }
}

.container {
  display: flex;
  flex: auto;
  flex-direction: column;
  max-height: 100%;
}

.item {
  display: flex;
  flex: auto;
  overflow-y: auto;
  padding: 0 1rem 0 1rem;
}

#price {
  display: inline;
}

#timeline {
  position: relative;
  display: table; /* For Firefox */
  height: 100%;
  margin: {
    left: auto;
    right: auto;
    top: 5rem;
  }
  div {
    &:after {
      content: '';
      width: 4px;
      position: absolute;
      top: .5rem;
      bottom: 0;
      left: 60px;
      z-index: 1;
      background: #0F358E;
    }
  }
  h3 {
    position: -webkit-sticky;
    position: sticky;
    top: 5rem;
    color: #888;
    margin: 0;
    font: {
      size: 1em;
      weight: 400;
    }
    @media (min-width: 62em) {
      font-size: 1.1em;
    }
  }
  section.year {
    position: relative;
    section {
      position: relative;
      padding-bottom: 1.75em;
      margin-bottom: 4em;
      h4 {
        position: absolute;
        bottom: 0;
        font: {
          size: 1.25em;
          weight: 400;
        }
        line-height: 1.2em;
        margin: 0;
        padding: 0 0 0 100px;
        color: #647391;
        @media (min-width: 62em) {
          font-size: 1em;
        }
      }
      ul {
        list-style-type: none;
        padding: 0 0 0 75px;
        margin: -1.35rem 0 1em;
        max-width: 32rem;
        font-size: 1em;
        @media (min-width: 62em) {
          font-size: 1em;
          padding: 0 0 0 100px;
        }
        &:last-child {
          margin: { bottom: 0; }
        }
        &:first-of-type:after {
          content: '';
          width: 24px;
          height: 24px;
          background: white;
          border: 5px solid #FD3C57;
          @include border-radius(50%);
          position: absolute;
          left: 49px;
          top: 3px;
          z-index: 2;
        }
        li {
          margin-left: .5rem;
          color: #647391;
          &:before {
            content: '·';
            margin-left: -.5rem;
            padding-right: .3rem;
          }
          &:not(:first-child) {
            margin-top: .5rem;
          }
          span.price {
            color: mediumturquoise;
            font-weight: 400;
          }
        }
      }
    }
  }
}

svg {
  border: 3px solid white;
  border-radius: 50%;
  box-shadow: 0 4px 6px rgba(50, 50, 93, .11), 0 1px 3px rgba(0, 0, 0, 0.08);
}

</style>
