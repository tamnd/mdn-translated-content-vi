---
title: PaymentMethodChangeEvent
slug: Web/API/PaymentMethodChangeEvent
page-type: web-api-interface
browser-compat: api.PaymentMethodChangeEvent
---

{{securecontext_header}}{{APIRef("Payment Request API")}}

Giao diện **`PaymentMethodChangeEvent`** của [Payment Request API](/en-US/docs/Web/API/Payment_Request_API) mô tả sự kiện {{domxref("PaymentRequest/paymentmethodchange_event", "paymentmethodchange")}} được kích hoạt bởi một số trình xử lý thanh toán khi người dùng chuyển đổi phương tiện thanh toán (ví dụ, người dùng chọn một thẻ "cửa hàng" để mua hàng trong khi sử dụng Apple Pay).

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("PaymentMethodChangeEvent.PaymentMethodChangeEvent", "PaymentMethodChangeEvent()")}}
  - : Tạo và trả về một đối tượng `PaymentMethodChangeEvent` mới.

## Thuộc tính phiên bản

_Ngoài các thuộc tính bên dưới, giao diện này bao gồm các thuộc tính được kế thừa từ {{domxref("PaymentRequestUpdateEvent")}}._

- {{domxref("PaymentMethodChangeEvent.methodDetails", "methodDetails")}} {{ReadOnlyInline}}
  - : Một đối tượng chứa dữ liệu cụ thể về phương thức thanh toán hữu ích khi xử lý thay đổi phương thức thanh toán. Nếu không có thông tin nào như vậy, giá trị này là `null`.
- {{domxref("PaymentMethodChangeEvent.methodName", "methodName")}} {{ReadOnlyInline}}
  - : Một chuỗi chứa định danh phương thức thanh toán, là chuỗi xác định duy nhất một phương thức thanh toán cụ thể. Định danh này thường là URL được dùng trong quá trình thanh toán, nhưng cũng có thể là chuỗi không phải URL được chuẩn hóa như `basic-card`. Giá trị mặc định là chuỗi rỗng, `""`.

## Phương thức phiên bản

_Giao diện này bao gồm các phương thức được kế thừa từ {{domxref("PaymentRequestUpdateEvent")}}._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
