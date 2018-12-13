<template>
<section class="fdb-block">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-12 col-md-8 col-lg-6 text-center">
        <h1>Comentar em {{ anime.titulo }} </h1>
        <div class="input-group mt-4 mb-4">
          <input type="text" class="form-control" id="comentario" placeholder="Escrever comentário">
          <div class="input-group-append">
            <button class="btn btn-primary" @click="comentar()" type="button">Comentar</button>
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
    this.getAnime(this.animeId);
  },
  methods: {
    getAnime: function (animeId) {
      axios
        .get('https://yesodia2-wickedjhow.c9users.io/anime/' + animeId + '/mostrar')
        .then(response => (this.anime = response.data.resp))
        .then(console.log(this.anime))
    },
    comentar: function () {
      let comentario = document.getElementById("comentario").value;
      let animeid = this.animeId;

      var data = {
        comentario: "amei",
        animeid: 14,
      };

      var fd = $.ajax({
        url: "https://yesodia2-wickedjhow.c9users.io/anime/comentar",
        type: "POST",
        data: JSON.stringify({
          comentario: comentario,
          animeid: parseInt(this.animeId, 10)
        })
      }).then(this.$router.push("/consulta/" + this.animeId)).then(this.toastSuccess("Comentário efetuado!"));
      
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
  }
};
</script>

<style lang="scss">
</style>
