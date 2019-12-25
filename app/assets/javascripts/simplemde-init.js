window.SimpleMde = {
  initialize: function() {
    var simplemde = new SimpleMDE({ 
      element: document.getElementById("markdown"),
      spellChecker: false
    });
  }
}