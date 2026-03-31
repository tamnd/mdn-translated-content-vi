---
title: Server header
short-title: Server
slug: Web/HTTP/Reference/Headers/Server
page-type: http-header
browser-compat: http.headers.Server
sidebar: http
---

Tiêu đề HTTP **`Server`** {{Glossary("response header")}} mô tả phần mềm được sử dụng bởi máy chủ gốc đã xử lý yêu cầu và tạo phản hồi.

Lợi ích của việc quảng cáo loại và phiên bản máy chủ thông qua tiêu đề này là giúp phân tích và xác định mức độ phổ biến của các vấn đề tương thích cụ thể.
Về mặt lịch sử, các máy khách đã sử dụng thông tin phiên bản máy chủ để tránh các hạn chế đã biết, chẳng hạn như hỗ trợ không nhất quán cho [range requests](/en-US/docs/Web/HTTP/Guides/Range_requests) trong các phiên bản phần mềm cụ thể.

> [!WARNING]
> Sự có mặt của tiêu đề này trong các phản hồi, đặc biệt khi nó chứa thông tin chi tiết về phần mềm máy chủ, có thể làm cho các lỗ hổng đã biết dễ phát hiện hơn.

Quá nhiều chi tiết trong tiêu đề `Server` không được khuyến khích vì lý do độ trễ phản hồi và lý do bảo mật đã đề cập ở trên.
Có thể tranh luận rằng việc che khuất thông tin trong tiêu đề này không mang lại nhiều lợi ích vì dấu vân tay phần mềm máy chủ là có thể thực hiện thông qua các phương tiện khác.
Nói chung, cách tiếp cận mạnh mẽ hơn để bảo mật máy chủ là đảm bảo phần mềm được cập nhật thường xuyên hoặc vá lỗi đối với các lỗ hổng đã biết.

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
Server: <product>
```

## Chỉ thị

- `<product>`
  - : Tên của phần mềm hoặc sản phẩm đã xử lý yêu cầu.
    Thường ở định dạng tương tự như {{HTTPHeader('User-Agent')}}.

## Ví dụ

```http
Server: Apache/2.4.1 (Unix)
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Allow")}}
- [HTTP Observatory](/en-US/observatory)
- [Prevent information disclosure via HTTP headers](https://owasp.org/www-project-secure-headers/index.html#prevent-information-disclosure-via-http-headers) - OWASP Secure Headers Project
