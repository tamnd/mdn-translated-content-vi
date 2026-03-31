---
title: Sec-Private-State-Token header
short-title: Sec-Private-State-Token
slug: Web/HTTP/Reference/Headers/Sec-Private-State-Token
page-type: http-header
status:
  - experimental
browser-compat: http.headers.Sec-Private-State-Token
sidebar: http
---

{{SeeCompatTable}}

Tiêu đề HTTP **`Sec-Private-State-Token`** tồn tại cả hai dạng tiêu đề yêu cầu và tiêu đề phản hồi. Nó được dùng bởi [Private State Token API](/en-US/docs/Web/API/Private_State_Token_API) trong các yêu cầu phát hành và đổi token để truyền dữ liệu yêu cầu và dữ liệu phản hồi.

Trong quá trình [phát hành token](/en-US/docs/Web/API/Private_State_Token_API/Using#issuing_tokens_2), tiêu đề yêu cầu `Sec-Private-State-Token` chứa một tập hợp các nonce chưa ký, bị che khuất cần thiết để tạo private state token đến máy chủ phát hành. Phản hồi thành công phải bao gồm tiêu đề phản hồi `Sec-Private-State-Token` chứa các chữ ký bị che khuất, sau đó trình duyệt sẽ bỏ che khuất và lưu cùng với các nonce gốc không bị che khuất trong kho token bảo mật.

Trong quá trình [đổi token](/en-US/docs/Web/API/Private_State_Token_API/Using#redeeming_tokens_2), tiêu đề yêu cầu `Sec-Private-State-Token` chứa một token đã ký, không bị che khuất duy nhất cùng với metadata đổi token liên quan. Phản hồi thành công phải bao gồm tiêu đề phản hồi `Sec-Private-State-Token` chứa bản ghi đổi token đã ký, được trình duyệt lưu trữ bảo mật một lần nữa.

Lưu ý rằng một nhà phát triển không cần phải tạo tiêu đề yêu cầu `Sec-Private-State-Token` — chúng được tạo tự động bởi trình duyệt khi gọi các yêu cầu fetch `token-request` và `token-redemption` của private state token.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Fetch Metadata Request Header")}}, {{Glossary("Response header")}}</td>
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
Sec-Private-State-Token: <string>
```

Máy chủ nên bỏ qua tiêu đề này nếu nó chứa bất kỳ giá trị nào khác.

## Chỉ thị

- `<string>`
  - : Một chuỗi chứa dữ liệu cần thiết cho các yêu cầu và phản hồi thao tác phát hành và đổi private state token.

## Ví dụ

Tiêu đề yêu cầu mẫu được gửi trong quá trình phát hành token:

```http
Sec-Private-State-Token: AEB9WGWUx398Pdr0SFE7NDo…
```

Tiêu đề phản hồi mẫu:

```http
Sec-Private-State-Token: AEB9WGWUxj1085Cuk2qmt3y…
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{httpheader("Sec-Private-State-Token-Crypto-Version")}}
- {{httpheader("Sec-Private-State-Token-Lifetime")}}
- {{httpheader("Sec-Redemption-Record")}}
- [Private State Token API](/en-US/docs/Web/API/Private_State_Token_API)
