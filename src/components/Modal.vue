<template lang="pug">
  transition(name='modal')
    .modal-mask
      .modal-wrapper
        .modal-container
          .modal-heade
            slot(name='header')
          slot(name='body')
</template>

<script>

export default {
  name: 'modal',
  data: () => {
    return {
      showModal: false
    }
  }
}

</script>

<style lang='scss' scoped>

.modal-mask {
  position: fixed;
  z-index: 9998;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-image: linear-gradient(-180deg, rgba(#061843, .9) 0%, rgba(#05112E, .9) 100%);
  display: table;
  transition: opacity .3s ease;
}

.modal-wrapper {
  display: table-cell;
  vertical-align: middle;
}

.modal-container {
  width: 100%;
  margin: 0 auto;
  padding: 20px 30px;
  transition: all .3s ease;
}

.modal-heade {
  text-align: center;
  color: white;
}
.modal-body {
  margin: 20px 0;
}

.modal-footer {
  border: none;
}

.modal-default-button {
  float: right;
}

.modal-enter {
  opacity: 0;
}

.modal-leave-active {
  opacity: 0;
}

.modal-enter .modal-container,
.modal-leave-active .modal-container {
  -webkit-transform: scale(1.1);
  transform: scale(1.1);
}
</style>
