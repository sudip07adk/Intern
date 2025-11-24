*** Variables ***
# Home Page Locators
${HOME_URL}                             https://www.demoblaze.com/
${NAV_BAR}                              id:navbarExample
${WELCOME_TEXT}                         xpath://a[@class='navbar-brand' and text()='PRODUCT STORE']
${CATEGORY_PHONES}                      xpath://a[contains(text(), 'Phones')]
${CATEGORY_LAPTOPS}                     xpath://a[contains(text(), 'Laptops')]
${CATEGORY_MONITORS}                    xpath://a[contains(text(), 'Monitors')]
${PRODUCT_LIST}                         xpath://div[@class='row']//div[@class='col-lg-4']
${PRODUCT_ITEM}                         xpath://h4[@class='card-title']/a
${FEATURED_PRODUCTS}                    xpath://div[@id='tbodyid']/div[contains(@class,'col-lg-4')]
${HOME_LOGO}                            xpath://a[@href='index.html']//img
${CONTACT_LINK}                         xpath://a[contains(text(), 'Contact')]
${ABOUT_LINK}                           xpath://a[contains(text(), 'About us')]
${CART_LINK}                            xpath://a[@id='cartur']