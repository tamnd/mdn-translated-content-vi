---
title: "CanMakePaymentEvent: respondWith() method"
short-title: respondWith()
slug: Web/API/CanMakePaymentEvent/respondWith
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.CanMakePaymentEvent.respondWith
---

{{APIRef("Web-Based Payment Handler API")}}{{SeeCompatTable}}{{AvailableInWorkers("service")}}

Phương thức **`respondWith()`** của giao diện {{domxref("CanMakePaymentEvent")}} cho phép service worker phản hồi một cách thích hợp để báo hiệu liệu nó đã sẵn sàng xử lý thanh toán hay chưa.

## Syntax

```js-nolint
respondWith(response)
```

### Parameters

- `response`
  - : Một {{jsxref("Promise")}} được resolve với một giá trị boolean để báo hiệu rằng nó đã sẵn sàng xử lý một yêu cầu thanh toán (`true`) hay chưa (`false`).

### Return value

Không có (`undefined`).

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
