<template>

</template>

<script>
import Vue from 'vue';
import VueResource from "vue-resource";

import $ from "jquery";

export default {
  name: "AppHeader",
  components: {
    AppSearch
  },
  mixins: [func],
  data: function () {
    return {
     
    };
  },
  computed: {
    
  },
  mounted() {},
  methods: {
   
    goto(to, item = null) {
      switch (to) {
        case "legacy:my_account":
          this.gotoLegacy(null, "myaccount");
          break;
        case "system:logout":
          this.$store.dispatch('logout');
          break;
      }
    },
}
};
</script>

<style lang="scss" scoped>
</style>
