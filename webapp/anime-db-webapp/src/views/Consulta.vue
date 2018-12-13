<template>
    <section class="fdb-block" style="background-image: url(https://cdn.jsdelivr.net/gh/froala/design-blocks@2.0.1/dist/imgs//shapes/1.svg);" data-block-type="forms" data-id="7" draggable="true">
  <div class="container">
    <section class="" data-block-type="teams" data-id="9" draggable="true">
  <div class="container">
    <div class="row">
      <div class="col-sm-3 text-left" v-for="(item, index) in animes" :key='index' @click="goto(item.id)">
        <div class="fdb-box p-0">
          <img alt="image" class="img-fluid rounded-0" :src="item.imagem">

          <div class="content p-3">
            <h3><strong>{{ item.titulo }}</strong></h3>
            <p>Nota: {{ getNota(item.id) }}</p>
            <p>Genero: {{ item.descricao }}</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
  </div>
</section>
</template>

<script>
import axios from 'axios';

export default {
  name: "Consulta",
  data() {
    return {
      animes: [],
      nota: []
    }
  },
  computed: {},
  mounted () {
    this.getAnimes();
  },
  methods: {
    getAnimes: function() {
      axios
      .get('https://yesodia2-wickedjhow.c9users.io/animes')
      .then(response => (this.animes = response.data.resp))
      //.then(console.log(this.animes)) 
    },
    
    getNota: function(id) {
      
      axios
      .get('https://yesodia2-wickedjhow.c9users.io/nota/' + id)
      .then(response => (this.nota = response.data.resp))
      
      return (this.nota); 
    },
    goto: function(id) {
          this.$router.push("/consulta/" + id);
      }
  },
};
</script>

<style lang="scss">
</style>
