<template>
   <div class="emb-FinalReceipt-wrap" v-if="userDetails">
      <emb-page-title	heading="Payment Information"></emb-page-title>
      <div class="final-receipt  section-gap">
         <v-container grid-list-xl py-0>
            <v-layout align-center justify-center>
               <v-flex xs12 sm12 md10 lg7 xl7>
                  <div class="emb-card pb-12">
                     <div  id="payment-receipt">
                        <div class="text-center bg-grey pa-sm-12 pa-6">
                           <h1>Thank You</h1>
                           <h5 class="mb-6">Payment is successfully processsed and your order is on the way </h5>
                           <h6 class="mb-6">Transaction ID: {{invoiceData.transactionId}}</h6>
                           <img src="/static/images/checked.png" width="64" height="64" alt="Success">
                        </div>
                        <div class="py-sm-12 py-8 px-sm-6 px-4">
                           <v-layout row wrap mb-6>
                              <v-flex xs12 sm6 md6 lg6 xl6>
											<h6>Summary</h6>
                                 <p class="mb-1 text-capitalize">Order ID: {{invoiceData.orderId}}</p>
                                 <p class="mb-1">Order Date: {{invoiceData.orderedDate}}</p>
                                 <p class="mb-1">Order Total: <emb-currency-sign></emb-currency-sign>{{getTotalPrice()}}</p>
                              </v-flex>
                              <v-flex xs12 sm6 md6 lg6 xl6>
											<h6>Ship To</h6>
											<p class="mb-1">{{userDetails.firstName}} {{userDetails.lastName}}</p>
											<p class="mb-1">{{userDetails.aptBuilding}}</p>
                                 <p class="mb-1">{{userDetails.cityState}}</p>
                                 <p class="mb-1">{{userDetails.country}} - {{userDetails.zipCode}}</p>
                                 <p class="mb-1">Contact No. {{userDetails.phone}}</p>
                              </v-flex>
                           </v-layout>
                           <div class="py-6 text-center bg-grey px-3">
                              <h4>Expected Date of Delivery</h4>
                              <h3>{{invoiceData.deliveryDate}}</h3>
                           </div>
                           <h4 class="pt-6">Your Ordered Details</h4>
                           <template v-for="(cart, index) in invoiceData.products">
                              <div class="layout row wrap align-center d-flex my-0 text-md-left text-center" v-if="invoiceData.products"  :key="index">
                                 <v-flex xs12 sm12 md3 lg3 xl3>
                                    <img alt="cart Image" width="100" :src="cart.image">
                                 </v-flex>
                                 <v-flex xs12 sm4 md3 lg3 xl3>
                                    <h6>Product Name</h6>
                                    <p class="mb-0 font-weight-bold">{{cart.name}}</p>
                                 </v-flex>   
                                 <v-flex xs6 sm4 md3 lg3 xl3>
                                    <h6>Quantity</h6>
                                    <p class="mb-0" >{{cart.quantity}}</p>
                                 </v-flex>
                                 <v-flex xs6 sm4 md3 lg3 xl3>
                                    <h6>Price</h6>
                                    <p class="mb-0" >${{cart.price}}</p>
                                 </v-flex>
                              </div>
                           </template>
                           <v-divider class="my-4"></v-divider>
                           <div>
                              <div class="d-flex align-center justify-space-between mt-4 mb-4">
                                 <div><p class="mb-0">Subtotal</p></div>
                                 <div><span><emb-currency-sign></emb-currency-sign>{{itemTotal()}}</span></div>
                              </div>
                              <div class="d-flex align-center justify-space-between mb-4">
                                 <p class="mb-0">Shipping</p>
                                 <span><emb-currency-sign></emb-currency-sign>{{shipping}}</span>
                              </div>
                              <div class="d-flex align-center justify-space-between mb-4">
                                 <p class="mb-0">Tax(GST)</p>
                                 <span><emb-currency-sign></emb-currency-sign>{{tax}}</span>
                              </div>
                           </div>
									<v-divider class="my-4"></v-divider>
									<div class="d-flex align-center justify-space-between">
										<h4>Total</h4>
										<h4><emb-currency-sign></emb-currency-sign>{{getTotalPrice()}}</h4>
									</div>
                        </div>
                     </div>
                     <div class="layout row wrap pt-6 px-4 text-center">
								<v-flex xs12 sm6 md6 lg6 xl6 text-md-left>
                        	<v-btn class="accent" large>Download PDF</v-btn>
								</v-flex>
								<v-flex xs12 sm6 md6 lg6 xl6 text-md-right>
									<v-btn class="accent" large to="/">Go To Home</v-btn>
								</v-flex>
                     </div>
                  </div>
               </v-flex>
            </v-layout>
         </v-container>
      </div>
   </div>
</template>

<script>
import { mapGetters } from "vuex";
import moment from "moment";

export default {
  computed: {
    ...mapGetters(["invoiceData", "tax", "shipping", "userDetails"])
  },
  data() {
    return {
      userInfo: {
        firstName: "",
        lastName: "",
        streetName: "",
        aptBuilding: "",
        zipCode: "",
        cityState: "",
        country: "",
        phone: "",
        email: ""
      },
      productDetail: [
        {
          "Product Name": "Super Jacket",
          Quantity: 1,
          Price: "$67.00"
        }
      ]
    };
  },
  methods: {
    /**
     * this function returns the delivery date
     **/
    deliveryDate() {
      let format = "MMMM Do , YYYY";
      let startdate = moment().format(format);
      var new_date = moment(startdate, format).add(5, "days");
      return new_date.format(format);
    },
    /**
     * this function returns the total for the item
     **/
    itemTotal() {
      let productTotal = 0;
      if (this.invoiceData.products && this.invoiceData.products.length > 0) {
        for (const item of this.invoiceData.products) {
          productTotal += item.price * item.quantity;
        }
        return productTotal.toFixed(2);
      } else {
        return productTotal;
      }
    },
    /**
     * this function returns the total price
     **/
    getTotalPrice() {
      let totalPrice = this.tax + this.shipping;
      if (this.invoiceData.products && this.invoiceData.products.length > 0) {
        for (const item of this.invoiceData.products) {
          totalPrice += item.price * item.quantity;
        }
        return totalPrice.toFixed(2);
      } else {
        return totalPrice.toFixed(2);
      }
    }
  }
};
</script>
