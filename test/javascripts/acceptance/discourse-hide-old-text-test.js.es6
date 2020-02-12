import { acceptance } from "helpers/qunit-helpers";

acceptance("discourse-hide-old-text", { loggedIn: true });

test("discourse-hide-old-text works", async assert => {
  await visit("/admin/plugins/discourse-hide-old-text");

  assert.ok(false, "it shows the discourse-hide-old-text button");
});
