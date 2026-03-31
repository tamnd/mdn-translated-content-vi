---
title: Sec-Redemption-Record header
short-title: Sec-Redemption-Record
slug: Web/HTTP/Reference/Headers/Sec-Redemption-Record
page-type: http-header
status:
  - experimental
browser-compat: http.headers.Sec-Redemption-Record
sidebar: http
---

{{SeeCompatTable}}

Tiêu đề HTTP **`Sec-Redemption-Record`** {{Glossary("Fetch Metadata Request Header")}} được sử dụng bởi [Private State Token API](/en-US/docs/Web/API/Private_State_Token_API) khi [chuyển tiếp bản ghi đổi thưởng](/en-US/docs/Web/API/Private_State_Token_API/Using#redemption_record_usage_2). Tiêu đề chứa danh sách các cặp issuer và bản ghi đổi thưởng tương ứng với mỗi bản ghi đổi thưởng.

Lưu ý rằng nhà phát triển không cần tạo các tiêu đề yêu cầu `Sec-Redemption-Record` — chúng được trình duyệt tự động tạo khi gọi các yêu cầu fetch `send-redemption-record` của private state token.

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
Sec-Redemption-Record: <string>
```

Máy chủ nên bỏ qua tiêu đề này nếu nó chứa bất kỳ giá trị nào khác.

## Chỉ thị

- `<string>`
  - : Chuỗi chứa các cặp issuer và bản ghi đổi thưởng.

## Ví dụ

```http
Sec-Redemption-Record: "https://redeemer.example";redemption-record="eyJwdWJsaWNfbWV0YWR...
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{httpheader("Sec-Private-State-Token")}}
- {{httpheader("Sec-Private-State-Token-Crypto-Version")}}
- {{httpheader("Sec-Private-State-Token-Lifetime")}}
- [Private State Token API](/en-US/docs/Web/API/Private_State_Token_API)
