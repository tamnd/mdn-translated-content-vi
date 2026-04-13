---
title: "PaymentManager: thuộc tính userHint"
short-title: userHint
slug: Web/API/PaymentManager/userHint
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PaymentManager.userHint
---

{{APIRef("Web-Based Payment Handler API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính **`userHint`** của giao diện {{domxref("PaymentManager")}} cung cấp gợi ý cho trình duyệt hiển thị cùng với tên và biểu tượng của ứng dụng thanh toán trong giao diện Web-based Payment Handler.

## Giá trị

Một chuỗi.

## Ví dụ

```js
navigator.serviceWorker.register("serviceworker.js").then((registration) => {
  registration.paymentManager.userHint = "Card number should be 16 digits";

  registration.paymentManager
    .enableDelegations(["shippingAddress", "payerName"])
    .then(() => {
      // …
    });

  // …
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Web-based Payment Handler API", "", "", "nocode")}}
- [Sử dụng Payment Request API](/en-US/docs/Web/API/Payment_Request_API/Using_the_Payment_Request_API)
