export default function() {
  this.route("discourse-hide-old-text", function() {
    this.route("actions", function() {
      this.route("show", { path: "/:id" });
    });
  });
};
