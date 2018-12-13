<template>
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
          <img alt="image" class="img-fluid rounded-0" :src="anime.imagem">
<div class="alterar" @click="editar(anime.id)">
            Alterar
          </div>
          <div class="content p-3">
            <h3><strong>{{ anime.titulo }}</strong></h3>
            <p>Nota: {{ getNota(anime.id) }}</p>
            <p>Genero: </p>
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
                anime: [],
                nota: [],
                animeId: this.$route.params.input,
            }
        },
        computed: {},
        mounted() {
            this.getAnime(this.animeId);
        },
        methods: {
            getAnime: function(animeId) {
                axios
                    .get('https://yesodia2-wickedjhow.c9users.io/anime/' + animeId + '/mostrar')
                    .then(response => (this.anime = response.data.resp))
                    .then(console.log(this.anime))
            },

            getNota: function(id) {

                axios
                    .get('https://yesodia2-wickedjhow.c9users.io/nota/' + id)
                    .then(response => (this.nota = response.data.resp))

                return (this.nota);
            },
            goto: function(id) {
                this.$router.push("/anime/" + id);
            },
            editar: function(id) {
                this.$router.push("/editar/" + id);
            }
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
