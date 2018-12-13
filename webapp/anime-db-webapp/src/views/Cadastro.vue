<template>
    <section class="fdb-block" style="background-image: url(https://cdn.jsdelivr.net/gh/froala/design-blocks@2.0.1/dist/imgs//shapes/1.svg);" data-block-type="forms" data-id="7" draggable="true">
  <div class="container">
    <div class="row justify-content-end">
      <div class="col-12 col-md-9 col-lg-8">
                <div class="fdb-box fdb-touch">
          <div class="row">
            <div class="col">
              <h1>Cadastrar anime</h1>
            </div>
          </div>
          <div class="row">
            <div class="col mt-4">
              <input type="text" class="form-control" id="titulo" name="titulo" placeholder="Titulo">
            </div>
          </div>
          <div class="row mt-4">
            <div class="col">
              <input type="text" class="form-control" id="descricao" name="descricao" placeholder="Descricao">
            </div>
          </div>
          
          <div class="row mt-4">
              <div class="col">
            <label for="exampleFormControlSelect1">Genero</label>
            <select class="form-control" id="genero">
              <option  v-for="(item, index) in generos" :key='index' :value="item.id">{{ item.descricao }}</option>
            </select>
          </div>
          </div>
          
          <div class="row mt-4">
            <div class="col">
              <input type="text" class="form-control" id="imagem" name="imagem" placeholder="Imagem">
            </div>
          </div>
          <div class="row mt-4">
            <div class="col">
              <button class="btn btn-primary" type="button" @click="postAnime">Cadastrar</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</template>

<script>
import axios from 'axios';
export default {
  name: "Consulta",
  data() {
    return {
      generos: [],
    }
  },
  computed: {},
  mounted () {
    this.getList();
   
  },
  methods: {
    getList: function() {
      axios
      .get('https://yesodia2-wickedjhow.c9users.io/anime/generos')
      .then(response => (this.generos = response.data.resp))
      .then(console.log(this.generos)) 
    },
    
    postAnime: function() {
      
      let titulo = document.getElementById("titulo");
      let descricao = document.getElementById("descricao");
      let imagem = document.getElementById("imagem");
      let genero = document.getElementById("genero").value;
      
      console.log(genero);
      
      axios.post('https://yesodia2-wickedjhow.c9users.io/anime', {
        titulo: 'Teste',
        descricao: 'Flintstone',
        imagem: 'teste',
        id: '3'
      })
      .then(function (response) {
        console.log(response);
      })
      .catch(function (error) {
        console.log(error);
      });
    }
  },
};
</script>

<style lang="scss">
</style>
