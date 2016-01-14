var nav = {
  scrollTo: function(event, id) {
    var el = document.getElementById(id);

    if (el) {
      event.preventDefault();
      el.scrollIntoView();
      window.location = "#" + id;
    }
  },

  login: function(event) {
    event.preventDefault();
    document.getElementById('login').className = 'login';
  }
};
