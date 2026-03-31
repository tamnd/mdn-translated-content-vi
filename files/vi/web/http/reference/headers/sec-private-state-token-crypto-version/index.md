---
title: Sec-Private-State-Token-Crypto-Version header
short-title: Sec-Private-State-Token-Crypto-Version
slug: Web/HTTP/Reference/Headers/Sec-Private-State-Token-Crypto-Version
page-type: http-header
status:
  - experimental
browser-compat: http.headers.Sec-Private-State-Token-Crypto-Version
sidebar: http
---

{{SeeCompatTable}}

Tiêu đề HTTP **`Sec-Private-State-Token-Crypto-Version`** {{Glossary("Fetch Metadata Request Header")}} được dùng bởi [Private State Token API](/en-US/docs/Web/API/Private_State_Token_API) trong quá trình [phát hành token](/en-US/docs/Web/API/Private_State_Token_API/Using#issuing_tokens_2) để chỉ ra cho máy chủ phát hành phiên bản giao thức mật mã nào nên được sử dụng để ký các nonce bị che khuất khi tạo token.

Tại thời điểm viết, chỉ có một phiên bản được hỗ trợ, nhưng cơ chế này cho phép hỗ trợ nhiều phiên bản trong tương lai.

Lưu ý rằng một nhà phát triển không cần phải tạo tiêu đề yêu cầu `Sec-Private-State-Token-Crypto-Version` — chúng được tạo tự động bởi trình duyệt khi gọi các yêu cầu fetch `token-request` của private state token.

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
Sec-Private-State-Token-Crypto-Version: <string>
```

Máy chủ nên bỏ qua tiêu đề này nếu nó chứa bất kỳ giá trị nào khác.

## Chỉ thị

- `<string>`
  - : Một chuỗi chứa phiên bản giao thức mật mã mà máy chủ phát hành nên sử dụng để ký các nonce bị che khuất khi tạo token.

## Ví dụ

```http
Sec-Private-State-Token-Crypto-Version: PrivateStateTokenV1VOPRF
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{httpheader("Sec-Private-State-Token")}}
- {{httpheader("Sec-Private-State-Token-Lifetime")}}
- {{httpheader("Sec-Redemption-Record")}}
- [Private State Token API](/en-US/docs/Web/API/Private_State_Token_API)
