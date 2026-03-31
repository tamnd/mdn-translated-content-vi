---
title: Cross-Origin-Resource-Policy (CORP) header
short-title: Cross-Origin-Resource-Policy
slug: Web/HTTP/Reference/Headers/Cross-Origin-Resource-Policy
page-type: http-header
browser-compat: http.headers.Cross-Origin-Resource-Policy
sidebar: http
---

Tiêu đề HTTP **`Cross-Origin-Resource-Policy`** {{Glossary("response header")}} (CORP) cho biết rằng trình duyệt nên chặn các yêu cầu [`no-cors`](/en-US/docs/Web/API/RequestInit#no-cors) khác nguồn gốc hoặc khác trang web đến tài nguyên đã cho.

Nó chỉ định chính sách của chủ sở hữu tài nguyên về những trang web/nguồn gốc nào được phép tải tài nguyên này.

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
Cross-Origin-Resource-Policy: same-site | same-origin | cross-origin
```

### Chỉ thị

- `same-site`
  - : Tài nguyên chỉ có thể được tải từ cùng trang web.

- `same-origin`
  - : Tài nguyên chỉ có thể được tải từ cùng nguồn gốc.

- `cross-origin`
  - : Tài nguyên có thể được tải bởi bất kỳ nguồn gốc/trang web nào khác.

## Ví dụ

Để biết thêm ví dụ, xem https://resourcepolicy.fyi/.

### Không cho phép yêu cầu no-cors khác nguồn gốc

Tiêu đề `Cross-Origin-Resource-Policy` dưới đây sẽ khiến các tác nhân người dùng tương thích không cho phép yêu cầu no-cors khác nguồn gốc:

```http
Cross-Origin-Resource-Policy: same-origin
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Giải thích về Cross-Origin Resource Policy (CORP)](/en-US/docs/Web/HTTP/Guides/Cross-Origin_Resource_Policy)
- [Cân nhắc triển khai Cross-Origin Resource Policy](https://resourcepolicy.fyi/)
- {{HTTPHeader("Cross-Origin-Embedder-Policy")}}
- {{HTTPHeader("Access-Control-Allow-Origin")}}
