---
title: "PaymentAddress: thuộc tính region"
short-title: region
slug: Web/API/PaymentAddress/region
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.PaymentAddress.region
---

{{APIRef("Payment Request API")}}{{SecureContext_Header}}{{Deprecated_Header}}{{Non-standard_Header}}

Thuộc tính chỉ đọc **`region`** của giao diện {{domxref('PaymentAddress')}} trả về một chuỗi chứa phân khu hành chính cấp cao nhất của quốc gia nơi địa chỉ tọa lạc. Ví dụ, đây có thể là bang, tỉnh, oblast, hoặc tỉnh.

## Giá trị

Một chuỗi chỉ định phân khu hành chính cấp cao nhất trong quốc gia nơi địa chỉ tọa lạc. Vùng này có tên khác nhau ở các quốc gia khác nhau, chẳng hạn: bang, tỉnh, oblast, tỉnh, hoặc hạt.

## Ghi chú sử dụng

Ở một số quốc gia, như Bỉ, người ta thường không cung cấp vùng như một phần của địa chỉ bưu chính. Trong những trường hợp đó, trình duyệt trả về chuỗi rỗng làm giá trị của `region`. Tuy nhiên, địa chỉ vẫn có thể được chấp nhận để sử dụng cho mục đích dự kiến (ví dụ, để giao hàng). Tuy nhiên, hãy luôn xác minh địa chỉ để đảm bảo những gì người dùng cung cấp có thể sử dụng được.

## Tương thích trình duyệt

{{Compat}}
