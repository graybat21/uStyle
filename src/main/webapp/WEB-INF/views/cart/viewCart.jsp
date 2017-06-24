<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        
	<body class=" checkout-cart-index ">
    	
        <div class="wrapper">
            <noscript>
                <div class="global-site-notice noscript">
                    <div class="notice-inner">
                        <p> <strong>JavaScript seems to be disabled in your browser.</strong>
                            <br /> You must have JavaScript enabled in your browser to utilize the functionality of this website.</p>
                    </div>
                </div>
            </noscript>

            <div class="page one-column">

                
                <div class="wrapper-breadcrums">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-24">
                                <div class="breadcrumbs">
                                    <ul>
                                        <li class="home"> <a href="/" title="Go to Home Page"><span >Home</span></a> <span class="separator">/ </span>
                                        </li>
                                        <li class="cms_page"> <strong>Shopping Cart</strong>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!-- /.wrapper-breadcrums -->

                <div class="em-wrapper-main">
                    <div class="container container-main">
                        <div class="em-inner-main">
                            <div class="em-wrapper-area02"></div>
                            <div class="em-main-container em-col1-layout">
                                <div class="row">
                                    <div class="em-col-main col-sm-24">
                                        <div class="cart">
                                            <div class="page-title title-buttons">
                                                <h1>Shopping Cart</h1>
                                                <ul class="checkout-types">
                                                    <li>
                                                        <button type="button" title="Proceed to Checkout" class="button btn-proceed-checkout btn-checkout"><span><span>Proceed to Checkout</span></span>
                                                        </button>
                                                    </li>
                                                </ul>
                                            </div><!-- /.page-title -->
                                            <form method="post">
                                                <input name="form_key" type="hidden" value="inYgLvzSpOOWWVoP" />
                                                <fieldset>
                                                    <table id="shopping-cart-table" class="data-table cart-table">
                                                        <thead>
                                                            <tr class="em-block-title">
                                                                <th><span class="nobr">Product Name</span>
                                                                </th>
                                                                <th>&nbsp;</th>
                                                                <th></th>
                                                                <th class="a-center"><span class="nobr">Move to Wishlist</span>
                                                                </th>
                                                                <th class="a-center" colspan="1"><span class="nobr">Unit Price</span>
                                                                </th>
                                                                <th class="a-center">Qty</th>
                                                                <th class="a-center last" colspan="1">Subtotal</th>
                                                            </tr>
                                                        </thead>
                                                        <tfoot>
                                                            <tr>
                                                                <td colspan="7" class="a-right">
                                                                    <button type="button" title="Continue Shopping" class="button btn-continue"><span><span>Continue Shopping</span></span>
                                                                    </button>
                                                                    <button type="submit" name="update_cart_action" value="update_qty" title="Update Shopping Cart" class="button btn-update"><span><span>Update Shopping Cart</span></span>
                                                                    </button>
                                                                    <button type="submit" name="update_cart_action" value="empty_cart" title="Clear Shopping Cart" class="button btn-empty" id="empty_cart_button"><span><span>Clear Shopping Cart</span></span>
                                                                    </button>
                                                                </td>
                                                            </tr>
                                                        </tfoot>
                                                        <tbody>
                                                            <tr class="first odd">
                                                                <td>
                                                                    <div class="cart-product"><a href="#" title="Remove item" class="btn-remove btn-remove2">Remove item</a>
                                                                        <a href="product-detail.html" title=" baby dino baller graphic tee " class="product-image"><img src="images/product/100x100/thumbnail.jpg" width="100" alt=" baby dino baller graphic tee " />
                                                                        </a>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <h2 class="product-name"> <a href="product-detail.html"> baby dino baller graphic tee </a></h2>
                                                                    <p class="sku">Ba_7</p>
                                                                </td>
                                                                <td class="a-center"> <a href="#" title="Edit item parameters">Edit</a>
                                                                </td>
                                                                <td class="a-center"> <a href="#" class="link-wishlist use-ajax" title="Move">Move</a>
                                                                </td>
                                                                <td class="a-center"> <span class="cart-price"> <span class="price">$4.85</span> </span>
                                                                </td>
                                                                <td class="a-center">
                                                                    <div class="qty_cart">
                                                                        <div class="qty-ctl">
                                                                            <button title="Decrease Qty" onclick="qtyDown(296); return false;" class="decrease">decrease</button>
                                                                        </div>
                                                                        <input id="cart[296][qty]" name="cart[296][qty]" value="1" size="4" title="Qty" class="input-text qty" maxlength="12" />
                                                                        <div class="qty-ctl">
                                                                            <button title="Increase Qty" onclick="qtyUp(296); return false;" class="increase">increase</button>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                                <td class="a-center last"> <span class="cart-price"> <span class="price">$4.85</span> </span>
                                                                </td>
                                                            </tr>
                                                            <tr class="last even">
                                                                <td>
                                                                    <div class="cart-product"><a href="#" title="Remove item" class="btn-remove btn-remove2">Remove item</a>
                                                                        <a href="product-detail.html" title=" Mommy's little sunshine graphic tee " class="product-image"><img src="images/product/100x100/thumbnail.jpg" width="100" alt=" Mommy's little sunshine graphic tee " />
                                                                        </a>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <h2 class="product-name"> <a href="product-detail.html"> Mommy's little sunshine graphic tee </a></h2>
                                                                    <p class="sku">Ba_13</p>
                                                                </td>
                                                                <td class="a-center"> <a href="#" title="Edit item parameters">Edit</a>
                                                                </td>
                                                                <td class="a-center"> <a href="#" class="link-wishlist use-ajax" title="Move">Move</a>
                                                                </td>
                                                                <td class="a-center"> <span class="cart-price"> <span class="price">$4.85</span> </span>
                                                                </td>
                                                                <td class="a-center">
                                                                    <div class="qty_cart">
                                                                        <div class="qty-ctl">
                                                                            <button title="Decrease Qty" onclick="qtyDown(302); return false;" class="decrease">decrease</button>
                                                                        </div>
                                                                        <input id="cart[302][qty]" name="cart[302][qty]" value="1" size="4" title="Qty" class="input-text qty" maxlength="12" />
                                                                        <div class="qty-ctl">
                                                                            <button title="Increase Qty" onclick="qtyUp(302); return false;" class="increase">increase</button>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                                <td class="a-center last"> <span class="cart-price"> <span class="price">$4.85</span> </span>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </fieldset>
                                            </form><!-- /form -->
                                            <div class="cart-collaterals row">
                                                <div class="first col-md-16 col-sm-24">
                                                    <div class="row">
                                                        <div class="col-sm-24 col-md-12">
                                                            <form id="discount-coupon-form" method="post">
                                                                <div class="discount em-box-cart">
                                                                    <h2>Discount Codes</h2>
                                                                    <div class="discount-form em-box">
                                                                        <label for="coupon_code">Enter your coupon code if you have one.</label>
                                                                        <input type="hidden" name="remove" id="remove-coupone" value="0" />
                                                                        <div class="input-box">
                                                                            <input class="input-text" id="coupon_code" name="coupon_code" value="" />
                                                                        </div>
                                                                        <div class="buttons-set">
                                                                            <button type="button" title="Apply Coupon" class="button" onclick="discountForm.submit(false)" value="Apply Coupon"><span><span>Apply Coupon</span></span>
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </form>
                                                        </div><!-- /.col-sm-24 -->
                                                        <div class="col-sm-24 col-md-12">
                                                            <div class="shipping em-box-cart">
                                                                <h2>Estimate Shipping and Tax</h2>
                                                                <div class="shipping-form em-box">
                                                                    <form method="post" id="shipping-zip-form">
                                                                        <p>Enter your destination to get a shipping estimate.</p>
                                                                        <ul class="form-list">
                                                                            <li>
                                                                                <label for="country" class="required"><em>*</em>Country</label>
                                                                                <div class="input-box">
                                                                                    <select name="country_id" id="country" class="validate-select" title="Country">
                                                                                        <option value="AF">Afghanistan</option>
                                                                                        <option value="AX">Åland Islands</option>
                                                                                        <option value="AL">Albania</option>
                                                                                        <option value="DZ">Algeria</option>
                                                                                        <option value="AS">American Samoa</option>
                                                                                        <option value="AD">Andorra</option>
                                                                                        <option value="AO">Angola</option>
                                                                                        <option value="AI">Anguilla</option>
                                                                                        <option value="AQ">Antarctica</option>
                                                                                        <option value="AG">Antigua and Barbuda</option>
                                                                                        <option value="AR">Argentina</option>
                                                                                        <option value="AM">Armenia</option>
                                                                                        <option value="AW">Aruba</option>
                                                                                        <option value="AU">Australia</option>
                                                                                        <option value="AT">Austria</option>
                                                                                        <option value="AZ">Azerbaijan</option>
                                                                                        <option value="BS">Bahamas</option>
                                                                                        <option value="BH">Bahrain</option>
                                                                                        <option value="BD">Bangladesh</option>
                                                                                        <option value="BB">Barbados</option>
                                                                                        <option value="BY">Belarus</option>
                                                                                        <option value="BE">Belgium</option>
                                                                                        <option value="BZ">Belize</option>
                                                                                        <option value="BJ">Benin</option>
                                                                                        <option value="BM">Bermuda</option>
                                                                                        <option value="BT">Bhutan</option>
                                                                                        <option value="BO">Bolivia</option>
                                                                                        <option value="BA">Bosnia and Herzegovina</option>
                                                                                        <option value="BW">Botswana</option>
                                                                                        <option value="BV">Bouvet Island</option>
                                                                                        <option value="BR">Brazil</option>
                                                                                        <option value="IO">British Indian Ocean Territory</option>
                                                                                        <option value="VG">British Virgin Islands</option>
                                                                                        <option value="BN">Brunei</option>
                                                                                        <option value="BG">Bulgaria</option>
                                                                                        <option value="BF">Burkina Faso</option>
                                                                                        <option value="BI">Burundi</option>
                                                                                        <option value="KH">Cambodia</option>
                                                                                        <option value="CM">Cameroon</option>
                                                                                        <option value="CA">Canada</option>
                                                                                        <option value="CV">Cape Verde</option>
                                                                                        <option value="KY">Cayman Islands</option>
                                                                                        <option value="CF">Central African Republic</option>
                                                                                        <option value="TD">Chad</option>
                                                                                        <option value="CL">Chile</option>
                                                                                        <option value="CN">China</option>
                                                                                        <option value="CX">Christmas Island</option>
                                                                                        <option value="CC">Cocos (Keeling) Islands</option>
                                                                                        <option value="CO">Colombia</option>
                                                                                        <option value="KM">Comoros</option>
                                                                                        <option value="CG">Congo - Brazzaville</option>
                                                                                        <option value="CD">Congo - Kinshasa</option>
                                                                                        <option value="CK">Cook Islands</option>
                                                                                        <option value="CR">Costa Rica</option>
                                                                                        <option value="CI">Côte d’Ivoire</option>
                                                                                        <option value="HR">Croatia</option>
                                                                                        <option value="CU">Cuba</option>
                                                                                        <option value="CY">Cyprus</option>
                                                                                        <option value="CZ">Czech Republic</option>
                                                                                        <option value="DK">Denmark</option>
                                                                                        <option value="DJ">Djibouti</option>
                                                                                        <option value="DM">Dominica</option>
                                                                                        <option value="DO">Dominican Republic</option>
                                                                                        <option value="EC">Ecuador</option>
                                                                                        <option value="EG">Egypt</option>
                                                                                        <option value="SV">El Salvador</option>
                                                                                        <option value="GQ">Equatorial Guinea</option>
                                                                                        <option value="ER">Eritrea</option>
                                                                                        <option value="EE">Estonia</option>
                                                                                        <option value="ET">Ethiopia</option>
                                                                                        <option value="FK">Falkland Islands</option>
                                                                                        <option value="FO">Faroe Islands</option>
                                                                                        <option value="FJ">Fiji</option>
                                                                                        <option value="FI">Finland</option>
                                                                                        <option value="FR">France</option>
                                                                                        <option value="GF">French Guiana</option>
                                                                                        <option value="PF">French Polynesia</option>
                                                                                        <option value="TF">French Southern Territories</option>
                                                                                        <option value="GA">Gabon</option>
                                                                                        <option value="GM">Gambia</option>
                                                                                        <option value="GE">Georgia</option>
                                                                                        <option value="DE">Germany</option>
                                                                                        <option value="GH">Ghana</option>
                                                                                        <option value="GI">Gibraltar</option>
                                                                                        <option value="GR">Greece</option>
                                                                                        <option value="GL">Greenland</option>
                                                                                        <option value="GD">Grenada</option>
                                                                                        <option value="GP">Guadeloupe</option>
                                                                                        <option value="GU">Guam</option>
                                                                                        <option value="GT">Guatemala</option>
                                                                                        <option value="GG">Guernsey</option>
                                                                                        <option value="GN">Guinea</option>
                                                                                        <option value="GW">Guinea-Bissau</option>
                                                                                        <option value="GY">Guyana</option>
                                                                                        <option value="HT">Haiti</option>
                                                                                        <option value="HM">Heard &amp; McDonald Islands</option>
                                                                                        <option value="HN">Honduras</option>
                                                                                        <option value="HK">Hong Kong SAR China</option>
                                                                                        <option value="HU">Hungary</option>
                                                                                        <option value="IS">Iceland</option>
                                                                                        <option value="IN">India</option>
                                                                                        <option value="ID">Indonesia</option>
                                                                                        <option value="IR">Iran</option>
                                                                                        <option value="IQ">Iraq</option>
                                                                                        <option value="IE">Ireland</option>
                                                                                        <option value="IM">Isle of Man</option>
                                                                                        <option value="IL">Israel</option>
                                                                                        <option value="IT">Italy</option>
                                                                                        <option value="JM">Jamaica</option>
                                                                                        <option value="JP">Japan</option>
                                                                                        <option value="JE">Jersey</option>
                                                                                        <option value="JO">Jordan</option>
                                                                                        <option value="KZ">Kazakhstan</option>
                                                                                        <option value="KE">Kenya</option>
                                                                                        <option value="KI">Kiribati</option>
                                                                                        <option value="KW">Kuwait</option>
                                                                                        <option value="KG">Kyrgyzstan</option>
                                                                                        <option value="LA">Laos</option>
                                                                                        <option value="LV">Latvia</option>
                                                                                        <option value="LB">Lebanon</option>
                                                                                        <option value="LS">Lesotho</option>
                                                                                        <option value="LR">Liberia</option>
                                                                                        <option value="LY">Libya</option>
                                                                                        <option value="LI">Liechtenstein</option>
                                                                                        <option value="LT">Lithuania</option>
                                                                                        <option value="LU">Luxembourg</option>
                                                                                        <option value="MO">Macau SAR China</option>
                                                                                        <option value="MK">Macedonia</option>
                                                                                        <option value="MG">Madagascar</option>
                                                                                        <option value="MW">Malawi</option>
                                                                                        <option value="MY">Malaysia</option>
                                                                                        <option value="MV">Maldives</option>
                                                                                        <option value="ML">Mali</option>
                                                                                        <option value="MT">Malta</option>
                                                                                        <option value="MH">Marshall Islands</option>
                                                                                        <option value="MQ">Martinique</option>
                                                                                        <option value="MR">Mauritania</option>
                                                                                        <option value="MU">Mauritius</option>
                                                                                        <option value="YT">Mayotte</option>
                                                                                        <option value="MX">Mexico</option>
                                                                                        <option value="FM">Micronesia</option>
                                                                                        <option value="MD">Moldova</option>
                                                                                        <option value="MC">Monaco</option>
                                                                                        <option value="MN">Mongolia</option>
                                                                                        <option value="ME">Montenegro</option>
                                                                                        <option value="MS">Montserrat</option>
                                                                                        <option value="MA">Morocco</option>
                                                                                        <option value="MZ">Mozambique</option>
                                                                                        <option value="MM">Myanmar (Burma)</option>
                                                                                        <option value="NA">Namibia</option>
                                                                                        <option value="NR">Nauru</option>
                                                                                        <option value="NP">Nepal</option>
                                                                                        <option value="NL">Netherlands</option>
                                                                                        <option value="AN">Netherlands Antilles</option>
                                                                                        <option value="NC">New Caledonia</option>
                                                                                        <option value="NZ">New Zealand</option>
                                                                                        <option value="NI">Nicaragua</option>
                                                                                        <option value="NE">Niger</option>
                                                                                        <option value="NG">Nigeria</option>
                                                                                        <option value="NU">Niue</option>
                                                                                        <option value="NF">Norfolk Island</option>
                                                                                        <option value="MP">Northern Mariana Islands</option>
                                                                                        <option value="KP">North Korea</option>
                                                                                        <option value="NO">Norway</option>
                                                                                        <option value="OM">Oman</option>
                                                                                        <option value="PK">Pakistan</option>
                                                                                        <option value="PW">Palau</option>
                                                                                        <option value="PS">Palestinian Territories</option>
                                                                                        <option value="PA">Panama</option>
                                                                                        <option value="PG">Papua New Guinea</option>
                                                                                        <option value="PY">Paraguay</option>
                                                                                        <option value="PE">Peru</option>
                                                                                        <option value="PH">Philippines</option>
                                                                                        <option value="PN">Pitcairn Islands</option>
                                                                                        <option value="PL">Poland</option>
                                                                                        <option value="PT">Portugal</option>
                                                                                        <option value="PR">Puerto Rico</option>
                                                                                        <option value="QA">Qatar</option>
                                                                                        <option value="RE">Réunion</option>
                                                                                        <option value="RO">Romania</option>
                                                                                        <option value="RU">Russia</option>
                                                                                        <option value="RW">Rwanda</option>
                                                                                        <option value="BL">Saint Barthélemy</option>
                                                                                        <option value="SH">Saint Helena</option>
                                                                                        <option value="KN">Saint Kitts and Nevis</option>
                                                                                        <option value="LC">Saint Lucia</option>
                                                                                        <option value="MF">Saint Martin</option>
                                                                                        <option value="PM">Saint Pierre and Miquelon</option>
                                                                                        <option value="WS">Samoa</option>
                                                                                        <option value="SM">San Marino</option>
                                                                                        <option value="ST">São Tomé and Príncipe</option>
                                                                                        <option value="SA">Saudi Arabia</option>
                                                                                        <option value="SN">Senegal</option>
                                                                                        <option value="RS">Serbia</option>
                                                                                        <option value="SC">Seychelles</option>
                                                                                        <option value="SL">Sierra Leone</option>
                                                                                        <option value="SG">Singapore</option>
                                                                                        <option value="SK">Slovakia</option>
                                                                                        <option value="SI">Slovenia</option>
                                                                                        <option value="SB">Solomon Islands</option>
                                                                                        <option value="SO">Somalia</option>
                                                                                        <option value="ZA">South Africa</option>
                                                                                        <option value="GS">South Georgia &amp; South Sandwich Islands</option>
                                                                                        <option value="KR">South Korea</option>
                                                                                        <option value="ES">Spain</option>
                                                                                        <option value="LK">Sri Lanka</option>
                                                                                        <option value="VC">St. Vincent &amp; Grenadines</option>
                                                                                        <option value="SD">Sudan</option>
                                                                                        <option value="SR">Suriname</option>
                                                                                        <option value="SJ">Svalbard and Jan Mayen</option>
                                                                                        <option value="SZ">Swaziland</option>
                                                                                        <option value="SE">Sweden</option>
                                                                                        <option value="CH">Switzerland</option>
                                                                                        <option value="SY">Syria</option>
                                                                                        <option value="TW">Taiwan</option>
                                                                                        <option value="TJ">Tajikistan</option>
                                                                                        <option value="TZ">Tanzania</option>
                                                                                        <option value="TH">Thailand</option>
                                                                                        <option value="TL">Timor-Leste</option>
                                                                                        <option value="TG">Togo</option>
                                                                                        <option value="TK">Tokelau</option>
                                                                                        <option value="TO">Tonga</option>
                                                                                        <option value="TT">Trinidad and Tobago</option>
                                                                                        <option value="TN">Tunisia</option>
                                                                                        <option value="TR">Turkey</option>
                                                                                        <option value="TM">Turkmenistan</option>
                                                                                        <option value="TC">Turks and Caicos Islands</option>
                                                                                        <option value="TV">Tuvalu</option>
                                                                                        <option value="UG">Uganda</option>
                                                                                        <option value="UA">Ukraine</option>
                                                                                        <option value="AE">United Arab Emirates</option>
                                                                                        <option value="GB">United Kingdom</option>
                                                                                        <option value="US" selected="selected">United States</option>
                                                                                        <option value="UY">Uruguay</option>
                                                                                        <option value="UM">U.S. Outlying Islands</option>
                                                                                        <option value="VI">U.S. Virgin Islands</option>
                                                                                        <option value="UZ">Uzbekistan</option>
                                                                                        <option value="VU">Vanuatu</option>
                                                                                        <option value="VA">Vatican City</option>
                                                                                        <option value="VE">Venezuela</option>
                                                                                        <option value="VN">Vietnam</option>
                                                                                        <option value="WF">Wallis and Futuna</option>
                                                                                        <option value="EH">Western Sahara</option>
                                                                                        <option value="YE">Yemen</option>
                                                                                        <option value="ZM">Zambia</option>
                                                                                        <option value="ZW">Zimbabwe</option>
                                                                                    </select>
                                                                                </div><!-- /.input-box -->
                                                                            </li>
                                                                            <li>
                                                                                <label for="region_id">State/Province</label>
                                                                                <div class="input-box">
                                                                                    <select id="region_id" name="region_id" title="State/Province" style="display:none;">
                                                                                        <option value="">Please select region, state or province</option>
                                                                                    </select>
                                                                                    <input type="text" id="region" name="region" value="" title="State/Province" class="input-text" style="display:none;" />
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <label for="postcode">Zip/Postal Code</label>
                                                                                <div class="input-box">
                                                                                    <input class="input-text validate-postcode" type="text" id="postcode" name="estimate_postcode" value="" />
                                                                                </div>
                                                                            </li>
                                                                        </ul>
                                                                        <div class="buttons-set">
                                                                            <button type="button" title="Get a Quote" class="button"><span><span>Get a Quote</span></span>
                                                                            </button>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div><!-- /.shipping -->
                                                        </div><!-- /.col-sm-24 -->
                                                    </div>
                                                </div><!-- /first -->
                                                <div class="last totals col-md-8 col-sm-24">
                                                    <div class="em-box-cart">
                                                        <h2>Order Total</h2>
                                                        <div class="em-box">
                                                            <table id="shopping-cart-totals-table">
                                                                <col />
                                                                <col style="width: 1%;" />
                                                                <tfoot>
                                                                    <tr>
                                                                        <td style="" class="a-right" colspan="1"> <strong>Grand Total</strong>
                                                                        </td>
                                                                        <td style="" class="a-right"> <strong><span class="price">$9.70</span></strong>
                                                                        </td>
                                                                    </tr>
                                                                </tfoot>
                                                                <tbody>
                                                                    <tr>
                                                                        <td style="" class="a-right" colspan="1"> Subtotal</td>
                                                                        <td style="" class="a-right"> <span class="price">$9.70</span>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                            <ul class="checkout-types">
                                                                <li>
                                                                    <button type="button" title="Proceed to Checkout" class="button btn-proceed-checkout btn-checkout"><span><span>Proceed to Checkout</span></span>
                                                                    </button>
                                                                </li>
                                                                <li><a href="checkout.html" title="Checkout with Multiple Addresses">Checkout with Multiple Addresses</a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div><!-- /.em-box-cart -->
                                                </div><!-- /.last -->
                                            </div><!-- /.cart-collaterals -->
                                            <div class="block block-sample em-line-01">
                                                <div class="em-block-title">
                                                    <h2><span>This is sample static block replacing crosssel products</span></h2>
                                                </div>
                                                <div class="block-content box">
                                                    <p>This is sample static block replacing crosssel products. Put your own content here: filter widget,text, html, images - whatever you want.</p>
                                                </div>
                                            </div><!-- /.block -->
                                        </div>
                                    </div>
                                </div>
                            </div><!-- /.em-main-container -->
                        </div>
                    </div>
                </div><!-- /.em-wrapper-main -->

                

                <div class="em-wrapper-footer">
                    <div class="em-footer-style07">
                        <div class="em-footer-top">
                            <div class="container">
                                <div class="row">
                                    <div class="col-sm-24">
                                        <div class="em-footer-info">
                                            <div class="row">
                                                <div class="col-sm-24">
                                                    <div class=" four-block-middle">
                                                        <div class="row">
                                                            <div class="col-sm-6">
                                                                <div class="em-block-title" data-collapse-target="#collapse01">
                                                                    <p class="h4 em-text-upercase"><span>About Us</span>
                                                                    </p>
                                                                </div>
                                                                <div id="collapse01" class="em-block-content block-info">
                                                                    <p class="em-info">Skort Maison Martin Margiela knot ponytail cami texture as tucked t-shirt. <em>Black skirt razor pleats plaited gold collar</em>. Crop 90s spearmint indigo seam luxe washed out.</p>
                                                                    <p class="em-social"><a class="em-social-icon em-facebook f-left" title="em-sample-title" href="#"><span class="fa fa-fw"></span></a> <a class="em-social-icon em-twitter f-left" title="em-sample-title" href="#"><span class="fa fa-fw"></span></a> <a class="em-social-icon em-pinterest  f-left" title="em-sample-title" href="#"><span class="fa fa-fw"></span></a> <a class="em-social-icon em-google f-left" title="em-sample-title" href="#"><span class="fa fa-fw"></span></a> <a class="em-social-icon em-rss  f-left" title="em-sample-title" href="#"><span class="fa fa-fw"></span></a>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-6">
                                                                <div class="em-block-title" data-collapse-target="#collapse02">
                                                                    <p class="h4 em-text-upercase"><span>Newsletter</span>
                                                                    </p>
                                                                </div>
                                                                <div id="collapse02" class="em-block-content">
                                                                    <div class="em-newsletter-style04 newsletter-clearbutton">
                                                                        <div class="block block-subscribe">
                                                                            <form method="post" id="em-newsletter-validate-detail-style02">
                                                                                <div class="block-content">
                                                                                    <div class="form-subscribe-content">
                                                                                        <div class="input-box">
                                                                                            <input type="text" name="email" id="em-newsletter-style02" title="Sign up for our newsletter" class="input-text required-entry validate-email" placeholder="Sign up for your email ..." />
                                                                                        </div>
                                                                                        <div class="actions">
                                                                                            <button type="submit" title="Subscribe" class="button"><span><span>Subscribe</span></span>
                                                                                            </button>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </form>
                                                                        </div>
                                                                    </div>
                                                                </div><!-- /#collapse02 -->
                                                            </div>
                                                            <div class="col-sm-6">
                                                                <div class="em-block-title" data-collapse-target="#collapse03">
                                                                    <p class="h4 em-text-upercase"><span>Useful Links</span>
                                                                    </p>
                                                                </div>
                                                                <div id="collapse03" class="em-block-content">
                                                                    <div class="row">
                                                                        <div class="col-sm-12">
                                                                            <ul class="em-links">
                                                                                <li class="em-links-item"><a title="em-sample-title" href="#"><span>Contact Us</span></a>
                                                                                </li>
                                                                                <li class="em-links-item"><a title="em-sample-title" href="#"><span>About Us</span></a>
                                                                                </li>
                                                                                <li class="em-links-item"><a title="em-sample-title" href="#"><span>Sitemap</span></a>
                                                                                </li>
                                                                                <li class="em-links-item"><a title="em-sample-title" href="#"><span>Term &amp; Conditions</span></a>
                                                                                </li>
                                                                            </ul>
                                                                        </div>
                                                                        <div class="col-sm-12">
                                                                            <ul class="em-links">
                                                                                <li class="em-links-item"><a title="em-sample-title" href="#"><span>My Orders</span></a>
                                                                                </li>
                                                                                <li class="em-links-item"><a title="em-sample-title" href="#"><span>My Credit Slips</span></a>
                                                                                </li>
                                                                                <li class="em-links-item"><a title="em-sample-title" href="#"><span>My Addresses</span></a>
                                                                                </li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                </div><!-- /#collapse03 -->
                                                            </div>
                                                            <div class="col-sm-6">
                                                                <div class="em-block-title" data-collapse-target="#collapse04">
                                                                    <p class="h4 em-text-upercase"><span>Tags</span>
                                                                    </p>
                                                                </div>
                                                                <div id="collapse04" class="em-block-content">
                                                                    <ul class="em-tags-list">
                                                                        <li class="em-tags-item"><a title="em-sample-title" href="#"><span>awesome</span></a>
                                                                        </li>
                                                                        <li class="em-tags-item"><a title="em-sample-title" href="#"><span>nice</span></a>
                                                                        </li>
                                                                        <li class="em-tags-item"><a title="em-sample-title" href="#"><span>beautiful</span></a>
                                                                        </li>
                                                                        <li class="em-tags-item"><a title="em-sample-title" href="#"><span>love</span></a>
                                                                        </li>
                                                                        <li class="em-tags-item"><a title="em-sample-title" href="#"><span>like</span></a>
                                                                        </li>
                                                                        <li class="em-tags-item"><a title="em-sample-title" href="#"><span>emthemes</span></a>
                                                                        </li>
                                                                    </ul>
                                                                </div><!-- /#collapse04 -->
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div><!-- /.em-footer-top -->
                        <div class="em-footer-bottom">
                            <div class="container">
                                <div class="row">
                                    <div class="col-sm-24">
                                        <div class="em-footer-address"> <address class="f-left">&copy; 2015 EM0131 Everything Demo Store. All Rights Reserved.<span>HTML Templates by <a href="http://www.emthemes.com/responsive-magento-themes.html" title="Responsive HTML Themes &amp; Responsive HTML Templates">htmlcooker.com</a></span></address>
                                        </div>
                                        <div class="em-payment-method f-right">
                                            <div class="em-payment f-right"><a class="em-payment-icon em-visa" title="em-sample-title" href="#">visa</a> <a class="em-payment-icon em-master" title="em-sample-title" href="#">master</a> <a class="em-payment-icon em-express " title="em-sample-title" href="#">express</a><a class="em-payment-icon em-paypal" title="em-sample-title" href="#">paypal</a> <a class="em-payment-icon em-other " title="em-sample-title" href="#">other</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-24">
                                        <ul class="links">
                                            <li class="first"><a href="#" title="Site Map">Site Map</a>
                                            </li>
                                            <li><a href="#" title="Search Terms">Search Terms</a>
                                            </li>
                                            <li><a href="#" title="Advanced Search">Advanced Search</a>
                                            </li>
                                            <li><a href="#" title="Orders and Returns">Orders and Returns</a>
                                            </li>
                                            <li class=" last"><a href="#" title="Contact Us">Contact Us</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div><!-- /.em-footer-bottom -->
                    </div>
                </div><!-- /.em-wrapper-footer -->
                
                <p id="back-top" style="display: none;"><a title="Top" href="#top">Top</a></p>

            </div><!-- /.page -->
            
        </div><!-- /.wrapper -->


        <script type="text/javascript">
            function qtyDown(id) {
                var qty_el = document.getElementById('cart[' + id + '][qty]');
                var qty = qty_el.value;
                if (!isNaN(qty) && qty > 1) {
                    qty_el.value--;
                }
                return false;
            }

            function qtyUp(id) {
                var qty_el = document.getElementById('cart[' + id + '][qty]');
                var qty = qty_el.value;
                if (!isNaN(qty)) {
                    qty_el.value++;
                }
                return false;
            }
        </script>

    </body>
</html>