<template>
<header data-block-type="headers" data-id="1" class="">
  <div class="container">
    <nav class="navbar navbar-expand-md">
      <a class="navbar-brand" href="/">
        Anime-DB
      </a>

      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav1" aria-controls="navbarNav1" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarNav1">
        <ul class="navbar-nav mr-auto">
          
          <li class="nav-item">
              <router-link class="nav-link" to="editar" tag="a">Editar Anime</router-link>
          </li>
          
          <li class="nav-item">
               <router-link class="nav-link" to="consultar" tag="a">Consulta</router-link>
          </li>
        </ul>

        <a class="btn btn-outline-primary ml-md-3" href="/cadastrar">Cadastrar Anime</a>
      </div>
    </nav>
  </div>
</header>
</template>

<script>
import Vue from 'vue';
import VueResource from "vue-resource";

import $ from "jquery";

export default {
  name: "AppHeader",
  components: {
    
  },
  mixins: [],
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
        
      }
    },
}
};
</script>

<style lang="scss" scoped>
</style>
