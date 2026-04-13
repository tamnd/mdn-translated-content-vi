---
title: "PaymentRequestEvent: hàm khởi tạo PaymentRequestEvent()"
short-title: PaymentRequestEvent()
slug: Web/API/PaymentRequestEvent/PaymentRequestEvent
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.PaymentRequestEvent.PaymentRequestEvent
---

{{APIRef("Web-Based Payment Handler API")}}{{SeeCompatTable}}{{AvailableInWorkers("service")}}

Hàm khởi tạo **`PaymentRequestEvent`** tạo một thể hiện đối tượng {{domxref("PaymentRequestEvent")}} mới.

## Cú pháp

```js-nolint
new PaymentRequestEvent(type)
new PaymentRequestEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi với tên của sự kiện.
    Phân biệt chữ hoa chữ thường và trình duyệt đặt nó thành `paymentrequest`.
- `options` {{optional_inline}}
  - : Một đối tượng mà ngoài các thuộc tính được định nghĩa trong {{domxref("ExtendableEvent/ExtendableEvent", "ExtendableEvent()")}}, có thể có các thuộc tính sau:
    - `methodData`
      - : Một mảng các đối tượng `PaymentMethodData` (xem [`methodData` > Giá trị](/en-US/docs/Web/API/PaymentRequestEvent/methodData#value)) chứa các định danh phương thức thanh toán cho các phương thức thanh toán mà trang web chấp nhận và bất kỳ dữ liệu đặc thù của phương thức thanh toán liên quan.
    - `modifiers`
      - : Một mảng đối tượng chứa các thay đổi đối với chi tiết thanh toán.
    - `paymentRequestId`
      - : ID của đối tượng {{domxref("PaymentRequest")}}.
    - `paymentRequestOrigin`
      - : Nguồn gốc nơi đối tượng {{domxref("PaymentRequest")}} được khởi tạo.
    - `topOrigin`
      - : Nguồn gốc cấp cao nhất nơi đối tượng {{domxref("PaymentRequest")}} được khởi tạo.
    - `total`
      - : Tổng số tiền được yêu cầu để thanh toán.

### Giá trị trả về

Một đối tượng {{domxref("PaymentRequestEvent")}} mới.

## Ví dụ

Nhà phát triển sẽ không sử dụng hàm khởi tạo này theo cách thủ công. Một đối tượng `PaymentRequestEvent` mới được tạo khi một trình xử lý được gọi do sự kiện {{domxref("ServiceWorkerGlobalScope.paymentrequest_event", "paymentrequest")}} kích hoạt.

```js
self.addEventListener("paymentrequest", (e) => {
  // …
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web-based payment apps overview](https://web.dev/articles/web-based-payment-apps-overview)
- [Setting up a payment method](https://web.dev/articles/setting-up-a-payment-method)
- [Life of a payment transaction](https://web.dev/articles/life-of-a-payment-transaction)
- [Using the Payment Request API](/en-US/docs/Web/API/Payment_Request_API/Using_the_Payment_Request_API)
- [Payment processing concepts](/en-US/docs/Web/API/Payment_Request_API/Concepts)
