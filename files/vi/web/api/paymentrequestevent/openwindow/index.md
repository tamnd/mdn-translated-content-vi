---
title: "PaymentRequestEvent: phương thức openWindow()"
short-title: openWindow()
slug: Web/API/PaymentRequestEvent/openWindow
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.PaymentRequestEvent.openWindow
---

{{APIRef("Web-Based Payment Handler API")}}{{SeeCompatTable}}{{AvailableInWorkers("service")}}

Phương thức **`openWindow()`** của giao diện {{domxref("PaymentRequestEvent")}} mở URL được chỉ định trong một cửa sổ mới, chỉ khi URL đã cho cùng nguồn gốc với trang đang gọi. Trả về một {{jsxref("Promise")}} được giải quyết với tham chiếu đến một {{domxref("WindowClient")}}.

## Cú pháp

```js-nolint
openWindow(url)
```

### Tham số

- `url`
  - : URL để mở trong cửa sổ mới. Nó phải cùng nguồn gốc với trang đang gọi.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết với tham chiếu đến {{domxref("WindowClient")}}.

## Ví dụ

```js
self.addEventListener("paymentrequest", async (e) => {
  // …
  // Retain a promise for future resolution
  // Polyfill for PromiseResolver at link below.
  resolver = new PromiseResolver();

  // Pass a promise that resolves when payment is done.
  e.respondWith(resolver.promise);
  // Open the checkout page.
  try {
    // Open the window and preserve the client
    client = await e.openWindow(checkoutURL);
    if (!client) {
      // Reject if the window fails to open
      throw new Error("Failed to open window");
    }
  } catch (err) {
    // Reject the promise on failure
    resolver.reject(err);
  }
});
```

Xem [Open the payment handler window to display the web-based payment app frontend](https://web.dev/articles/orchestrating-payment-transactions#open-payment-handler-window) để biết thêm chi tiết về cách sử dụng phương thức này.

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
