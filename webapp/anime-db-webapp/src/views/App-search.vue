<template>
  <suggestions v-model="searchQuery" :options="options" :onItemSelected="onSearchItemSelected" :onInputChange="onInputChange" @keyup.native="keyup">
<h2>A</h2>
    <div slot="item" slot-scope="props" class="single-item" v-bind:class="{ noClick: (props.item.notselectable === 1) }" @click.prevent="goto(props.item);">
      <span class="suggestions-group" v-if="props.item.notselectable === 1">
          {{props.item.description}}
      </span>

      <span class="name" v-if="props.item.notselectable === 0">
        <a>
         
          <span>
          {{props.item.description}}
          </span>
        </a>
      </span>
    </div>
</suggestions>
</template>

<script>
import Vue from 'vue';
import suggestions from "v-suggestions";
import axios from 'axios';

import "v-suggestions/dist/v-suggestions.css";

export default {
  name: "App-search",
  components: {
    suggestions
  },
  data() {
    return {
      searchQuery: "",
      selectedSearchItem: null,
      options: {
        debounce: 200,
        inputClass: 'inputautocomplete',
      }
    };
  },
  methods: {

    /** 
     * Identificar enter na pesquisa e limpar a query
     */
    keyup(event) {
      switch (event.key) {
        case "Enter":
          this.searchQuery = document.getElementsByClassName("inputautocomplete")[0].value;

          Vue.nextTick().then(response => {
            this.onSubmit(event);
          });
        break;
      }
    },

    onInputChange(query) {
      if (query.trim().length === 0) {
        return null;
      }

      const items = [];
      return new Promise(resolve => {
        teste.then(response => {
          response.forEach(item => {
            //if (item.id_evento === null && item.notselectable === 0) return;
            if (item.description) {
              if (item.description.length > 50) {
                item.description = item.description.substring(0, 50) + "...";
              }
              items.push(item);
            }
          });

          resolve(items);
        });
      });
    },
    onSearchItemSelected(item) {
      this.selectedSearchItem = item;
    },
    getAnimes: function() {
      axios
      .get('https://yesodia2-wickedjhow.c9users.io/animes')
      .then(response => (this.animes = response.data.resp))
      .then(console.log(this.animes)) 
    },
  }
};
</script>
<style>
.noClick {
  cursor: default;
}
</style>
