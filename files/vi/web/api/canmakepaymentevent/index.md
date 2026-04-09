---
title: CanMakePaymentEvent
slug: Web/API/CanMakePaymentEvent
page-type: web-api-interface
status:
  - experimental
browser-compat: api.CanMakePaymentEvent
---

{{APIRef("Web-Based Payment Handler API")}}{{SeeCompatTable}}{{AvailableInWorkers("service")}}

Giao diện **`CanMakePaymentEvent`** của {{domxref("Web-based Payment Handler API", "", "", "nocode")}} là đối tượng sự kiện cho sự kiện {{domxref("ServiceWorkerGlobalScope.canmakepayment_event", "canmakepayment")}}, được kích hoạt trên service worker của một ứng dụng thanh toán để kiểm tra xem ứng dụng đó đã sẵn sàng xử lý một khoản thanh toán hay chưa. Cụ thể, sự kiện này được kích hoạt khi website của bên bán gọi hàm tạo {{domxref("PaymentRequest.PaymentRequest", "PaymentRequest()")}}.

{{InheritanceDiagram}}

## Constructor

- {{domxref("CanMakePaymentEvent.CanMakePaymentEvent", "CanMakePaymentEvent()")}} {{Experimental_Inline}}
  - : Tạo một phiên bản đối tượng `CanMakePaymentEvent` mới.

## Instance methods

- {{domxref("CanMakePaymentEvent.respondWith", "respondWith()")}} {{Experimental_Inline}}
  - : Cho phép service worker phản hồi một cách thích hợp để báo hiệu liệu nó đã sẵn sàng xử lý thanh toán hay chưa.

## Examples

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
