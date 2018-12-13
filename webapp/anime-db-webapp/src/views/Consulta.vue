<template>
    <section class="fdb-block" style="background-image: url(https://cdn.jsdelivr.net/gh/froala/design-blocks@2.0.1/dist/imgs//shapes/1.svg);" data-block-type="forms" data-id="7" draggable="true">
  <div class="container">
    <section class="" data-block-type="teams" data-id="9" draggable="true">
  <div class="container">
    <div class="row">
          <div class="col-sm-12 pb-2 text-left mt-0">
            <h3 class="result__container">Resultados encontrados: {{ animes.length }}
            </h3>
        </div>
      <div class="col-sm-3 text-left" v-for="(item, index) in animes" :key='index' @click="goto(item.id)">
        <div class="fdb-box p-0">
          <img alt="image" class="img-fluid rounded-0" :src="item.imagem">
          
          <div class="content p-3">
            <h3><strong>{{ item.titulo }}</strong></h3>
            <p class="mb-0 pb-0">Genero: {{ getGeneroById(item.generoid) }}</p>
            <p class="mb-0 pb-0">Descricao: {{ item.descricao }}</p>
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
      nota: [],
      generos: []
    }
  },
  components: {
  },
  computed: {},
  mounted () {
    this.getAnimes();
    this.getGenreList();
  },
  methods: {
    getAnimes: function() {
      axios
      .get('https://yesodia2-wickedjhow.c9users.io/animes')
      .then(response => (this.animes = response.data.resp))
      //.then(console.log(this.animes)) 
    },
    getGenreList: function() {
      axios
      .get('https://yesodia2-wickedjhow.c9users.io/anime/generos')
      .then(response => (this.generos = response.data.resp))
    },
    
    getNota: function(id) {
      const average = arr => arr.reduce( ( p, c ) => p + c, 0 ) / arr.length;

      axios
      .get('https://yesodia2-wickedjhow.c9users.io/nota/' + id)
      .then(response => (this.nota = response.data.resp))
      
      return (average(this.nota)); 
    },
    goto: function(id) {
          this.$router.push("/consulta/" + id);
      },
    getGeneroById(id) {
      switch(id) {
        case 1 : 
          return "Ação"
          break;
        case 2 :
          return "Drama"
          break;
        case 3 :
          return "Romance"
          break;
      }
    }
  },
};
</script>

<style lang="scss" scoped>
.fdb-box {
  cursor: pointer;
  transition: 0.5s;
  
  &:hover {
    transform: translateY(-2px);
    box-shadow: 0 3px 8px rgba(#111, 0.3);
  }
}

.fdb-block .fdb-box {
  height: 400px!important;
  margin-bottom: 30px;

  img {
    height: 250px;
  }
}
</style>
