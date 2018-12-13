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
              <input type="text" class="form-control" id="titulo" name="titulo" :value="anime.titulo" placeholder="Titulo">
            </div>
            </div>
            <div class="row mt-4">
              <div class="col">
                <input type="text" class="form-control" id="descricao" name="descricao" :value="anime.descricao" placeholder="Descricao">
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
                  <input type="text" class="form-control" id="imagem" name="imagem" :value="anime.imagem"  placeholder="Imagem">
            </div>
                </div>
                <div class="row mt-4">
                  <div class="col">
                    <button class="btn btn-lg btn-danger" type="button" @click="deletarAnime()">Deletar</button>
                    <button class="btn btn-lg btn-primary text-right" style="float: right" type="button" @click="editarAnime()">Editar</button>
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
import qs from 'qs'
import $ from 'jquery';
export default {
  name: "Consulta",
  data() {
    return {
      generos: [],
      anime: [],
      animeId: this.$route.params.input,
    }
  },
  computed: {},
  mounted() {
    this.getGeneros();
    this.getAnime(this.animeId);

  },
  methods: {
    getGeneros: function () {
      axios
        .get('https://yesodia2-wickedjhow.c9users.io/anime/generos')
        .then(response => (this.generos = response.data.resp))
        .then(console.log(this.generos))
    },
    getAnime: function (animeId) {
      axios
        .get('https://yesodia2-wickedjhow.c9users.io/anime/' + animeId + '/mostrar')
        .then(response => (this.anime = response.data.resp))
        .then(console.log(this.anime))
    },
    deleteAnime: function (animeId) {
      axios
        .delete('https://yesodia2-wickedjhow.c9users.io/anime/' + animeId + '/apagar')
        .then(response => (this.anime = response.data.resp))
        .then(console.log(this.anime))
    },
    editarAnime: function () {

      let titulo = document.getElementById("titulo").value;
      let descricao = document.getElementById("descricao").value;
      let imagem = document.getElementById("imagem").value;
      let genero = document.getElementById("genero").value;

      var data = {
        titulo: titulo,
        descricao: descricao,
        imagem: imagem,
        generoid: genero,
      };

      var fd = $.ajax({
        url: "https://yesodia2-wickedjhow.c9users.io/anime/" + this.animeId + "/alterar",
        type: "PUT",
        data: JSON.stringify(data)
      });

      fd.done(function(resp) {
        console.log(resp);
      })
    }
  }
};
</script>

<style lang="scss">
</style>
