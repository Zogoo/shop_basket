<template>
  <div class="top">
    <div class="container">
      <div class="row">
        <div class="col-sm-5 col-xs-12">
          <ul class="list-inline icon">
            <li>
              <!--language code start here-->
              <form method="post" enctype="multipart/form-data" id="language">
                <div class="btn-group">
                  <button
                    class="btn btn-link dropdown-toggle"
                    data-toggle="dropdown"
                    aria-expanded="false"
                  >
                    <span class="text"
                      ><i class="la la-language"></i>English</span
                    >
                    <i class="la la-caret-down"></i>
                  </button>
                  <ul
                    class="dropdown-menu dropdown-menu-right"
                    x-placement="bottom-end"
                    style="
                      position: absolute;
                      transform: translate3d(-61px, 25px, 0px);
                      top: 0px;
                      left: 0px;
                      will-change: transform;
                    "
                  >
                    <li>
                      <a href="javascript:;"
                        ><img
                          src="images/flag.jpg"
                          alt="english"
                          title="english"
                        />
                        English</a
                      >
                    </li>
                  </ul>
                </div>
              </form>
              <!--language code end here-->
            </li>
            <li>
              <a href="login.html"
                ><i class="la la-plus-square"></i> <span>Login</span></a
              >
            </li>
            <li>
              <a href="register.html"
                ><i class="la la-key"></i> <span>Register</span></a
              >
            </li>
          </ul>
        </div>
        <div class="col-md-7 col-sm-7 col-xs-12">
          <div class="topnav responsive" id="myTopnav">
            <ul class="list-inline">
              <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#"
                  >Home</a
                >
                <div class="dropdown-menu">
                  <div class="dropdown-inner">
                    <ul class="list-unstyled">
                      <li><a href="index.html">Homepage</a></li>
                    </ul>
                  </div>
                </div>
              </li>
              <li><a href="aboutus.html">About</a></li>
              <li class="dropdown">
                <a data-toggle="dropdown" href="#">Blog</a>
                <div class="dropdown-menu">
                  <div class="dropdown-inner">
                    <ul class="list-unstyled">
                      <li><a href="blog.html">Our Blog</a></li>
                      <li><a href="blogdetail.html">Blog Detail</a></li>
                    </ul>
                  </div>
                </div>
              </li>
              <li><a href="contactus.html">Contact</a></li>
              <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#"
                  >Pages</a
                >
                <div class="dropdown-menu">
                  <div class="dropdown-inner">
                    <ul class="list-unstyled">
                      <li><a href="faq.html">FAQ</a></li>
                      <li><a href="dashboard.html">Dashboard</a></li>
                      <li><a href="price_plan.html">Pricing Plans</a></li>
                      <li><a href="all_ads.html"> All Ads</a></li>
                      <li>
                        <a href="ads_single_view.html">Ads Single View</a>
                      </li>
                    </ul>
                  </div>
                </div>
              </li>
              <li>
                <a href="terms_and_conditions.html">Term &amp; Conditions</a>
              </li>
              <li>
                <a
                  href="javascript:void(0);"
                  class="icons"
                  onclick="myFunction()"
                  >☰</a
                >
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>