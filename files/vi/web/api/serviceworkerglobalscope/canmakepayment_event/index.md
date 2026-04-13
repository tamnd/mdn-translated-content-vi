---
title: "ServiceWorkerGlobalScope: sự kiện canmakepayment"
short-title: canmakepayment
slug: Web/API/ServiceWorkerGlobalScope/canmakepayment_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.ServiceWorkerGlobalScope.canmakepayment_event
---

{{APIRef("Web-Based Payment Handler API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers("service")}}

Sự kiện **`canmakepayment`** của giao diện {{domxref("ServiceWorkerGlobalScope")}} được kích hoạt trên service worker của ứng dụng thanh toán để kiểm tra xem nó đã sẵn sàng xử lý thanh toán chưa. Cụ thể, nó được kích hoạt khi trang web merchant gọi phương thức khởi tạo {{domxref("PaymentRequest.PaymentRequest", "PaymentRequest()")}}.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("canmakepayment", (event) => { })

oncanmakepayment = (event) => { }
```

## Loại sự kiện

Một {{domxref("CanMakePaymentEvent")}}. Kế thừa từ {{domxref("ExtendableEvent")}}.

{{InheritanceDiagram("CanMakePaymentEvent")}}

## Ví dụ

Sự kiện `canmakepayment` được kích hoạt trên service worker của ứng dụng thanh toán để kiểm tra xem nó đã sẵn sàng xử lý thanh toán chưa. Cụ thể, nó được kích hoạt khi trang web merchant gọi phương thức khởi tạo {{domxref("PaymentRequest.PaymentRequest", "PaymentRequest()")}}. Service worker sau đó có thể sử dụng phương thức {{domxref("CanMakePaymentEvent.respondWith()")}} để phản hồi thích hợp:

```js
self.addEventListener("canmakepayment", (e) => {
  e.respondWith(
    new Promise((resolve, reject) => {
      someAppSpecificLogic()
        .then((result) => {
          resolve(result);
        })
        .catch((error) => {
          reject(error);
        });
    }),
  );
});
```

`respondWith()` trả về một {{jsxref("Promise")}} giải quyết với một giá trị boolean để báo hiệu rằng service worker đã sẵn sàng xử lý yêu cầu thanh toán (`true`), hoặc không (`false`).

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
