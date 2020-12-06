<template>
	<div class="tabs-listing">
		<v-tabs v-model="active" slider-color="red" show-arrows>
			<v-tab v-for="(tab,index) in tabs" :key="index" ripple >
				{{ tab.title }}
			</v-tab>
			
			<v-tab-item v-for="n in 3" :key="n" >
			<v-card flat v-if="n==1">
				<div class="table-responsive">
					<v-data-table
						:headers="headersForTransactionList" :items="tabsAndTableDetails.transactionList" 
						hide-default-footer 
						align='center'
						>
						<template v-slot:item.typeColor="{ item }">
							<v-chip :color="item.typeColor">{{ item.type }}</v-chip>
						</template>
					</v-data-table>
				</div>
			</v-card>

			<v-card flat v-if="n==2">
				<div class="table-responsive">
					<v-data-table
						:headers="headersForTransferReport"
						:items="tabsAndTableDetails.transferreport"
						align='center'
						hide-default-footer
						>
						<template v-slot:item.typeColor="{ item }">
							<v-chip :color="item.typeColor">{{ item.type }}</v-chip>
						</template>
						<template v-slot:item.statusColor="{ item }">
							<v-chip :color="item.statusColor">{{ item.status }}</v-chip>
						</template>
					</v-data-table>
				</div>
			</v-card>

				<v-card flat v-if="n==3">
				<div class="table-responsive">
					<v-data-table
						:headers="headersForExpenseCategory" :items="tabsAndTableDetails.expenseCategory"
						align='center'
						hide-default-footer
						>
						 <template v-slot:item.typeColor="{ item }">
							<v-chip :color="item.typeColor">{{ item.type }}</v-chip>
						</template>
						<template v-slot:item.statusColor="{ item }">
							<v-chip :color="item.statusColor">{{ item.status }}</v-chip>
						</template>
					</v-data-table>
				</div>
			</v-card>
			</v-tab-item>
		</v-tabs>

	</div>
</template>

<script>
import api from "Api";
export default {
  data() {
    return {
      headersForTransactionList: [
        {
          text: "Transaction Id",
          sortable: false,
          value: "transid"
        },
        {
          text: "Date",
          sortable: false,
          value: "date"
        },
        {
          text: "Account",
          sortable: false,
          value: "account"
        },
        {
          text: "Type",
          sortable: false,
          value: "typeColor"
        },
        {
          text: "Amount",
          sortable: false,
          value: "amount"
        },
        {
          text: "Debit",
          sortable: false,
          value: "debit"
        },
        {
          text: "Credit",
          sortable: false,
          value: "credit"
        },
        {
          text: "Balance",
          sortable: false,
          value: "balance"
        }
      ],

      headersForTransferReport: [
        {
          text: "Transfer Id",
          sortable: false,
          value: "transid"
        },
        {
          text: "Date",
          sortable: false,
          value: "date"
        },
        {
          text: "Account",
          sortable: false,
          value: "account"
        },
        {
          text: "Type",
          sortable: false,
          value: "typeColor"
        },
        {
          text: "Amount",
          sortable: false,
          value: "amount"
        },
        {
          text: "Balance",
          sortable: false,
          value: "balance"
        },
        {
          text: "Status",
          sortable: false,
          value: "statusColor"
        }
      ],

      headersForExpenseCategory: [
        {
          text: "Item No",
          sortable: false,
          value: "itmNo"
        },
        {
          text: "Date",
          sortable: false,
          value: "date"
        },
        {
          text: "Type",
          sortable: false,
          value: "typeColor"
        },
        {
          text: "Company Name",
          sortable: false,
          value: "companyName"
        },
        {
          text: "Amount",
          sortable: false,
          value: "amount"
        },
        {
          text: "Status",
          sortable: false,
          value: "statusColor"
        }
      ],
      tabsAndTableDetails: {},
      active: null,
      tabs: [
        {
          title: "Transaction List"
        },
        {
          title: "Transfer Report"
        },
        {
          title: "Expense Category"
        }
      ]
    };
  },
  mounted() {
    this.getTableDetails();
  },
  methods: {
    next() {
      const active = parseInt(this.active);
      this.active = active < 2 ? active + 1 : 0;
    },
    getTableDetails() {
      const self = this;
      api
        .get("transcationTable.json")
        .then(response => {
          self.loader = false;
          this.tabsAndTableDetails = response.data;
        })
        .catch(error => {
          console.log(error);
        });
    }
  }
};
</script>