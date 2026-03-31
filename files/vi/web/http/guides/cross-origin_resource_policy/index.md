---
title: Cross-Origin Resource Policy (CORP)
slug: Web/HTTP/Guides/Cross-Origin_Resource_Policy
page-type: guide
browser-compat: http.headers.Cross-Origin-Resource-Policy
sidebar: http
---

**Cross-Origin Resource Policy** là chính sách được đặt bởi [HTTP header `Cross-Origin-Resource-Policy`](/en-US/docs/Web/HTTP/Reference/Headers/Cross-Origin-Resource-Policy) cho phép các trang web và ứng dụng chọn tham gia bảo vệ chống lại một số yêu cầu nhất định từ các nguồn gốc khác (chẳng hạn như những yêu cầu được phát hành với các phần tử như `<script>` và `<img>`), để giảm thiểu các cuộc tấn công kênh bên suy đoán, như [Spectre](<https://en.wikipedia.org/wiki/Spectre_(security_vulnerability)>), cũng như các cuộc tấn công Cross-Site Script Inclusion. CORP là một lớp bảo vệ bổ sung ngoài {{Glossary("same-origin policy")}} mặc định.

> [!NOTE]
> Chính sách chỉ có hiệu lực cho các yêu cầu [`no-cors`](https://fetch.spec.whatwg.org/#concept-request-mode), được phát hành theo mặc định cho các phương thức/header được CORS đưa vào danh sách an toàn.

Vì chính sách này được biểu thị qua _[response header](/en-US/docs/Glossary/Response_header)_, yêu cầu thực tế không bị ngăn chặn — thay vào đó, trình duyệt ngăn _kết quả_ bị rò rỉ bằng cách loại bỏ body phản hồi.

## Cách sử dụng

> [!NOTE]
> Do [lỗi trong Chrome](https://crbug.com/1074261), việc đặt Cross-Origin-Resource-Policy có thể làm hỏng việc render PDF, ngăn khách truy cập đọc qua trang đầu tiên của một số PDF. Hãy thận trọng khi sử dụng header này trong môi trường sản xuất.

Các ứng dụng web đặt Cross-Origin Resource Policy thông qua header phản hồi HTTP {{HTTPHeader("Cross-Origin-Resource-Policy")}}, chấp nhận một trong ba giá trị:

- `same-site`
  - : Chỉ các yêu cầu từ cùng _{{Glossary("Site")}}_ mới có thể đọc tài nguyên.

    > [!WARNING]
    > Đây ít an toàn hơn một {{Glossary("origin")}}. [Thuật toán kiểm tra xem hai nguồn gốc có cùng site hay không](https://html.spec.whatwg.org/multipage/origin.html#same-site) được định nghĩa trong tiêu chuẩn HTML và liên quan đến việc kiểm tra _domain có thể đăng ký_.

- `same-origin`
  - : Chỉ các yêu cầu từ cùng _{{Glossary("origin")}}_ (tức là scheme + host + port) mới có thể đọc tài nguyên.
- `cross-origin`
  - : Các yêu cầu từ bất kỳ _{{Glossary("origin")}}_ nào (cả same-site và cross-site) đều có thể đọc tài nguyên. Điều này hữu ích khi COEP được sử dụng (xem bên dưới).

```http
Cross-Origin-Resource-Policy: same-site | same-origin | cross-origin
```

Trong quá trình kiểm tra chính sách tài nguyên xuyên nguồn gốc, nếu header được đặt, trình duyệt sẽ từ chối các yêu cầu `no-cors` được phát hành từ nguồn gốc/site khác.

## Mối quan hệ với chính sách nhúng xuyên nguồn gốc (COEP)

Header phản hồi HTTP {{HTTPHeader("Cross-Origin-Embedder-Policy")}}, khi được sử dụng trên tài liệu, có thể được sử dụng để yêu cầu các tài nguyên con phải cùng nguồn gốc với tài liệu, hoặc đi kèm với header phản hồi HTTP {{HTTPHeader("Cross-Origin-Resource-Policy")}} để chỉ ra rằng chúng ổn khi được nhúng. Đó là lý do tại sao giá trị `cross-origin` tồn tại.

## Lịch sử

Khái niệm này ban đầu được đề xuất vào năm 2012 (như header `From-Origin`), nhưng [được khôi phục lại](https://github.com/whatwg/fetch/issues/687) vào Q2 năm 2018 và được triển khai trong Safari và Chromium.

Vào đầu năm 2018, hai lỗ hổng phần cứng kênh bên được gọi là _Meltdown_ và _Spectre_ đã được tiết lộ. Các lỗ hổng này cho phép tiết lộ dữ liệu nhạy cảm do điều kiện đua xảy ra như một phần của chức năng thực thi suy đoán, được thiết kế để cải thiện hiệu suất.

Cross-Origin Resource Policy được phát triển như một cách trực tiếp để các trang web chặn các yêu cầu xuyên nguồn gốc `no-cors` không mong muốn. Đây là biện pháp phòng vệ hiệu quả chống lại các cuộc tấn công giống Spectre, vì trình duyệt loại bỏ body khỏi các phản hồi đã cho trước khi kẻ tấn công có thể truy cập chúng.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- HTTP Header {{HTTPHeader("Cross-Origin-Resource-Policy")}}
