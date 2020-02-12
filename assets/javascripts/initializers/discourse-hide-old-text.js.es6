import { withPluginApi } from "discourse/lib/plugin-api";

function initializeDiscourseHideOldText(api) {
  // https://github.com/discourse/discourse/blob/master/app/assets/javascripts/discourse/lib/plugin-api.js.es6
}

export default {
  name: "discourse-hide-old-text",

  initialize() {
    withPluginApi("0.8.31", initializeDiscourseHideOldText);
  }
};
