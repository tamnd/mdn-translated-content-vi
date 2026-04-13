---
title: Web-based Payment Handler API
slug: Web/API/Web-Based_Payment_Handler_API
page-type: web-api-overview
status:
  - experimental
browser-compat: api.PaymentRequestEvent
---

{{DefaultAPISidebar("Web-Based Payment Handler API")}}{{securecontext_header}}{{SeeCompatTable}}{{AvailableInWorkers}}

Web-based Payment Handler API cung cấp một tập chức năng chuẩn hóa cho các ứng dụng web để trực tiếp xử lý thanh toán, thay vì phải chuyển hướng đến trang riêng biệt để xử lý thanh toán.

Khi trang web người bán khởi tạo thanh toán thông qua {{domxref("Payment Request API", "Payment Request API", "", "nocode")}}, Web-based Payment Handler API xử lý việc tìm kiếm các ứng dụng thanh toán phù hợp, trình bày chúng dưới dạng lựa chọn cho người dùng, mở cửa sổ trình xử lý thanh toán khi đã chọn để người dùng nhập thông tin thanh toán của họ, và xử lý giao dịch thanh toán với ứng dụng thanh toán.

Giao tiếp với các ứng dụng thanh toán (ủy quyền, truyền thông tin xác thực thanh toán) được xử lý thông qua Service Workers.

## Giao diện

- {{domxref("CanMakePaymentEvent")}}
  - : Đối tượng sự kiện cho sự kiện {{domxref("ServiceWorkerGlobalScope.canmakepayment_event", "canmakepayment")}}, được kích hoạt trên service worker của ứng dụng thanh toán khi nó đã được đăng ký thành công để báo hiệu rằng nó sẵn sàng xử lý thanh toán.
- {{domxref("PaymentManager")}}
  - : Được dùng để quản lý các khía cạnh khác nhau của chức năng ứng dụng thanh toán.
- {{domxref("PaymentRequestEvent")}} {{Experimental_Inline}}
  - : Đối tượng sự kiện cho sự kiện {{domxref("ServiceWorkerGlobalScope.paymentrequest_event", "paymentrequest")}}, được kích hoạt trên service worker của ứng dụng thanh toán khi luồng thanh toán được khởi tạo.

## Mở rộng cho các giao diện khác

- {{domxref("ServiceWorkerGlobalScope.canmakepayment_event", "canmakepayment")}} event
  - : Được kích hoạt trên {{domxref("ServiceWorkerGlobalScope")}} của ứng dụng thanh toán khi nó đã được đăng ký thành công.
- {{domxref("ServiceWorkerGlobalScope.paymentrequest_event", "paymentrequest")}} event
  - : Được kích hoạt trên {{domxref("ServiceWorkerGlobalScope")}} của ứng dụng thanh toán khi luồng thanh toán được khởi tạo.
- {{domxref("ServiceWorkerRegistration.paymentManager")}}
  - : Trả về phiên bản {{domxref("PaymentManager")}} của ứng dụng thanh toán.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [BobBucks sample payment app](https://bobbucks.dev/)
- [Web-based payment apps overview](https://web.dev/articles/web-based-payment-apps-overview)
- [Setting up a payment method](https://web.dev/articles/setting-up-a-payment-method)
- [Life of a payment transaction](https://web.dev/articles/life-of-a-payment-transaction)
- [Using the Payment Request API](/en-US/docs/Web/API/Payment_Request_API/Using_the_Payment_Request_API)
- [Payment processing concepts](/en-US/docs/Web/API/Payment_Request_API/Concepts)
