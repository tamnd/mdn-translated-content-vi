---
title: Sec-Fetch-Site header
short-title: Sec-Fetch-Site
slug: Web/HTTP/Reference/Headers/Sec-Fetch-Site
page-type: http-header
browser-compat: http.headers.Sec-Fetch-Site
sidebar: http
---

Tiêu đề HTTP **`Sec-Fetch-Site`** {{Glossary("fetch metadata request header")}} cho biết mối quan hệ giữa nguồn gốc của bộ khởi tạo yêu cầu và nguồn gốc của tài nguyên được yêu cầu.

Nói cách khác, tiêu đề này báo cho máy chủ biết liệu yêu cầu tài nguyên đến từ cùng nguồn gốc, cùng trang web, trang web khác, hay là yêu cầu "do người dùng khởi tạo". Máy chủ sau đó có thể sử dụng thông tin này để quyết định xem có nên cho phép yêu cầu hay không.

Các yêu cầu cùng nguồn gốc thường được cho phép theo mặc định, nhưng điều xảy ra với các yêu cầu từ các nguồn gốc khác có thể phụ thuộc thêm vào tài nguyên đang được yêu cầu, hoặc thông tin trong {{Glossary("fetch metadata request header")}} khác. Theo mặc định, các yêu cầu không được chấp nhận nên bị từ chối với mã phản hồi {{HTTPStatus("403")}}.

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
Sec-Fetch-Site: cross-site
Sec-Fetch-Site: same-origin
Sec-Fetch-Site: same-site
Sec-Fetch-Site: none
```

## Chỉ thị

- `cross-site`
  - : Bộ khởi tạo yêu cầu và máy chủ lưu trữ tài nguyên có trang web khác nhau (tức là yêu cầu từ "potentially-evil.com" cho tài nguyên tại "example.com").
- `same-origin`
  - : Bộ khởi tạo yêu cầu và máy chủ lưu trữ tài nguyên có cùng {{Glossary("origin")}} (cùng scheme, host và port).
- `same-site`
  - : Bộ khởi tạo yêu cầu và máy chủ lưu trữ tài nguyên có cùng {{glossary("site")}}, bao gồm cả scheme.
- `none`
  - : Yêu cầu này là thao tác do người dùng khởi tạo. Ví dụ: nhập URL vào thanh địa chỉ, mở bookmark, hoặc kéo và thả tệp vào cửa sổ trình duyệt.

## Ví dụ

Yêu cầu fetch đến `https://mysite.example/foo.json` xuất phát từ trang web trên `https://mysite.example` (với cùng port) là yêu cầu same-origin.
Trình duyệt sẽ tạo tiêu đề `Sec-Fetch-Site: same-origin` như được hiển thị bên dưới, và máy chủ thường sẽ cho phép yêu cầu:

```http
GET /foo.json
Sec-Fetch-Dest: empty
Sec-Fetch-Mode: cors
Sec-Fetch-Site: same-origin
```

Yêu cầu fetch đến cùng URL từ trang web khác, ví dụ `potentially-evil.com`, khiến trình duyệt tạo tiêu đề khác (ví dụ: `Sec-Fetch-Site: cross-site`), mà máy chủ có thể chọn chấp nhận hoặc từ chối:

```http
GET /foo.json
Sec-Fetch-Dest: empty
Sec-Fetch-Mode: cors
Sec-Fetch-Site: cross-site
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Sec-Fetch-Mode")}}, {{HTTPHeader("Sec-Fetch-User")}}, {{HTTPHeader("Sec-Fetch-Dest")}} fetch metadata request headers
- [Protect your resources from web attacks with Fetch Metadata](https://web.dev/articles/fetch-metadata) (web.dev)
- [Fetch Metadata Request Headers playground](https://secmetadata.appspot.com/) (secmetadata.appspot.com)
