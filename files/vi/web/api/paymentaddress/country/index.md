---
title: "PaymentAddress: thuộc tính country"
short-title: country
slug: Web/API/PaymentAddress/country
page-type: web-api-instance-property
status:
  - deprecated
  - non-standard
browser-compat: api.PaymentAddress.country
---

{{APIRef("Payment Request API")}}{{SecureContext_Header}}{{Deprecated_Header}}{{Non-standard_Header}}

Thuộc tính chỉ đọc **`country`** của giao diện {{domxref('PaymentAddress')}} là một chuỗi xác định quốc gia của địa chỉ bằng cách sử dụng tiêu chuẩn [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2). Chuỗi luôn ở dạng chữ hoa chuẩn.

Một số ví dụ về giá trị `country` hợp lệ: `"US"`, `"GB"`, `"CN"`, hoặc `"JP"`.

## Giá trị

Một chuỗi chứa mã ISO3166-1 alpha-2 xác định quốc gia nơi địa chỉ tọa lạc, hoặc chuỗi rỗng nếu không có quốc gia, thường có thể được giả định là "cùng quốc gia với chủ trang web."

## Ghi chú sử dụng

Nếu trình xử lý thanh toán xác thực địa chỉ và xác định rằng giá trị của `country` không hợp lệ, một lệnh gọi đến {{domxref("PaymentRequestUpdateEvent.updateWith()")}} sẽ được thực hiện với đối tượng `details` chứa trường `shippingAddressErrors`. Trường đó chứa một đối tượng có thuộc tính `country` là một chuỗi cho biết lỗi xác thực đã xảy ra và, nếu có thể, gợi ý về cách sửa nó.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using the Payment Request API](/en-US/docs/Web/API/Payment_Request_API/Using_the_Payment_Request_API)
- {{domxref("PaymentRequestUpdateEvent.updateWith")}}
