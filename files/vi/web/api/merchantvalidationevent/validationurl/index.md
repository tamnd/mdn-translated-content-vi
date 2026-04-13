---
title: "MerchantValidationEvent: thuộc tính validationURL"
short-title: validationURL
slug: Web/API/MerchantValidationEvent/validationURL
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.MerchantValidationEvent.validationURL
---

{{APIRef("Payment Request API")}}{{Deprecated_Header}}{{SecureContext_Header}}

Thuộc tính **`validationURL`** của {{domxref("MerchantValidationEvent")}} là một giá trị chuỗi chỉ đọc cung cấp URL từ đó tải dữ liệu dành riêng cho trình xử lý thanh toán cần thiết để xác thực người bán.

Dữ liệu này nên được truyền vào phương thức {{domxref("MerchantValidationEvent.complete", "complete()")}} để cho phép tác nhân người dùng hoàn tất giao dịch.

## Giá trị

Một chuỗi chỉ đọc cung cấp URL từ đó tải dữ liệu dành riêng cho trình xử lý thanh toán cần thiết để hoàn tất quy trình xác minh người bán. Sau khi tải xong, dữ liệu này nên được truyền vào {{domxref("MerchantValidationEvent.complete", "complete()")}}, trực tiếp hoặc thông qua promise.

Xem [Xác thực người bán](/en-US/docs/Web/API/Payment_Request_API/Concepts#merchant_validation) để tìm hiểu thêm về quy trình.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Payment Request API](/en-US/docs/Web/API/Payment_Request_API)
- [Sử dụng Payment Request API](/en-US/docs/Web/API/Payment_Request_API/Using_the_Payment_Request_API)
- [Khái niệm xử lý thanh toán](/en-US/docs/Web/API/Payment_Request_API/Concepts)
