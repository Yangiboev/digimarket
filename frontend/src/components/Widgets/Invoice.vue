<template>
   <div class="table-responsive" >
		<v-data-table
			:headers="headers"
			:items="invoiceData"
			:items-per-page="15"
			:search="search"
			align='center'
		>
			<template v-slot:item.action="{ item }">
				<v-btn text icon color="grey" class="mr-3"  @click="openDialog()" small slot="activator">
					<v-icon class="primary--text">remove_red_eye</v-icon>
				</v-btn>
				<v-btn text icon color="grey" small  @click="deleteItemFromInvoicesList(item)" slot="activator">
					<v-icon class="error--text">delete</v-icon>
				</v-btn>
			</template>
			
		</v-data-table>
		<v-dialog v-model="editDialog" max-width="685px" class="pa-2">
			<v-card class="emb-FinalReceipt-wrap">
				<v-card-text class="pa-4">
					<v-flex xs12>
						<div class="text-center bg-grey px-4 py-6">
							<h4>Payment Status</h4>
							<h5 class="mb-6">Payment is successfully processsed and your order is on the way </h5>
							<h6 class="mb-6">Transaction ID:267676GHERT105467</h6>
							<img src="/static/images/checked.png" width="64" height="64" alt="Success">
						</div>
						<div class="mt-12 mx-4">
							<v-layout row wrap mb-10 mx-0 mt-0>
								<v-flex xs12 sm6 md6 lg6 xl6 text-left pa-0 >
									<h6>Summary</h6>
									<p class="mb-1">Order ID : 2563883628932</p>
									<p class="mb-1">Order Date : September 20, 2019</p>
									<p class="mb-1">Order Total : $888.00</p>
								</v-flex>
								<v-flex xs12 sm6 md6 lg6 xl6 text-left pa-0>
									<h6>Ship To</h6>
									<p class="mb-1">Nitin Goyal</p>
									<p class="mb-1">Hyderabad</p>
									<p class="mb-1">India-500 002</p>
									<p class="mb-1">Contact No. 202-555-0185</p>
								</v-flex>
							</v-layout>
							<div class="py-6 text-center bg-grey">
								<h4>Expected Date of Delivery</h4>
								<h3>December 31, 2019</h3>
							</div>
							<h4 class="pt-12 mb-7 text-sm-left text-center">Your Ordered Details</h4>
							<div class="layout row wrap align-center d-flex ma-0" >
								<v-flex xs12 sm12 md3 lg3 xl3>
									<img alt="cart Image" width="100" src="/static/images/gadgets/g-2-a.jpg">
								</v-flex>
								<v-flex xs12 sm12 md3 lg3 xl3>
									<h6>Product Name</h6>
									<p class="font-weight-bold">Black Smartphone</p>
								</v-flex>
								<v-flex xs12 sm12 md3 lg3 xl3>
									<h6>Quantity</h6>
									<p>1</p>
								</v-flex>
								<v-flex xs12 sm12 md3 lg3 xl3>
									<h6>Price</h6>
									<p>$888.00</p>
								</v-flex>
							</div>
							
							<v-divider class="my-6"></v-divider>
							<div class="pt-6">
								<div class="layout align-center justify-space-between ma-0">
									<p>Subtotal</p>
									<span>$847.63</span>
								</div>
								<div class="layout align-center justify-space-between ma-0">
									<p>Shipping</p>
									<span>$12.95</span>
								</div>
								<div class="layout align-center justify-space-between ma-0">
									<p>Tax(GST)</p>
									<span>$27.95</span>
								</div>
								<v-divider class="my-4"></v-divider>
								<div class="layout align-center justify-space-between ma-0">
									<h4>Total</h4>
									<h4>$888.53</h4>
								</div>
								<v-divider class="my-4"></v-divider>
							</div>
							<div class="layout align-center justify-space-between ma-0 my-6">
								<v-btn color="accent">Download PDF</v-btn>
								<v-btn color="accent" to="/admin-panel/reports">Go To Home</v-btn>
							</div>	
						</div>
					</v-flex>
				</v-card-text>
			</v-card>
		</v-dialog>
		<emb-delete-confirmation-2
			ref="deleteConfirmationDialog"
			messageTitle="Are You Sure You Want To Delete?"
			messageDescription="Are you sure you want to delete this invoice permanently?"
			@onConfirm="ondeleteItemFromInvoicesList"
			btn1="Cancel"
			btn2="Yes"
		>
		</emb-delete-confirmation-2>
	</div>
</template>

<script>
import api from "Api";

export default {
  props: {
    search: {
      default: null,
      type: String
    }
  },
  data() {
    return {
      editDialog: false,
      invoiceList: null,
      headers: [
        {
          text: "No.",
          sortable: false,
          value: "position"
        },
        {
          text: "Invoice ID",
          sortable: false,
          value: "invoiceId"
        },
        {
          text: "Buyer",
          sortable: false,
          value: "name"
        },
        {
          text: "Date",
          sortable: false,
          value: "date"
        },
        {
          text: "Price",
          sortable: false,
          value: "price"
        },
        {
          text: "Payment",
          sortable: false,
          value: "payment"
        },
        {
          text: "Status",
          sortable: false,
          value: "status"
        },
        {
          text: "Actions",
          sortable: false,
          value: "action"
        }
      ],
      selectDeletedItem: null,
      invoiceData: []
    };
  },
  mounted() {
    this.getInvoice();
  },
  methods: {
    openDialog() {
      this.editDialog = true;
    },
    deleteItemFromInvoicesList(item) {
      this.$refs.deleteConfirmationDialog.openDialog();
      this.selectDeletedItem = item;
    },
    ondeleteItemFromInvoicesList() {
      this.$refs.deleteConfirmationDialog.close();
      let index = this.invoiceData.indexOf(this.selectDeletedItem);
      this.invoiceData.splice(index, 1);
    },
    getInvoice() {
      const self = this;
      api
        .get("invoiceData.json")
        .then(response => {
          self.loader = false;
          this.invoiceList = response.data;

          for (var i = 0; i < this.invoiceList.length; i++) {
            this.invoiceData.push(this.invoiceList[i]);
          }
        })
        .catch(error => {
          console.log(error);
        });
    }
  }
};
</script>
