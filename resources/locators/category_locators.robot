*** Variables ***
# Category Page Locators
${CATEGORY_HEADER}                      xpath://h4[@class='card-title']
${PRODUCT_CARDS}                        xpath://div[@class='col-lg-4']
${PRODUCT_NAME}                         xpath://a[@class='hrefch']
${PRODUCT_PRICE}                        xpath://h5[contains(text(), '$')]
${CATEGORY_ITEM}                        xpath://div[@id='tbodyid']//div[@class='col-lg-4']
${ADD_TO_CART_BTN}                      xpath://a[contains(text(), 'Add to cart')]
${PRODUCT_LINK}                         xpath://a[@class='hrefch']