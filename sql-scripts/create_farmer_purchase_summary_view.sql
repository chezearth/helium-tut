DO $$ BEGIN
  PERFORM __he_delete_table_or_view__('farmerpurchasesummary');
END $$;

CREATE MATERIALIZED VIEW farmerpurchasesummary AS
SELECT
  farmerpurchase._id_,
  current_date,
  purchasedon,
  quantity,
  unitprice,
  goodscost,
  discount,
  finalcost,
  paymentstatusupdatedon,
  paymentstatus,
  paymentid,
  stock.name AS stockname,
  stock.stockType as stocktype,
  farmer.firstname || ' ' || farmer.lastname AS farmername,
  farmer.mobilenumber AS farmermobilenumber,
  shop.shopcode AS shopcode,
  shap.name AS shopName
FROM farmerpurchase
LEFT JOIN stock ON farmerpurchase.stock_fk = stock._id_
LEFT JOIN farmer ON farmerpurchase.farmer_fk = farmer._id_
LEFT JOIN shop ON farmerpurchase.shop_fk = shop._id_;
