---
title: Sec-Fetch-Mode header
short-title: Sec-Fetch-Mode
slug: Web/HTTP/Reference/Headers/Sec-Fetch-Mode
page-type: http-header
browser-compat: http.headers.Sec-Fetch-Mode
sidebar: http
---

Tiêu đề HTTP **`Sec-Fetch-Mode`** {{Glossary("fetch metadata request header")}} cho biết [chế độ](/en-US/docs/Web/API/Request/mode) của yêu cầu.

Nói một cách đơn giản, điều này cho phép máy chủ phân biệt giữa các yêu cầu xuất phát từ người dùng điều hướng giữa các trang HTML và các yêu cầu để tải hình ảnh và các tài nguyên khác.
Ví dụ: tiêu đề này sẽ chứa `navigate` cho các yêu cầu điều hướng cấp cao, trong khi `no-cors` được sử dụng để tải hình ảnh.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Fetch Metadata Request Header")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Có (tiền tố <code>Sec-</code>)</td>
    </tr>
    <tr>
      <th scope="row">
        {{Glossary("CORS-safelisted request header")}}
      </th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Sec-Fetch-Mode: cors
Sec-Fetch-Mode: navigate
Sec-Fetch-Mode: no-cors
Sec-Fetch-Mode: same-origin
Sec-Fetch-Mode: websocket
```

Máy chủ nên bỏ qua tiêu đề này nếu nó chứa bất kỳ giá trị nào khác.

## Chỉ thị

> [!NOTE]
> Các chỉ thị này tương ứng với các giá trị trong [`Request.mode`](/en-US/docs/Web/API/Request/mode#value).

- `cors`
  - : Yêu cầu là yêu cầu [giao thức CORS](/en-US/docs/Web/HTTP/Guides/CORS).
- `navigate`
  - : Yêu cầu được khởi tạo bởi điều hướng giữa các tài liệu HTML.
- `no-cors`
  - : Yêu cầu là yêu cầu no-cors (xem [`Request.mode`](/en-US/docs/Web/API/Request/mode#value)).
- `same-origin`
  - : Yêu cầu được thực hiện từ cùng nguồn gốc với tài nguyên đang được yêu cầu.
- `websocket`
  - : Yêu cầu đang được thực hiện để thiết lập kết nối [WebSocket](/en-US/docs/Web/API/WebSockets_API).

## Ví dụ

### Sử dụng Sec-Fetch-Mode

Nếu người dùng nhấp vào liên kết trang đến một trang khác trên cùng nguồn gốc, yêu cầu kết quả sẽ có các tiêu đề sau (lưu ý rằng chế độ là `navigate`):

```http
Sec-Fetch-Dest: document
Sec-Fetch-Mode: navigate
Sec-Fetch-Site: same-origin
Sec-Fetch-User: ?1
```

Yêu cầu cross-site được tạo bởi phần tử {{HTMLElement("img")}} sẽ dẫn đến yêu cầu với các tiêu đề HTTP sau (lưu ý rằng chế độ là `no-cors`):

```http
Sec-Fetch-Dest: image
Sec-Fetch-Mode: no-cors
Sec-Fetch-Site: cross-site
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Sec-Fetch-Dest")}}, {{HTTPHeader("Sec-Fetch-Site")}}, {{HTTPHeader("Sec-Fetch-User")}} fetch metadata request headers
- [Protect your resources from web attacks with Fetch Metadata](https://web.dev/articles/fetch-metadata) (web.dev)
- [Fetch Metadata Request Headers playground](https://secmetadata.appspot.com/) (secmetadata.appspot.com)
