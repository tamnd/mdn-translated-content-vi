---
title: "Document: phương thức hasPrivateToken()"
short-title: hasPrivateToken()
slug: Web/API/Document/hasPrivateToken
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.Document.hasPrivateToken
---

{{APIRef("Storage Access API")}}{{SeeCompatTable}}

Phương thức **`hasPrivateToken()`** của giao diện {{domxref("Document")}} trả về một promise sẽ được phân giải với một giá trị boolean cho biết trình duyệt có lưu trữ [private state token](/en-US/docs/Web/API/Private_State_Token_API) từ một máy chủ phát hành cụ thể hay không.

## Cú pháp

```js-nolint
hasPrivateToken(issuer)
```

### Tham số

- `issuer`
  - : Một chuỗi đại diện cho URL của máy chủ phát hành.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải với một giá trị boolean cho biết trình duyệt có lưu trữ private state token từ máy chủ phát hành đã chỉ định hay không.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref("Document")}} hiện tại chưa hoạt động.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu:
    - {{domxref("Document")}} hiện tại không được tải trong [secure context](/en-US/docs/Glossary/Secure_Context).
    - Số lượng máy phát hành tối đa theo [origin](/en-US/docs/Glossary/Origin) cấp cao nhất (hai) đã bị vượt quá.
- `TypeError` {{domxref("DOMException")}}
  - : Được ném ra nếu `issuer` không phải là URL hợp lệ.

## Ví dụ

```js
const hasToken = await Document.hasPrivateToken(`issuer.example`);
if (!hasToken) {
  await fetch(
    "https://issuer.example/.well-known/private-state-token/issuance",
    {
      method: "POST",
      privateToken: {
        version: 1,
        operation: "token-request",
      },
    },
  );
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Private State Token API](/en-US/docs/Web/API/Private_State_Token_API)
