---
title: "CanMakePaymentEvent: CanMakePaymentEvent() constructor"
short-title: CanMakePaymentEvent()
slug: Web/API/CanMakePaymentEvent/CanMakePaymentEvent
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.CanMakePaymentEvent.CanMakePaymentEvent
---

{{APIRef("Web-Based Payment Handler API")}}{{SeeCompatTable}}{{AvailableInWorkers("service")}}

Hàm tạo **`CanMakePaymentEvent()`** tạo một phiên bản đối tượng {{domxref("CanMakePaymentEvent")}} mới.

## Syntax

```js-nolint
new CanMakePaymentEvent(type)
```

### Parameters

- `type`
  - : Một chuỗi biểu diễn kiểu sự kiện. Trong trường hợp của `CanMakePaymentEvent`, giá trị này luôn là `canmakepayment`.

## Examples

Nhà phát triển sẽ không dùng hàm tạo này theo cách thủ công. Một đối tượng `CanMakePaymentEvent` mới được tạo khi một trình xử lý được gọi do sự kiện {{domxref("ServiceWorkerGlobalScope.canmakepayment_event", "canmakepayment")}} được kích hoạt.

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

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- {{domxref("Web-based Payment Handler API", "", "", "nocode")}}
- [Tổng quan về ứng dụng thanh toán trên web](https://web.dev/articles/web-based-payment-apps-overview)
- [Thiết lập một phương thức thanh toán](https://web.dev/articles/setting-up-a-payment-method)
- [Vòng đời của một giao dịch thanh toán](https://web.dev/articles/life-of-a-payment-transaction)
- [Sử dụng Payment Request API](/en-US/docs/Web/API/Payment_Request_API/Using_the_Payment_Request_API)
- [Các khái niệm xử lý thanh toán](/en-US/docs/Web/API/Payment_Request_API/Concepts)
