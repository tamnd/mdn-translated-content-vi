---
title: "PaymentMethodChangeEvent: PaymentMethodChangeEvent() constructor"
short-title: PaymentMethodChangeEvent()
slug: Web/API/PaymentMethodChangeEvent/PaymentMethodChangeEvent
page-type: web-api-constructor
browser-compat: api.PaymentMethodChangeEvent.PaymentMethodChangeEvent
---

{{securecontext_header}}{{APIRef("Payment Request API")}}

Hàm khởi tạo **`PaymentMethodChangeEvent()`** tạo một đối tượng {{domxref("PaymentMethodChangeEvent")}} mới cung cấp chi tiết về sự kiện {{domxref("PaymentRequest.paymentmethodchange_event", "paymentmethodchange")}}.

## Cú pháp

```js-nolint
new PaymentMethodChangeEvent(type)
new PaymentMethodChangeEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi chứa tên sự kiện. Phân biệt chữ hoa chữ thường và các trình duyệt đặt giá trị là `paymentmethodchange`.
- `options` {{optional_inline}}
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có thể có các thuộc tính sau:
    - `methodName` {{optional_inline}}
      - : Một chuỗi chứa định danh phương thức thanh toán cho trình xử lý thanh toán đang được sử dụng. Mặc định là chuỗi rỗng.
    - `methodDetails` {{optional_inline}}
      - : Một đối tượng cung cấp thông tin cụ thể về phương thức thanh toán mô tả các thay đổi đã thực hiện đối với thanh toán, hoặc `null` nếu không có thông tin bổ sung nào có sẵn hoặc cần thiết. Mặc định là `null`.

### Giá trị trả về

Một đối tượng {{domxref("PaymentMethodChangeEvent")}} mới mô tả thay đổi đối với các tùy chọn được chỉ định cho phương thức thanh toán được đưa ra trong thuộc tính `methodName`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Payment Request API](/en-US/docs/Web/API/Payment_Request_API)
- [Sử dụng Payment Request API](/en-US/docs/Web/API/Payment_Request_API/Using_the_Payment_Request_API)
- [Khái niệm xử lý thanh toán](/en-US/docs/Web/API/Payment_Request_API/Concepts)
