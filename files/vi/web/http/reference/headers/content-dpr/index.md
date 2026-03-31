---
title: Content-DPR header
short-title: Content-DPR
slug: Web/HTTP/Reference/Headers/Content-DPR
page-type: http-header
status:
  - deprecated
  - non-standard
browser-compat: http.headers.Content-DPR
sidebar: http
---

{{deprecated_header}}{{securecontext_header}}{{Non-standard_header}}

Tiêu đề HTTP **`Content-DPR`** {{Glossary("response header", "phản hồi")}} được sử dụng để xác nhận tỷ lệ pixel thiết bị _hình ảnh_ (DPR) trong các yêu cầu mà client hint màn hình {{HTTPHeader("DPR")}} được sử dụng để chọn tài nguyên hình ảnh.

> [!NOTE]
> Tiêu đề `Content-DPR` đã bị xóa khỏi thông số kỹ thuật client hint trong [draft-ietf-httpbis-client-hints-07](https://datatracker.ietf.org/doc/html/draft-ietf-httpbis-client-hints-07).
> Thông số kỹ thuật [Responsive Image Client Hints](https://wicg.github.io/responsive-image-client-hints/) đề xuất thay thế tiêu đề này bằng cách chỉ định độ phân giải/kích thước nội tại trong siêu dữ liệu EXIF.

Nếu client hint `DPR` được sử dụng để chọn hình ảnh, máy chủ phải chỉ định `Content-DPR` trong phản hồi.
Nếu giá trị trong `Content-DPR` khác với giá trị {{HTTPHeader("DPR")}} trong yêu cầu (tức là DPR hình ảnh không giống với DPR màn hình), máy khách phải sử dụng `Content-DPR` để xác định kích thước hình ảnh nội tại và tỷ lệ hình ảnh.

Nếu tiêu đề `Content-DPR` xuất hiện nhiều hơn một lần trong một thông điệp, lần xuất hiện cuối cùng được sử dụng.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>
        {{Glossary("Response header", "Tiêu đề phản hồi")}},
        <a href="/en-US/docs/Web/HTTP/Guides/Client_hints">Client hint</a>
      </td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header", "Tiêu đề yêu cầu bị cấm")}}</th>
      <td>Không</td>
    </tr>
    <tr>
      <th scope="row">
        {{Glossary("CORS-safelisted response header")}}
      </th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Content-DPR: <number>
```

## Chỉ thị

- `<number>`
  - : Tỷ lệ pixel thiết bị hình ảnh, được tính theo công thức sau:
    Content-DPR = _Kích thước tài nguyên hình ảnh được chọn_ / (_Chiều rộng_ / _DPR_)

## Ví dụ

Xem ví dụ tiêu đề [`DPR`](/en-US/docs/Web/HTTP/Reference/Headers/DPR#examples).

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Client hints thiết bị và hình ảnh responsive
  - {{HTTPHeader("Sec-CH-Device-Memory")}}
  - {{HTTPHeader("Sec-CH-DPR")}}
  - {{HTTPHeader("Sec-CH-Viewport-Height")}}
  - {{HTTPHeader("Sec-CH-Viewport-Width")}}
- {{HTTPHeader("Accept-CH")}}
- [HTTP Caching: Vary](/en-US/docs/Web/HTTP/Guides/Caching#vary) và {{HTTPHeader("Vary")}}
- [Improving user privacy and developer experience with User-Agent Client Hints](https://developer.chrome.com/docs/privacy-security/user-agent-client-hints) trên developer.chrome.com (2020)
