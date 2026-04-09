---
title: serviceworker
slug: Web/Progressive_web_apps/Manifest/Reference/serviceworker
page-type: web-manifest-member
status:
  - experimental
  - non-standard
browser-compat: manifests.webapp.serviceworker
sidebar: pwasidebar
---

{{SeeCompatTable}}{{Non-standard_header}}

Member `serviceworker` chỉ định một service worker được cài đặt và đăng ký Just-In-Time (JIT) để chạy một ứng dụng thanh toán dựa trên web, cung cấp cơ chế thanh toán cho một phương thức thanh toán được chỉ định trên website của người bán. Xem {{domxref("Web-based Payment Handler API", "", "", "nocode")}} để biết thêm chi tiết.

## Giá trị

Đối tượng `serviceworker` có thể chứa các giá trị sau:

- `scope` {{experimental_inline}} {{non-standard_inline}}
  - : Một chuỗi đại diện cho phạm vi đăng ký của service worker.

- `src` {{experimental_inline}} {{non-standard_inline}}
  - : Một chuỗi đại diện cho URL để tải script service worker từ đó.

- `use_cache` {{experimental_inline}} {{non-standard_inline}}
  - : Một giá trị boolean thiết lập cách HTTP cache được dùng cho tài nguyên script của service worker trong quá trình cập nhật.
    Nó cung cấp chức năng tương đương với một số giá trị của tùy chọn `updateViaCache` khi service worker được đăng ký qua JavaScript bằng {{domxref("ServiceWorkerContainer.register()")}}.
    - `true`: HTTP cache sẽ được truy vấn cho các import, nhưng script chính sẽ luôn được cập nhật từ mạng. Nếu không tìm thấy mục mới trong HTTP cache cho các import, chúng sẽ được tải từ mạng. Tương đương `updateViaCache: "imports"`.
    - `false`: HTTP cache sẽ không được dùng cho script chính hoặc các import của nó. Tất cả tài nguyên script của service worker sẽ được cập nhật từ mạng. Tương đương `updateViaCache: "none"`.

## Ví dụ

Xem [Web-based Payment Handler API > Concepts and usage](/en-US/docs/Web/API/Web-Based_Payment_Handler_API#concepts_and_usage).

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Service Worker API", "Service Worker API", "", "nocode")}}
- {{domxref("Web-based Payment Handler API", "", "", "nocode")}}
- [Web-based payment apps overview](https://web.dev/articles/web-based-payment-apps-overview)
- [Setting up a payment method](https://web.dev/articles/setting-up-a-payment-method)
- [Life of a payment transaction](https://web.dev/articles/life-of-a-payment-transaction)
- [Using the Payment Request API](/en-US/docs/Web/API/Payment_Request_API/Using_the_Payment_Request_API)
- [Payment processing concepts](/en-US/docs/Web/API/Payment_Request_API/Concepts)
