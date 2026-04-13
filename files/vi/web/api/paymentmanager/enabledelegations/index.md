---
title: "PaymentManager: phương thức enableDelegations()"
short-title: enableDelegations()
slug: Web/API/PaymentManager/enableDelegations
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.PaymentManager.enableDelegations
---

{{APIRef("Web-Based Payment Handler API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`enableDelegations()`** của giao diện {{domxref("PaymentManager")}} ủy thác trách nhiệm cung cấp các phần khác nhau của thông tin thanh toán cần thiết cho ứng dụng thanh toán thay vì thu thập từ trình duyệt (ví dụ: qua tự động điền).

## Cú pháp

```js-nolint
enableDelegations(delegations)
```

### Tham số

- `delegations` {{optional_inline}}
  - : Một mảng chứa một hoặc nhiều giá trị liệt kê chỉ định thông tin thanh toán bạn muốn ủy thác cho ứng dụng thanh toán. Các giá trị có thể là:
    - `payerEmail`
      - : Ứng dụng thanh toán sẽ cung cấp email của người thanh toán khi cần.
    - `payerName`
      - : Ứng dụng thanh toán sẽ cung cấp tên của người thanh toán khi cần.
    - `payerPhone`
      - : Ứng dụng thanh toán sẽ cung cấp số điện thoại của người thanh toán khi cần.
    - `shippingAddress`
      - : Ứng dụng thanh toán sẽ cung cấp địa chỉ vận chuyển khi cần.

### Giá trị trả về

Một {{jsxref("Promise")}} giải quyết với giá trị `undefined`.

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
