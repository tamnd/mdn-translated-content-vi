---
title: Sec-Private-State-Token-Lifetime header
short-title: Sec-Private-State-Token-Lifetime
slug: Web/HTTP/Reference/Headers/Sec-Private-State-Token-Lifetime
page-type: http-header
status:
  - experimental
browser-compat: http.headers.Sec-Private-State-Token-Lifetime
sidebar: http
---

{{SeeCompatTable}}

Tiêu đề HTTP **`Sec-Private-State-Token-Lifetime`** {{Glossary("Response Header")}} được dùng bởi [Private State Token API](/en-US/docs/Web/API/Private_State_Token_API) trong quá trình [đổi token](/en-US/docs/Web/API/Private_State_Token_API/Using#redeeming_tokens_2). Nó được gửi bởi máy chủ đổi token để chỉ ra cho trình duyệt biết bản ghi đổi token nên được lưu vào bộ nhớ đệm bao lâu (tính bằng giây). Bản ghi đổi token được gửi trong tiêu đề phản hồi {{httpheader("Sec-Private-State-Token")}}.

Nếu tiêu đề `Sec-Private-State-Token-Lifetime` bị bỏ qua, thời gian sống của bản ghi đổi token sẽ gắn với thời gian sống của khóa xác minh token đã xác nhận việc phát hành token được đổi.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Response Header")}}</td>
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
Sec-Private-State-Token-Lifetime: <integer>
```

Máy chủ nên bỏ qua tiêu đề này nếu nó chứa bất kỳ giá trị nào khác.

## Chỉ thị

- `<integer>`
  - : Một số nguyên chỉ định thời gian sống của bản ghi đổi token được gửi, tính bằng giây.

## Ví dụ

```http
Sec-Private-State-Token-Lifetime: 604800
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{httpheader("Sec-Private-State-Token")}}
- {{httpheader("Sec-Private-State-Token-Crypto-Version")}}
- {{httpheader("Sec-Redemption-Record")}}
- [Private State Token API](/en-US/docs/Web/API/Private_State_Token_API)
