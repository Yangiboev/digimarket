<template>
   <div class="order-history-wrap emb-card pa-4">
      <h4 class="mb-4">Order History</h4>
      <v-data-table 
         :headers="headers"
			:items="tableData"
			hide-default-footer
      >
         <template v-slot:item.action="{ item }">
				<a href="javascript:void(0)"><v-icon class="accent--text">remove_red_eye</v-icon></a>
			</template>
      </v-data-table>
   </div>
</template>

<script>
export default {
   data(){
      return{
         headers: [
            {
            text: 'No',
            align: 'left',
            sortable: false,
            value: 'srno'
            },
            { text: 'Order Id', value: 'orderId' },
            { text: 'Product Name', value: 'name' },
            { text: 'Price', value: 'price' },
            { text: 'Status', value: 'status' },
            { text: 'Action', value: 'action' }
         ],
         tableData: [
            {
               value: false,
               srno: 1,
               orderId: 159,
               name: "LEGITIM",
               price: 24.44,
               status: "Sent"
            },
            {
               value: false,
               srno: 2,
               orderId: 237,
               name: "GRUNDTAL",
               price: 37.44,
               status: "In Process"
            },
            {
               value: false,
               srno: 3,
               orderId: 262,
               name: "BOHOLMEN",
               price: 23.85,
               status: "Sent",
            },
            {
               value: false,
               srno: 4,
               orderId: 305,
               name: "ROSTAD LÖK",
               price: 67.36,
               status: "Return"
            },
            {
               value: false,
               srno: 5,
               orderId: 356,
               name: "TÅRTA CHOKLADKROKANT",
               price: 49.36,
               status: "In Process"
            }
         ]
      }
   }   
}
</script>

