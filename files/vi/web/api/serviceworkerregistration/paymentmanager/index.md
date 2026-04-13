---
title: "ServiceWorkerRegistration: thuộc tính paymentManager"
short-title: paymentManager
slug: Web/API/ServiceWorkerRegistration/paymentManager
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.ServiceWorkerRegistration.paymentManager
---

{{APIRef("Web-Based Payment Handler API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`paymentManager`** của giao diện {{domxref("ServiceWorkerRegistration")}} trả về một thể hiện {{domxref("PaymentManager")}} của ứng dụng thanh toán, được sử dụng để quản lý các chức năng khác nhau của ứng dụng thanh toán.

## Giá trị

Một thể hiện đối tượng {{domxref("PaymentManager")}}.

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

- {{domxref("PaymentManager.userHint")}} được sử dụng để cung cấp một gợi ý cho trình duyệt hiển thị cùng với tên và biểu tượng của ứng dụng thanh toán trong giao diện người dùng Web-based Payment Handler.
- {{domxref("PaymentManager.enableDelegations()")}} được sử dụng để ủy quyền trách nhiệm cung cấp các phần khác nhau của thông tin thanh toán cần thiết cho ứng dụng thanh toán thay vì thu thập nó từ trang web của người bán.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Web-based Payment Handler API", "", "", "nocode")}}
- [Tổng quan về ứng dụng thanh toán dựa trên web](https://web.dev/articles/web-based-payment-apps-overview)
- [Thiết lập phương thức thanh toán](https://web.dev/articles/setting-up-a-payment-method)
- [Vòng đời của giao dịch thanh toán](https://web.dev/articles/life-of-a-payment-transaction)
- [Sử dụng Payment Request API](/en-US/docs/Web/API/Payment_Request_API/Using_the_Payment_Request_API)
- [Các khái niệm về xử lý thanh toán](/en-US/docs/Web/API/Payment_Request_API/Concepts)
