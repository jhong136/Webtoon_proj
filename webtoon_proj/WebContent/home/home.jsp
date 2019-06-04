<%@ page language="java" contentType="text/html; charset= UTF-8"
    pageEncoding="UTF-8"%>
    <head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">메뉴</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="home.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          웹툰보기 
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="../reader/rChooseDay.jsp">요일선택</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link"  onclick="button0_click();">도전웹툰</a>
      </li>
      <li class="nav-item">
        <a class="nav-link"  onclick="button1_click();">코인구매</a>
      </li>
      <li class="nav-item">
      <!-- 마이페이지에 들어가면 회원정보가 보임 -->
        <a class="nav-link"  onclick="button2_click();" >마이페이지</a>
      </li>
    </ul>
    <!-- 아래는 로그인된 화면  -->
    <div style = "flaot:right"> 
    <%  if(session.getAttribute("sessionid") != null) { %>
      &nbsp; &nbsp;  &nbsp; <%= session.getAttribute("sessionid") %> 님&nbsp; &nbsp;  <% } 
      else { %>
      로그아웃상태&nbsp; &nbsp; 
      <% } %>
     </div>
     
     <!--로그인상태일 땐 logout버튼이 나타나게, 로그아웃상태일때는 login버튼이 나타나게 한다 -->
	<% if(session.getAttribute("sessionid") != null){ %>
	 <button type="button" class="btn btn-lg btn-primary" onclick="button3_click();" >logout</button>
	 
	<% } else {%>
	
	 <button type="button" class="btn btn-lg btn-primary" onclick="button4_click();" >login</button>
	 
	<% } %>
  </div>
</nav>

<!--

//-->
</script>

<script>

function button0_click() {
	<%if (session.getAttribute("sessionid") == null){ //로그인이 안돼있으면%>
		alert("로그인 후 이용 가능합니다!");
		location.href = "home.jsp"
		 
		<%  }  else{%> 
		location.href = "../reader/rShowCtList.jsp" 
		<% }%>
}

<!--코인구매 메뉴 클릭했을 때 -->

function button1_click() { 
	<%if (session.getAttribute("sessionid") == null){ //로그인이 안돼있으면%>
	alert("로그인 후 이용 가능합니다!");
	 location.href = "home.jsp"//코인구매화면으로 넘어가지 않고 홈화면으로 감
	 
	<%  }  else{%> //로그인하면 코인구매화면으로 넘어간다 
	location.href = "../reader/buy_coin.jsp" 
	<% }%>
	
}

function button2_click() { 
	<%if (session.getAttribute("sessionid") == null){ //로그인이 안돼있으면%>
	alert("로그인 후 이용 가능합니다!");
	 location.href = "home.jsp"//넘어가지 않고 홈화면으로 감
	 
	<%  }  else{%> //로그인하면 마이페이지로 
	location.href = "myPage.jsp" 
	<% }%>
	
}
</script>


<script>

function button3_click() { 
	 location.href = "logout.jsp"
}

function button4_click() { 
	 location.href = "login.jsp"
}
</script>

<br><br>
<div class="jumbotron">
  <h1 class="display-4">웹툰 사이트에 오신 것을 환영합니다.</h1>
  <p class="lead">다양한 웹툰을 무료로 감상할 수 있습니다. 일부 웹툰은 유료로 제공됩니다. 유료 웹툰은 코인을 구매하여 볼 수 있습니다.</p>
  <hr class="my-4">
  <p>아직 회원가입을 하지 않으셨다면 아래 버튼을 눌러 회원가입을 하세요!</p>
  <a class="btn btn-primary btn-lg" href="loginForm.jsp" role="button">회원가입</a>
</div>

<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="../image/웹툰보러가기.jpg" class="d-block w-100"  alt="코인구매하기">
    </div>
    <div class="carousel-item">
      <img src="../image/보너스코인지급.jpg" class="d-block w-100" alt="웹툰보러가기">
    </div>
    <div class="carousel-item">
      <img src="../image/도전웹툰.jpg" class="d-block w-100" alt="...">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>