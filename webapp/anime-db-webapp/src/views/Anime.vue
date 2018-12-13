<template>
<div>
<section class="fdb-block" style="background-image: url(https://cdn.jsdelivr.net/gh/froala/design-blocks@2.0.1/dist/imgs/shapes/8.svg);" data-block-type="forms" data-id="7" draggable="true">
  <div class="container">
    <div class="row align-items-center">
      <div class="col-12 col-md-7 col-lg-5 ml-md-auto">
        <h1>{{ anime.titulo }}</h1>
        <p class="lead"> {{ anime.descricao }}</p>

        <p class="mt-5">
        </p>
      </div>

      <div class="col-sm-6 text-left">
        <div class="fdb-box p-0">
              <div alt="image" class="div-img img-fluid rounded-0"  :style="{ backgroundImage: 'url(\'' + anime.imagem + '\')' }" style="height: 400px; background-size: cover; background-position: center bottom;">
              </div>
          <div class="alterar" @click="editar()">
            Alterar
          </div>
          <div class="content p-3">
            <h3><strong>{{ anime.titulo }}</strong></h3>
            <p>Avaliar: <label for="exampleFormControlSelect1"></label>
                <select class="ml-3 mr-3" id="nota">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                </select>
                <span @click="votarAnime" style="font-size: 14px; cursor: pointer">Confirmar</span>            
            <p>Nota: {{ getNota(animeId) }}</p>
            <p>Genero: {{ getGeneroById(anime.generoid) }} </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<section class="fdb-block">
  <div class="container">
    <div class="row text-center justify-content-center">
      <div class="col-md-10 col-lg-7">
        <h3 v-show="comentarios.length > 0" >Comentários</h3>
      </div>
    </div>

    <div class="row mt-5 justify-content-center">
      <div class="col-md-10 col-lg-3 ml-auto mr-auto text-center" v-for="(item, index) in comentarios" :key='index' >
        <p class="h3 mb-4 mb-lg-5">{{item.comentario}}</p>
      </div>
    </div>
  </div>

    <div class="row text-center justify-content-center">
      <div class="col-md-10 col-lg-7">
        <h3 style="cursor: pointer" @click="comentar">Comentar</h3>
      </div>
    </div>
</section>
</div>
</template>

<script>
import axios from 'axios';
import $ from 'jquery';

export default {
  name: "Consulta",
  data() {
    return {
      anime: [],
      comentarios: [],
      animeId: this.$route.params.input,
    }
  },
  computed: {},
  mounted() {
    this.getAnime(this.animeId);
    this.getGenreList();
    this.getComentarios(this.animeId);
  },
  methods: {
    getAnime: function (animeId) {
      axios
        .get('https://yesodia2-wickedjhow.c9users.io/anime/' + animeId + '/mostrar')
        .then(response => (this.anime = response.data.resp))
        .then(console.log(this.anime))
    },
    getComentarios: function () {
      axios
        .get('https://yesodia2-wickedjhow.c9users.io/anime/' + this.animeId + '/comentarios')
        .then(response => (this.comentarios = response.data.resp))
        .then(console.log(this.comentarios))
    },
    getNota: function (id) {
      const average = arr => arr.reduce((p, c) => p + c, 0) / arr.length;

      axios
        .get('https://yesodia2-wickedjhow.c9users.io/nota/' + id)
        .then(response => (this.nota = response.data.resp))

      return (this.nota == undefined ? 0 : average(this.nota));
    },
    goto: function (id) {
      this.$router.push("/anime/" + id);
    },
    comentar: function () {
      this.$router.push("/comentar/" + this.animeId);
    },
    editar: function () {
      this.$router.push("/editar/" + this.animeId);
    },
    getGenreList: function () {
      axios
        .get('https://yesodia2-wickedjhow.c9users.io/anime/generos')
        .then(response => (this.generos = response.data.resp))
    },
    getGeneroById(id) {
      switch (id) {
        case 1:
          return "Ação"
          break;
        case 2:
          return "Drama"
          break;
        case 3:
          return "Romance"
          break;
      }
    },
     votarAnime: function () {

      let nota = document.getElementById("nota").value;

      var fd = $.ajax({
        url: "https://yesodia2-wickedjhow.c9users.io/nota",
        type: "POST",
        data: JSON.stringify({
          valor: parseInt(nota, 10),
          animeid: parseInt(this.animeId, 10)
        })
      }).then(this.toastSuccess("Nota avaliada!"));;

      fd.done(function (resp) {
        console.log(resp);
      })
    },
    toastSuccess(message, timer = 4000, showbutton = false) {
      this.$swal({
        type: 'success',
        toast: true,
        text: message,
        position: 'top-end',
        customClass: 'alert__tixsme alert__sucess',
        background: '#333',
        timer: timer,
        showConfirmButton: showbutton,
      });
    },
  },
};
</script>

<style lang="scss">
.alterar {
  position: absolute;
  top: 0;
  right: 15px;
  background: white;
  /* width: 80px; */
  padding: 10px;
  text-align: center;
  border-bottom-left-radius: 10px;
  border-bottom-right-radius: 10px;
  font-weight: solid;
  font-weight: bold;
  font-size: 16px;
  cursor: pointer;
  transition: 0.5s;

  &:hover {
    box-shadow: 0 3px 8px rgba(#222, 0.3);
  }
}
</style>
