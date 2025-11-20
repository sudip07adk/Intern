*** Variables ***
# Product Details Page Locators
${PRODUCT_TITLE}                        xpath://h2[@class='name']
${PRODUCT_PRICE}                        xpath://h3[@class='price-container']
${PRODUCT_DESCRIPTION}                  xpath://div[@class='row']//p
${PRODUCT_IMAGE}                        xpath://img[@id='imgbar']
${ADD_TO_CART_BUTTON}                   xpath://a[contains(text(), 'Add to cart')]
${PRODUCT_DETAILS_CONTAINER}            xpath://div[@class='container-lg']
${BACK_TO_PRODUCTS}                     xpath://a[contains(text(), 'Back to home')]