<template>
<div class="">
  <section class="main">
    <app-header></app-header>
    <div style="">
      <transition name="component-fade" mode="out-in">
        <router-view :key="$route.path"></router-view>
      </transition>
    </div>

  </section>
  <app-footer></app-footer>

</div>
</template>

<script>
import AppHeader from "@/components/App-header";
import AppFooter from "@/components/App-footer";

export default {
  name: "DefaultLayout",
  data() {
    return {
      idappheader: 1,
    }
  },
  components: {
    AppHeader,
    AppFooter
  },
  methods: {
  },
  created() {
   
  },
  computed: {
    
  },
  watch: {
    '$route' (to, from) {
    const toDepth = to.path.split('/').length
    const fromDepth = from.path.split('/').length
    this.transitionName = toDepth < fromDepth ? 'slide-right' : 'slide-left'
  }
}
};
</script>

<style lang="scss">
.component-fade-enter-active, .component-fade-leave-active {
  transition: opacity .3s ease;
}
.component-fade-enter, .component-fade-leave-to
/* .component-fade-leave-active below version 2.1.8 */ {
  opacity: 0;
}
</style>
<style>
</style>
