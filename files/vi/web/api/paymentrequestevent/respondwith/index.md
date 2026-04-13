---
title: "PaymentRequestEvent: phương thức respondWith()"
short-title: respondWith()
slug: Web/API/PaymentRequestEvent/respondWith
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.PaymentRequestEvent.respondWith
---

{{APIRef("Web-Based Payment Handler API")}}{{SeeCompatTable}}{{AvailableInWorkers("service")}}

Phương thức **`respondWith()`** của giao diện {{domxref("PaymentRequestEvent")}} ngăn chặn xử lý sự kiện mặc định và cho phép bạn tự cung cấp một {{jsxref("Promise")}} cho đối tượng phản hồi trình xử lý thanh toán.

## Cú pháp

```js-nolint
respondWith(promise)
```

### Tham số

- `promise`
  - : Một đối tượng phản hồi trình xử lý thanh toán hoặc một {{jsxref('Promise')}} được giải quyết thành một. Đối tượng này nên chứa các thuộc tính sau:
    - `methodName`
      - : Định danh phương thức thanh toán cho phương thức thanh toán mà người dùng đã chọn để hoàn thành giao dịch.
    - `details`
      - : Một đối tượng có thể JSON-serialize cung cấp thông điệp đặc thù của phương thức thanh toán được người bán sử dụng để xử lý giao dịch và xác định chuyển tiền thành công. Xem [8.1.2 `details` attribute](https://w3c.github.io/web-based-payment-handler/#details-attribute) để biết thêm chi tiết.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Ví dụ dưới đây được lấy từ [Open the payment handler window to display the web-based payment app frontend](https://web.dev/articles/orchestrating-payment-transactions#open-payment-handler-window). Đọc bài viết để hiểu ngữ cảnh của mã.

```js
self.addEventListener("paymentrequest", async (e) => {
  // Retain a promise for future resolution
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
