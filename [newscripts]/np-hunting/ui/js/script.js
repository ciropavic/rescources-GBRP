window.addEventListener('message', function(event) {
    const listener = event.data;
    var source = listener.source
    var app = listener.app
    var showapp = listener.show
    var appdata = listener.data
    switch (app) {
        case "sniper-scope":
            if (appdata.show == true) {
                console.log("show test")
                $(".container-scope").show();
            }else {
                console.log("hide test")
                $(".container-scope").hide();
            }
            break;
        default:
            break;
    }
})