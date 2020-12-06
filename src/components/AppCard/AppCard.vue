<template>
  <div :class="[colClasses, { 'flex': colClasses}]">
      <div class="app-card" :class="[customClasses, { 'd-none': close }]">
        <app-card-heading
          :heading="heading"
          :removePanel="removePanel"
          :disableNotification="disableNotification"
          :settings="settings"
          :viewMore="viewMore"
          :withTabs="withTabs"
          :tabs="tabs"
          @onChangeTabCallback="onChangeTab"
          @onReload="onReload"
          @onClose="onClose"
        >
        </app-card-heading>
          <app-card-content :extraClass="[contentCustomClass]" :fullBlock="fullBlock">
            <slot></slot>
          </app-card-content>
        <app-card-footer v-if="footer">
          <slot name="footer"></slot>
        </app-card-footer>
      </div>
  </div>
</template>

<script>
import AppCardHeading from "./AppCardHeading";
import AppCardFooter from "./AppCardFooter";
import AppCardContent from "./AppCardContent";

export default {
  props: [
    "heading",
    "colClasses",
    "customClasses",
    "fullBlock",
    "contentCustomClass",
    "removePanel",
    "disableNotification",
    "fullScreen",
    "settings",
    "viewMore",
    "footer",
    "withTabs",
    "tabs",
    "onChangeTabCallback"
  ],
  data() {
    return {
      reload: false,
      close: false
    };
  },
  components: {
    AppCardHeading,
    AppCardFooter,
    AppCardContent,
  },
  methods: {
    onReload() {
      this.reload = true;
      let self = this;
      setTimeout(() => {
        self.reload = false;
      }, 1500);
    },
    onClose() {
      this.close = true;
    },
    onChangeTab(value) {
      this.$emit("onChangeTabCallback", value);
    }
  }
};
</script>