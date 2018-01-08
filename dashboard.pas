unit dashboard;

interface

const


cDashboard =

' <!DOCTYPE html>  '
+'<html lang="en"> '
  + ' <head> '
    + ' <meta charset="utf-8">    '
    + ' <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> '
    + ' <meta name="description" content=""> '
    + ' <meta name="author" content=""> '

    + ' <title>Delphi setup dashboard </title>  '

    + ' <!-- Bootstrap core CSS --> '
    + ' <link href="dist/css/bootstrap.min.css" rel="stylesheet">   '
    + ' <script src="dist/js/Chart.bundle.min.js"> </script>  '
    + ' <script src="dist/js/Chart.min.js"> </script>  '
    + ' <!-- Custom styles for this template -->  '

  + ' </head>'

  + ' <body>   '
      + ' <div class="container-fluid">   '
      + ' <div class="row">  '
             + ' <div class="col"> '
                                + ' <div class="row"> '
                      + ' <div class="col"> '
                            + ' <div class="card text-black bg-warning text-center py-2 mb-4"> '
                                + ' <div class="card-body card-title">  '
                                    + ' <h1 class="m-b-2"> </h1>   '
                                  + ' <h6 class="text-light"> <strong>Asset Value</strong></h6>  '
                                    + ' <h6 class="text-light">R40000,23 </h6>  '
                                + ' </div>   '
                            + ' </div> '
                            + ' </div>  '


                        + ' </div> '




            + ' <div class ="row"> '
        + ' <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">   '
+ ' <canvas id="doughnut-chart1" width="" height=""></canvas> '
+ ' <!-- Bar chart-->   '
+ ' <script>  '
+'new Chart(document.getElementById("doughnut-chart1"), {    '
+  '  type: "doughnut",  '
+  '  data: {   '
+ '     labels: ["Kitchen", "Bathroom", "Bedroom1", "Lounge", "Dining Room"],  '
+  '    datasets: [   '
 +'       {    '
 +   '    label: "Rooms",    '
+ '         backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"], '
+'          data: [24,67,734,84,43]     '
+'        }  '
+'      ]  '
+'    },  '
 + '  options: {  '
+ '     legend: { display: false }, '
+ '     title: {    '
+'        display: "True", '
+'        text: "Total Assets Value"  '
+ '     }   '
+ '   }  '
+'});  '

+ ' </script>   '
+ ' </div>   '

 + ' <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">    '

+ ' <canvas id="doughnut-chart" width="" height=""></canvas> '
+ ' <!-- Bar chart-->  '
+ ' <script>   '
+'new Chart(document.getElementById("doughnut-chart"), {   '
+ '   type: "doughnut",  '
+'    data: { '
+'      labels: ["Dining Room", "Lounge", "Kitchen", "Bedroom1", "Bedroom2"],  '
+ '     datasets: [    '
 + '      {       '
+ '         label: "Room",   '
+ '         backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"], '
+'          data: [24,5,34,7,4 ] '
+'        } '
+ '     ] '
+ '   },  '
 + '  options: {  '
 + '    legend: { display: false },   '
 + '    title: { '
 +'       display: "True",'
 + '      text: "Total Asset Items"'
+'      }   '
+'    }  '
+'});   '



+ ' </script>   '
+ ' </div>    '
+ ' </div>   '



 + ' <div class ="row">   '
+ ' <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">  '

+ ' <canvas id="mixed-chart" width="" height=""></canvas> '
+ ' <script>  '
+'new Chart(document.getElementById("mixed-chart"), {   '
+'    type: "bar",   '
+ '   data: { '
+ '     labels: ["Furniture", "Electronic Equipment", "Artwork"],'
+'      datasets: [{    '
+'          label: "Purchased",  '
 + '        type: "line",       '
+ '         borderColor: "#8e5ea2",  '
+ '         data: [408,547,675],  '
+  '        fill: false  '
+  '      }, {   '
+ '         label: "Disposed",    '
+ '         type: "line",      '
+ '         borderColor: "#3e95cd",  '
+ '         data: [133,221,783],  '
 + '        fill: false     '
 + '      }, {                  '
 + '        label: "Purchased",   '
 + '        type: "bar",     '
 + '        backgroundColor: "rgba(0,120,5,0.2)",  '
 + '        data: [408,547,675],    '
 + '         label: "Disposed",     '
+ '         type: "bar",     '
+ '         backgroundColor: "rgba(0,30,220,0.2)",    '
+ '         backgroundColorHover: "#3e95cd", '
+ '         data: [133,221,783]  '
+ '       }         '
+ '     ]         '
+ '   },          '
+ '   options: {     '
+ '     title: {        '
+ '       display: true,   '
+ '       text: "Assets by Category"   '
+ '     },       '
+'      legend: { display: false }   '
+'    }   '
+'});      '
+ ' </script>     '
+ ' </div>       '

      + ' <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">   '

+ ' <canvas id="bar-chart-horizontal" width="" height=""></canvas>  '
+ ' <script> '
+' new Chart(document.getElementById("bar-chart-horizontal"), {   '
+'    type: "horizontalBar",'
+'    data: {          '
+ '     labels: ["Stolen", "Sold", "Written Off", "Given Away", "W/Claim"],  '
+'      datasets: [   '
+'        {       '
+'          label: "Reasons", '
+'         backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"], '
+'          data: [2478,5267,734,784,433]   '
+ '       }   '
+ '     ]  '
+ '   },   '
+'    options: {    '
+'      legend: { display: false },   '
+'      title: {    '
+ '       display: true,   '
+ '       text: "Asset Disposals"  '
+ '     } '
+ '   }  '
+'});   '
+ ' </script> '
  + ' </div>+ '

+ ' </div> '
+ ' </div> '
+ ' </div> '
+ ' </div> '

      + ' <script src="dist/jquery-3.1.1.slim.min.js" ></script> '
    + ' <script>window.jQuery || document.write(<script src="dist/js/jquery.min.js"> <\/script>)</script>'
    + ' <script src="dist/js/tether.min.js"> </script> '
    + ' <script src="dist/js/bootstrap.min.js"></script> '
    + ' <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->  '
  + ' <!--   <script src="../../assets/js/ie10-viewport-bug-workaround.js"> </script>-->   '
  + ' </body> '
+ ' </html>  ' ;

implementation

end.
