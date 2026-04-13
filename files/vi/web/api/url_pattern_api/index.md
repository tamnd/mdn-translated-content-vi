---
title: URL Pattern API
slug: Web/API/URL_Pattern_API
page-type: web-api-overview
browser-compat: api.URLPattern
spec-urls: https://urlpattern.spec.whatwg.org/
---

{{DefaultAPISidebar("URL Pattern API")}} {{AvailableInWorkers}}

**URL Pattern API** định nghĩa một cú pháp được sử dụng để tạo các bộ so khớp URL. Các mẫu này có thể được so khớp với các URL hoặc các thành phần URL riêng lẻ.

## Khái niệm và cách sử dụng

Các mẫu được chỉ định bằng giao diện {{domxref("URLPattern")}}. Cú pháp mẫu dựa trên cú pháp từ thư viện [path-to-regexp](https://github.com/pillarjs/path-to-regexp). Các mẫu có thể chứa:

- Chuỗi ký tự được so khớp chính xác.
- Ký tự đại diện (`/posts/*`) khớp với bất kỳ ký tự nào.
- Nhóm có tên (`/books/:id`) trích xuất một phần của URL được so khớp.
- Nhóm không bắt (`/books{/old}?`) làm cho các phần của mẫu tùy chọn hoặc được so khớp nhiều lần.
- Nhóm {{jsxref("RegExp")}} (`/books/(\\d+)`) thực hiện các so khớp regex tùy ý phức tạp.

## Giao diện

- {{domxref("URLPattern")}}
  - : Đại diện cho mẫu có thể so khớp với URL hoặc các phần URL. Mẫu có thể chứa các nhóm bắt trích xuất các phần của URL được so khớp.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Polyfill của `URLPattern` có sẵn [trên GitHub](https://github.com/kenchris/urlpattern-polyfill)
- Cú pháp mẫu được sử dụng bởi URLPattern tương tự cú pháp được sử dụng bởi [path-to-regexp](https://github.com/pillarjs/path-to-regexp)
