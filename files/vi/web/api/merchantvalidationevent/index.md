---
title: MerchantValidationEvent
slug: Web/API/MerchantValidationEvent
page-type: web-api-interface
status:
  - deprecated
browser-compat: api.MerchantValidationEvent
---

{{APIRef("Payment Request API")}}{{Deprecated_Header}}{{SecureContext_Header}}

Giao diện **`MerchantValidationEvent`** của [Payment Request API](/en-US/docs/Web/API/Payment_Request_API) cho phép người bán xác minh rằng họ được phép sử dụng một trình xử lý thanh toán cụ thể.

Tìm hiểu thêm về [xác thực người bán](/en-US/docs/Web/API/Payment_Request_API/Concepts#merchant_validation).

## Hàm khởi tạo

- {{domxref("MerchantValidationEvent.MerchantValidationEvent()","MerchantValidationEvent()")}} {{Deprecated_Inline}}
  - : Tạo một đối tượng `MerchantValidationEvent` mới mô tả sự kiện {{domxref("PaymentRequest.merchantvalidation_event", "merchantvalidation")}} sẽ được gửi đến trình xử lý thanh toán để yêu cầu xác thực người bán.

## Thuộc tính phiên bản

- {{domxref("MerchantValidationEvent.methodName")}} {{Deprecated_Inline}}
  - : Một chuỗi cung cấp định danh phương thức thanh toán duy nhất cho trình xử lý thanh toán yêu cầu xác thực. Đây có thể là một trong các chuỗi định danh phương thức thanh toán tiêu chuẩn hoặc URL vừa xác định vừa xử lý các yêu cầu cho trình xử lý thanh toán, chẳng hạn như `https://apple.com/apple-pay`.
- {{domxref("MerchantValidationEvent.validationURL")}} {{Deprecated_Inline}}
  - : Một chuỗi chỉ định URL từ đó trang web hoặc ứng dụng có thể tải thông tin xác thực dành riêng cho trình xử lý thanh toán. Sau khi dữ liệu này được truy xuất, dữ liệu (hoặc promise phân giải thành dữ liệu xác thực) nên được truyền vào {{domxref("MerchantValidationEvent.complete", "complete()")}} để xác thực rằng yêu cầu thanh toán đến từ người bán được ủy quyền.

## Phương thức phiên bản

- {{domxref("MerchantValidationEvent.complete()")}} {{Deprecated_Inline}}
  - : Truyền dữ liệu được truy xuất từ URL được chỉ định bởi {{domxref("MerchantValidationEvent.validationURL", "validationURL")}} vào `complete()` để hoàn tất quy trình xác thực cho {{domxref("PaymentRequest")}}.

## Tương thích trình duyệt

{{Compat}}
