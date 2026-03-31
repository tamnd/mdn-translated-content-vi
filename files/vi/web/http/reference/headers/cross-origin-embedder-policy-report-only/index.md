---
title: Cross-Origin-Embedder-Policy-Report-Only (COEP) header
short-title: Cross-Origin-Embedder-Policy-Report-Only
slug: Web/HTTP/Reference/Headers/Cross-Origin-Embedder-Policy-Report-Only
page-type: http-header
browser-compat: http.headers.Cross-Origin-Embedder-Policy
sidebar: http
---

Tiêu đề HTTP **`Cross-Origin-Embedder-Policy-Report-Only`** (COEP) {{Glossary("response header")}} cấu hình chính sách _chỉ báo cáo_ của tài liệu hiện tại để tải và nhúng các tài nguyên đa nguồn được yêu cầu ở chế độ `no-cors`.

Tiêu đề cho phép quản trị viên trang web báo cáo về các tài nguyên sẽ bị chặn bởi {{HTTPHeader("Cross-Origin-Embedder-Policy")}}, mà không ngăn chúng được tải.
Điều này cho phép triển khai thực thi từng bước.

Các vi phạm của chính sách có thể được báo cáo bằng [Reporting API](/en-US/docs/Web/API/Reporting_API).
Báo cáo có thể được quan sát trong trang mà chính sách đang được đặt bằng [`ReportingObserver`](/en-US/docs/Web/API/ReportingObserver), và được gửi đến các endpoint của máy chủ được định nghĩa trong tiêu đề phản hồi HTTP {{HTTPHeader("Reporting-Endpoints")}}, và được chọn bằng tham số [`report-to`](#report-to_endpoint_name).
Để biết thêm thông tin xem {{domxref("COEPViolationReport")}}.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Response header")}}</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Cross-Origin-Embedder-Policy-Report-Only: <token>; <parameter>
```

### Chỉ thị

Tiêu đề chỉ nên được đặt với một token và một endpoint `report-to`.

Đặt tiêu đề nhiều hơn một lần hoặc với nhiều token tương đương với việc đặt `unsafe-none`.
Bỏ qua `report-to` khiến tiêu đề không có hiệu lực.

Giá trị `<token>` có thể là một trong:

- `unsafe-none`
  - : Cho phép tài liệu tải các tài nguyên đa nguồn được yêu cầu ở chế độ `no-cors` **mà không** cần cấp quyền rõ ràng thông qua tiêu đề {{HTTPHeader("Cross-Origin-Resource-Policy")}}.
    Đây là giá trị mặc định.

- `require-corp`
  - : Tài liệu chỉ có thể tải các tài nguyên được yêu cầu ở chế độ `no-cors` từ cùng nguồn gốc, hoặc các tài nguyên đã đặt rõ ràng tiêu đề {{HTTPHeader("Cross-Origin-Resource-Policy")}} thành giá trị cho phép nhúng vào.

    Việc tải tài nguyên đa nguồn sẽ bị chặn bởi COEP trừ khi:
    - Tài nguyên được yêu cầu ở chế độ `no-cors` và phản hồi bao gồm tiêu đề {{HTTPHeader("Cross-Origin-Resource-Policy")}} cho phép tải vào nguồn gốc của tài liệu.
    - Tài nguyên được yêu cầu ở chế độ `cors`; ví dụ: trong HTML bằng thuộc tính [`crossorigin`](/en-US/docs/Web/HTML/Reference/Attributes/crossorigin), hoặc trong JavaScript bằng cách thực hiện yêu cầu với [`{mode="cors"}`](/en-US/docs/Web/API/RequestInit#cors).
      Lưu ý rằng các yêu cầu được thực hiện ở chế độ `cors` sẽ không bị chặn bởi COEP hoặc kích hoạt vi phạm COEP, nhưng vẫn phải được CORS cho phép.

- `credentialless`
  - : Tài liệu có thể tải các tài nguyên đa nguồn được yêu cầu ở [chế độ `no-cors`](/en-US/docs/Web/API/Request/mode) **mà không** cần quyền rõ ràng thông qua tiêu đề {{HTTPHeader("Cross-Origin-Resource-Policy")}}.
    Trong trường hợp này, các yêu cầu được gửi không có thông tin đăng nhập: cookie bị bỏ qua trong yêu cầu và bị bỏ qua trong phản hồi.

    Hành vi tải đa nguồn cho các [chế độ yêu cầu](/en-US/docs/Web/API/Request/mode#cors) khác giống như đối với [`require-corp`](#require-corp).
    Ví dụ, một tài nguyên đa nguồn được yêu cầu ở chế độ `cors` phải hỗ trợ (và được CORS cho phép).

`<parameter>` là tùy chọn và có thể là một trong:

- `report-to <endpoint_name>` {{optional_inline}}
  - : `<endpoint_name>` là tên của endpoint mà các vi phạm chính sách sẽ được gửi đến.
    Ánh xạ giữa tên và một endpoint cụ thể được định nghĩa riêng trong tiêu đề HTTP {{httpheader("Reporting-Endpoints")}}.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Cross-Origin-Embedder-Policy")}}
- {{HTTPHeader("Cross-Origin-Opener-Policy")}}
- {{domxref("Window.crossOriginIsolated")}} và {{domxref("WorkerGlobalScope.crossOriginIsolated")}}
- {{domxref("ReportingObserver")}}
- {{domxref("COEPViolationReport")}}
- [Reporting API](/en-US/docs/Web/API/Reporting_API)
- [Cross Origin Opener Policy](https://web.dev/articles/why-coop-coep#coep) trong _Why you need "cross-origin isolated" for powerful features_ trên web.dev (2020)
- [COOP và COEP được giải thích: Artur Janc, Charlie Reis, Anne van Kesteren](https://docs.google.com/document/d/1zDlfvfTJ_9e8Jdc8ehuV4zMEu9ySMCiTGMS9y0GU92k/edit?tab=t.0) (2020)
