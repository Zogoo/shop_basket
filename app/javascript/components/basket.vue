<template>
  <div id="app">
    <v-app id="inspire">
      <v-data-table
        :headers="headers"
        :items="basket"
        sort-by="name"
        class="elevation-1"
      >
        <template v-slot:top>
          <v-toolbar flat>
            <v-toolbar-title>My basket</v-toolbar-title>
            <v-spacer></v-spacer>
            <v-dialog v-model="dialogDelete" max-width="500px">
              <v-card>
                <v-card-title class="headline">Are you sure you want to delete this item?</v-card-title>
                <v-card-actions>
                  <v-spacer></v-spacer>
                  <v-btn color="blue darken-1" text @click="closeDelete">Cancel</v-btn>
                  <v-btn color="blue darken-1" text @click="deleteItemConfirm">OK</v-btn>
                  <v-spacer></v-spacer>
                </v-card-actions>
              </v-card>
            </v-dialog>
          </v-toolbar>
        </template>
        <template v-slot:item.delete="{ item }">
          <v-icon
            mid
            @click="deleteItem(item)"
          >
            mdi-delete
          </v-icon>
        </template>
      </v-data-table>
    </v-app>
  </div>
</template>
<script>
import axios from 'axios';
import BasketManager from '../common/BasketManager';

export default {
  data: function() {
    return {
      search: '',
      headers: [
        { text: 'Name', value: 'name'},
        { text: 'Price', value: 'price'},
        { text: 'Delivery', value: 'delivery_period'},
        { text: '', value: 'delete', sortable: false },
      ],
      basket: [],
      dialogDelete: false,
      editedIndex: -1,
    }
  },
  mounted(){
    axios.get('/api/v1/basket/show').then((response) => {
      if(response.data.basket.length > 0) {
        this.basket = response.data.basket;
      }else{
        this.basket = BasketManager.read();
      }
    })
  },
  watch: {
    dialogDelete (val) {
      val || this.closeDelete()
    },
  },
  methods: {
    deleteItem (item) {
      this.editedIndex = this.basket.indexOf(item)
      this.dialogDelete = true
    },

    deleteItemConfirm () {
      this.basket.splice(this.editedIndex, 1);
      BasketManager.add(this.basket);
      this.closeDelete();
    },
    closeDelete () {
      this.dialogDelete = false
    },
  }
}
</script>

<style scoped>
</style>