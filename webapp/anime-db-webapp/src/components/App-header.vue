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
            <a href="/consulta" class="nav-link">Consulta</a>
          </li>
          
        </ul>
        
                <ul class="navbar-nav justify-content-center d-none d-lg-flex ml-md-auto col-4">
                          <input type="text" class="form-control" id="search" @keyup.enter.native="pesquisar" @keyup.native="keyup" placeholder="Digitar nome do anime">
        <a class="btn" id="btn-pesquisa" @click="pesquisar" style="    ">Pesquisar</a>
                          
                </ul>
                <ul class="navbar-nav justify-content-end d-none d-lg-flex ml-md-auto">
          <li class="nav-item">
            <a class="nav-link" href="https://github.com/heyjouh96/yesod-animeDB"><svg class="svg-inline--fa fa-github fa-w-16" aria-hidden="true" data-prefix="fab" data-icon="github" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 496 512" data-fa-i2svg=""><path fill="currentColor" d="M165.9 397.4c0 2-2.3 3.6-5.2 3.6-3.3.3-5.6-1.3-5.6-3.6 0-2 2.3-3.6 5.2-3.6 3-.3 5.6 1.3 5.6 3.6zm-31.1-4.5c-.7 2 1.3 4.3 4.3 4.9 2.6 1 5.6 0 6.2-2s-1.3-4.3-4.3-5.2c-2.6-.7-5.5.3-6.2 2.3zm44.2-1.7c-2.9.7-4.9 2.6-4.6 4.9.3 2 2.9 3.3 5.9 2.6 2.9-.7 4.9-2.6 4.6-4.6-.3-1.9-3-3.2-5.9-2.9zM244.8 8C106.1 8 0 113.3 0 252c0 110.9 69.8 205.8 169.5 239.2 12.8 2.3 17.3-5.6 17.3-12.1 0-6.2-.3-40.4-.3-61.4 0 0-70 15-84.7-29.8 0 0-11.4-29.1-27.8-36.6 0 0-22.9-15.7 1.6-15.4 0 0 24.9 2 38.6 25.8 21.9 38.6 58.6 27.5 72.9 20.9 2.3-16 8.8-27.1 16-33.7-55.9-6.2-112.3-14.3-112.3-110.5 0-27.5 7.6-41.3 23.6-58.9-2.6-6.5-11.1-33.3 2.6-67.9 20.9-6.5 69 27 69 27 20-5.6 41.5-8.5 62.8-8.5s42.8 2.9 62.8 8.5c0 0 48.1-33.6 69-27 13.7 34.7 5.2 61.4 2.6 67.9 16 17.7 25.8 31.5 25.8 58.9 0 96.5-58.9 104.2-114.8 110.5 9.2 7.9 17 22.9 17 46.4 0 33.7-.3 75.4-.3 83.6 0 6.5 4.6 14.4 17.3 12.1C428.2 457.8 496 362.9 496 252 496 113.3 383.5 8 244.8 8zM97.2 352.9c-1.3 1-1 3.3.7 5.2 1.6 1.6 3.9 2.3 5.2 1 1.3-1 1-3.3-.7-5.2-1.6-1.6-3.9-2.3-5.2-1zm-10.8-8.1c-.7 1.3.3 2.9 2.3 3.9 1.6 1 3.6.7 4.3-.7.7-1.3-.3-2.9-2.3-3.9-2-.6-3.6-.3-4.3.7zm32.4 35.6c-1.6 1.3-1 4.3 1.3 6.2 2.3 2.3 5.2 2.6 6.5 1 1.3-1.3.7-4.3-1.3-6.2-2.2-2.3-5.2-2.6-6.5-1zm-11.4-14.7c-1.6 1-1.6 3.6 0 5.9 1.6 2.3 4.3 3.3 5.6 2.3 1.6-1.3 1.6-3.9 0-6.2-1.4-2.3-4-3.3-5.6-2z"></path></svg><!-- <i class="fab fa-github"></i> --></a>
          </li>
          </ul>
        <a class="btn btn-outline-primary ml-md-3" href="/cadastro">Cadastrar Anime</a>
      </div>
    </nav>
  </div>
</header>
</template>

<script>
import Vue from 'vue';
import VueResource from "vue-resource";
import axios from 'axios';

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

    pesquisar() {
      var query = document.getElementById('search').value;

      this.$router.push("/pesquisa/" + query);
    },
    keyup(event) {
      switch (event.key) {
        case "Enter":
          this.pesquisar();
        break;
      }
    },
}
};
</script>

<style lang="scss">
#btn-pesquisa {
  position: absolute;
    /* right: 0; */
    /* padding: 0; */
    border: 0;
    right: 0;
    font-size: 12px;
    border-radius: unset;
    top: 4px;
    margin-left: 0;
    transition: 0.5s;
    &:hover {
    transition: 0.5s;
    transform: translateY(-1px);  
    }
}
</style>
