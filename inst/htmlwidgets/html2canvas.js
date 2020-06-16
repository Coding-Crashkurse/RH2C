HTMLWidgets.widget({

  name: 'html2canvas',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

        var div = document.createElement("div");
        div.id = x.id;
        div.innerHTML = x.label;
        div.style.padding = "10px 20px";
        div.style.fontSize = "16px";
        div.style.cursor = "pointer";
        div.style.align = "center";
        div.style.background = x.background;
        div.style.color = x.color;
        div.style.textAlign = "center";
        div.style.outline = "none";
        div.style.border = "1px solid white";
        div.style.borderRadius = "10px";


        // TODO: code to render the widget, e.g.
        document.querySelector(".html2canvas").appendChild(div);

        function saveAs(uri, filename) {

          var link = document.createElement('a');

          if (typeof link.download === 'string') {

              link.href = uri;
              link.download = filename;

              //Firefox requires the link to be in the body
              document.body.appendChild(link);

              //simulate click
              link.click();

              //remove the link when done
              document.body.removeChild(link);

          } else {

              window.open(uri);

          }
        }

        document.getElementById(x.id).addEventListener("mouseover", function() {
          this.style.color = x.background;
          this.style.background = x.color;
          div.style.border = `1px solid ${x.background}`;
        });

        document.getElementById(x.id).addEventListener("mouseout", function() {
          this.style.color = x.color;
          this.style.background = x.background;
          div.style.border = `1px solid ${x.color}`;

        });

        document.getElementById(x.id).addEventListener("click", function(e) {
          e.preventDefault();

          html2canvas(document.querySelector(x.selector)).then(canvas => {
              saveAs(canvas.toDataURL(), 'download.png');
          });
        });

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
