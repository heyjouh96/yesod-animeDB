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
            <select class="form-control" id="exampleFormControlSelect1">
              <option>1</option>
              <option>2</option>
              <option>3</option>
              <option>4</option>
              <option>5</option>
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
              <button class="btn btn-primary" type="button">Cadastrar</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</template>

<script>
export default {
  name: "Delecao",
  computed: {},
  methods: {
  refreshMessage: function() {
      this.$http.get('/message').then(
        response => {
          console.log(response);
        },
        error => {
        }
      );
    },
  },
  mounted() {
    this.refreshMessage();
  }
};
</script>

<style lang="scss">
</style>
