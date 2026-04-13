---
title: PaymentRequestEvent
slug: Web/API/PaymentRequestEvent
page-type: web-api-interface
status:
  - experimental
browser-compat: api.PaymentRequestEvent
---

{{SeeCompatTable}}{{APIRef("Web-Based Payment Handler API")}}{{AvailableInWorkers("service")}}

Giao diện **`PaymentRequestEvent`** của {{domxref("Web-based Payment Handler API", "", "", "nocode")}} là đối tượng được truyền cho trình xử lý thanh toán khi một {{domxref("PaymentRequest")}} được thực hiện.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("PaymentRequestEvent.PaymentRequestEvent","PaymentRequestEvent()")}} {{Experimental_Inline}}
  - : Tạo một thể hiện đối tượng `PaymentRequestEvent` mới.

## Thuộc tính phiên bản

- {{domxref("PaymentRequestEvent.methodData","methodData")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một mảng đối tượng chứa các định danh phương thức thanh toán cho các phương thức thanh toán mà trang web chấp nhận và bất kỳ dữ liệu đặc thù của phương thức thanh toán liên quan.
- {{domxref("PaymentRequestEvent.modifiers","modifiers")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một mảng đối tượng chứa các thay đổi đối với chi tiết thanh toán.
- {{domxref("PaymentRequestEvent.paymentRequestId","paymentRequestId")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về ID của đối tượng {{domxref("PaymentRequest")}}.
- {{domxref("PaymentRequestEvent.paymentRequestOrigin","paymentRequestOrigin")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về nguồn gốc nơi đối tượng {{domxref("PaymentRequest")}} được khởi tạo.
- {{domxref("PaymentRequestEvent.topOrigin","topOrigin")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về nguồn gốc cấp cao nhất nơi đối tượng {{domxref("PaymentRequest")}} được khởi tạo.
- {{domxref("PaymentRequestEvent.total","total")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về tổng số tiền được yêu cầu để thanh toán.

## Phương thức phiên bản

- {{domxref("PaymentRequestEvent.changePaymentMethod","changePaymentMethod()")}} {{Experimental_Inline}}
  - : Lấy tổng số tiền đã cập nhật, dựa trên chi tiết phương thức thanh toán.
- {{domxref("PaymentRequestEvent.openWindow","openWindow()")}} {{Experimental_Inline}}
  - : Mở URL được chỉ định trong một cửa sổ mới, chỉ khi URL đã cho cùng nguồn gốc với trang đang gọi. Trả về một {{jsxref("Promise")}} được giải quyết với tham chiếu đến một {{domxref("WindowClient")}}.
- {{domxref("PaymentRequestEvent.respondWith","respondWith()")}} {{Experimental_Inline}}
  - : Ngăn chặn xử lý sự kiện mặc định và cho phép bạn tự cung cấp một {{jsxref("Promise")}} cho đối tượng {{domxref("PaymentResponse")}}.

## Ví dụ

Khi phương thức {{domxref("PaymentRequest.show()")}} được gọi, một sự kiện {{domxref("ServiceWorkerGlobalScope.paymentrequest_event", "paymentrequest")}} được kích hoạt trên service worker của ứng dụng thanh toán. Sự kiện này được lắng nghe bên trong service worker của ứng dụng thanh toán để bắt đầu giai đoạn tiếp theo của quá trình thanh toán.

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

Khi nhận được sự kiện `paymentrequest`, ứng dụng thanh toán có thể mở một cửa sổ trình xử lý thanh toán bằng cách gọi {{domxref("PaymentRequestEvent.openWindow()")}}. Cửa sổ trình xử lý thanh toán sẽ hiển thị cho khách hàng giao diện ứng dụng thanh toán nơi họ có thể xác thực, chọn địa chỉ giao hàng và các tùy chọn, và ủy quyền thanh toán.

Khi thanh toán được xử lý, {{domxref("PaymentRequestEvent.respondWith()")}} được sử dụng để truyền kết quả thanh toán trở lại trang web của người bán.

Xem [Receive a payment request event from the merchant](https://web.dev/articles/orchestrating-payment-transactions#receive-payment-request-event) để biết thêm chi tiết về giai đoạn này.

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
