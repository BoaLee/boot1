
function tochangePersonal() {
    var idnum=$("#id").val();
    if(null==idnum || ""==idnum){
        window.location.href="/jsps/personal/changepersonal.jsp";
    }else{
        window.location.href="/corporation/changepersonal/"+idnum;
    }
}