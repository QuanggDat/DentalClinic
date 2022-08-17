<%-- 
    Document   : priceList
    Created on : Jun 4, 2022, 2:48:09 PM
    Author     : SE150436 - Hoàng Quang Hòa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Price list</title>
    <!-- Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <!-- Css -->
    <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
    <!-- Font  -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- BootStrap  -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Js  -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div class="row row-content">
        <div class="col-12" id="accordion">
      <!--<div class="col-12 tab-content">-->
     <!--<div class="col-12">-->
         <h2>Corporate Leadership</h2>	
         
         <div class="card">
             <div class="card-header" role="tab" id="peterhead">
                 <h3 class="mb-0"><a data-toggle="collapse" data-target="#implant">CẤY GHÉP
                    IMPLANT</a></h3>
             </div>
             <div class="collapse show" id="implant" data-parent="#accordion">
                 <div class="card-body">
                    <table class="table">
                        <thead>
                          <tr>
                            <th>Firstname</th>
                            <th>Lastname</th>
                            <th>Email</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td>Default</td>
                            <td>Defaultson</td>
                            <td>def@somemail.com</td>
                          </tr>      
                          <tr class="table-primary">
                            <td>Primary</td>
                            <td>Joe</td>
                            <td>joe@example.com</td>
                          </tr>
                          <tr class="table-success">
                            <td>Success</td>
                            <td>Doe</td>
                            <td>john@example.com</td>
                          </tr>
                          <tr class="table-danger">
                            <td>Danger</td>
                            <td>Moe</td>
                            <td>mary@example.com</td>
                          </tr>
                          <tr class="table-info">
                            <td>Info</td>
                            <td>Dooley</td>
                            <td>july@example.com</td>
                          </tr>
                          <tr class="table-warning">
                            <td>Warning</td>
                            <td>Refs</td>
                            <td>bo@example.com</td>
                          </tr>
                          <tr class="table-active">
                            <td>Active</td>
                            <td>Activeson</td>
                            <td>act@example.com</td>
                          </tr>
                          <tr class="table-secondary">
                            <td>Secondary</td>
                            <td>Secondson</td>
                            <td>sec@example.com</td>
                          </tr>
                          <tr class="table-light">
                            <td>Light</td>
                            <td>Angie</td>
                            <td>angie@example.com</td>
                          </tr>
                          <tr class="table-dark text-dark">
                            <td>Dark</td>
                            <td>Bo</td>
                            <td>bo@example.com</td>
                          </tr>
                        </tbody>
                      </table>
                 </div>
             </div>
         </div>
         <div class="card">
             <div class="card-header" role="tab" id="dannyhead">
                 <h3 class="mb-0"><a class="collapsed" data-toggle="collapse" data-target="#danny">Dhanasekaran Witherspoon 
                 <small>Chief Food Officer</small></a></h3>
             </div>
             <div class="collapse" id="danny" data-parent="#accordion">
                 <div class="card-body">
                     <p class=" d-none d-sm-block">Our CFO, Danny, as he is affectionately referred to by his colleagues, comes from a long established family tradition in farming and produce. His experiences growing up on a farm in the Australian outback gave him great appreciation for varieties of food sources. As he puts it in his own words, <em>Everything that runs, wins, and everything that stays, pays!</em></p>
                 </div>
             </div>
         </div>
         <div class="card">
             <div class="card-header" role="tab" id="agumbehead">
                 <h3 class="mb-0"><a class="collapsed" data-toggle="collapse" data-target="#agumbe">Agumbe Tang 
                 <small>Chief Taste Officer</small></a></h3>
             </div>
             <div class="collapse" id="agumbe" data-parent="#accordion">
                 <div class="card-body">
                     <p class=" d-none d-sm-block">Blessed with the most discerning gustatory sense, Agumbe, our CTO, personally ensures that every dish that we serve meets his exacting tastes. Our chefs dread the tongue lashing that ensues if their dish does not meet his exacting standards. He lives by his motto, <em>You click only if you survive my lick.</em></p>
                 </div>
             </div>
         </div>
         <div class="card">
             <div class="card-header" role="tab" id="albertohead">
                 <h3 class="mb-0"><a class="collapsed" data-toggle="collapse" data-target="#alberto">Alberto Somayya 
                 <small>Executive Chef</small></a></h3>
             </div>
             <div class="collapse" id="alberto" data-parent="#accordion">
                 <div class="card-body">
                     <p class=" d-none d-sm-block">Award winning three-star Michelin chef with wide International experience having worked closely with whos-who in the culinary world, he specializes in creating mouthwatering Indo-Italian fusion experiences. He says, <em>Put together the cuisines from the two craziest cultures, and you get a winning hit! Amma Mia!</em></p>
                 </div>
             </div>
         </div>        
     </div>
 </div>
</body>
</html>
