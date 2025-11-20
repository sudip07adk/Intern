*** Variables ***
# Cart Page Locators
${CART_TABLE}                           xpath://table[@class='table table-striped']
${CART_ITEMS}                           xpath://tbody[@id='tbodyid']//tr
${ITEM_NAME}                            xpath://td[2]
${ITEM_PRICE}                           xpath://td[3]
${ITEM_TOTAL}                           xpath://td[4]
${REMOVE_ITEM_BTN}                      xpath://a[@class='btn btn-danger']
${TOTAL_PRICE}                          xpath://h3[@id='totalp']
${PLACE_ORDER_BTN}                      xpath://button[contains(text(), 'Place Order')]
${DELETE_BTN}                           xpath://a[@onclick='deleteItem(this)']

# Place Order Modal Locators
${ORDER_MODAL}                          xpath://div[@id='orderModal']
${ORDER_NAME_INPUT}                     xpath://input[@id='name']
${ORDER_COUNTRY_INPUT}                  xpath://input[@id='country']
${ORDER_CITY_INPUT}                     xpath://input[@id='city']
${ORDER_CARD_INPUT}                     xpath://input[@id='card']
${ORDER_MONTH_INPUT}                    xpath://input[@id='month']
${ORDER_YEAR_INPUT}                     xpath://input[@id='year']
${PURCHASE_BUTTON}                      xpath://button[contains(text(), 'Purchase')]
${CLOSE_MODAL_BTN}                      xpath://button[contains(text(), 'Close')]

# Success Modal Locators
${SUCCESS_MODAL}                        xpath://div[@class='sweet-alert showSweetAlert visible']
${SUCCESS_MESSAGE}                      xpath://h2[contains(text(), 'Thank you for your purchase!')]
${CONFIRM_OK_BTN}                       xpath://button[@class='confirm']