---
title: "ServiceWorkerGlobalScope: sự kiện paymentrequest"
short-title: paymentrequest
slug: Web/API/ServiceWorkerGlobalScope/paymentrequest_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.ServiceWorkerGlobalScope.paymentrequest_event
---

{{APIRef("Web-Based Payment Handler API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers("service")}}

Sự kiện **`paymentrequest`** của giao diện {{domxref("ServiceWorkerGlobalScope")}} được kích hoạt trên một ứng dụng thanh toán khi một luồng thanh toán đã được khởi tạo trên trang web merchant thông qua phương thức {{domxref("PaymentRequest.show()")}}.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("paymentrequest", (event) => { })

onpaymentrequest = (event) => { }
```

## Loại sự kiện

Một {{domxref("PaymentRequestEvent")}}. Kế thừa từ {{domxref("ExtendableEvent")}}.

{{InheritanceDiagram("PaymentRequestEvent")}}

## Ví dụ

Khi phương thức {{domxref("PaymentRequest.show()")}} được gọi, một sự kiện `paymentrequest` được kích hoạt trên service worker của ứng dụng thanh toán. Sự kiện này được lắng nghe bên trong service worker của ứng dụng thanh toán để bắt đầu giai đoạn tiếp theo của quá trình thanh toán.

```js
let paymentRequestEvent;
let resolver;
let client;

// `self` is the global object in service worker
self.addEventListener("paymentrequest", async (e) => {
  if (paymentRequestEvent) {
    // If there's an ongoing payment transaction, reject it.
    resolver.reject();
  }
  // Preserve the event for future use
  paymentRequestEvent = e;

  // …
});
```

Khi nhận được sự kiện `paymentrequest`, ứng dụng thanh toán có thể mở cửa sổ xử lý thanh toán bằng cách gọi {{domxref("PaymentRequestEvent.openWindow()")}}. Cửa sổ xử lý thanh toán sẽ hiển thị cho khách hàng một giao diện ứng dụng thanh toán nơi họ có thể xác thực, chọn địa chỉ giao hàng và tùy chọn, và ủy quyền thanh toán.

Khi thanh toán đã được xử lý, {{domxref("PaymentRequestEvent.respondWith()")}} được sử dụng để chuyển kết quả thanh toán trở lại trang web merchant.

Xem [Receive a payment request event from the merchant](https://web.dev/articles/orchestrating-payment-transactions#receive-payment-request-event) để biết thêm chi tiết về giai đoạn này.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Web-based Payment Handler API", "", "", "nocode")}}
- [Web-based payment apps overview](https://web.dev/articles/web-based-payment-apps-overview)
- [Setting up a payment method](https://web.dev/articles/setting-up-a-payment-method)
- [Life of a payment transaction](https://web.dev/articles/life-of-a-payment-transaction)
- [Sử dụng Payment Request API](/en-US/docs/Web/API/Payment_Request_API/Using_the_Payment_Request_API)
- [Các khái niệm xử lý thanh toán](/en-US/docs/Web/API/Payment_Request_API/Concepts)
