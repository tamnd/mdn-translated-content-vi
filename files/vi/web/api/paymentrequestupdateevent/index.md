---
title: PaymentRequestUpdateEvent
slug: Web/API/PaymentRequestUpdateEvent
page-type: web-api-interface
browser-compat: api.PaymentRequestUpdateEvent
---

{{securecontext_header}}{{APIRef("Payment Request API")}}

Giao diện **`PaymentRequestUpdateEvent`** được sử dụng cho các sự kiện được gửi đến một phiên bản {{domxref("PaymentRequest")}} khi các thay đổi được thực hiện đối với thông tin liên quan đến vận chuyển cho một {{domxref("PaymentRequest")}} đang chờ xử lý. Các sự kiện đó là:

- {{domxref("PaymentRequest.shippingaddresschange_event", "shippingaddresschange")}}
  - : Được gửi bất cứ khi nào người dùng thay đổi địa chỉ vận chuyển của họ.
- {{domxref("PaymentRequest.shippingoptionchange_event", "shippingoptionchange")}}
  - : Được gửi bất cứ khi nào người dùng thay đổi một tùy chọn vận chuyển.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("PaymentRequestUpdateEvent.PaymentRequestUpdateEvent()","PaymentRequestUpdateEvent()")}}
  - : Tạo một đối tượng `PaymentRequestUpdateEvent` mới.

## Thuộc tính phiên bản

_Chỉ cung cấp các thuộc tính kế thừa từ giao diện cha, {{domxref("Event")}}._

## Phương thức phiên bản

_Ngoài các phương thức kế thừa từ giao diện cha, {{domxref("Event")}}, `PaymentRequestUpdateEvent` cung cấp các phương thức sau:_

- {{domxref("PaymentRequestUpdateEvent.updateWith()")}}
  - : Nếu trình xử lý sự kiện xác định rằng thông tin được bao gồm trong yêu cầu thanh toán cần được thay đổi, hoặc cần thêm thông tin mới, nó gọi `updateWith()` với thông tin cần được thay thế hoặc thêm vào.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Payment Request API](/en-US/docs/Web/API/Payment_Request_API/Using_the_Payment_Request_API)
