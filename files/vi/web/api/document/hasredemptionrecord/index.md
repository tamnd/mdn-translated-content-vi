---
title: "Document: phương thức hasRedemptionRecord()"
short-title: hasRedemptionRecord()
slug: Web/API/Document/hasRedemptionRecord
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.Document.hasRedemptionRecord
---

{{APIRef("Storage Access API")}}{{SeeCompatTable}}

Phương thức **`hasRedemptionRecord()`** của giao diện {{domxref("Document")}} trả về một promise sẽ được phân giải với một giá trị boolean cho biết trình duyệt có [redemption record](/en-US/docs/Web/API/Private_State_Token_API/Using#redeeming_tokens) bắt nguồn từ một nhà phát hành cụ thể hay không.

## Cú pháp

```js-nolint
hasRedemptionRecord(issuer)
```

### Tham số

- `issuer`
  - : Một chuỗi đại diện cho URL của máy chủ phát hành.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải với một giá trị boolean cho biết trình duyệt có lưu trữ redemption record bắt nguồn từ máy chủ phát hành đã chỉ định hay không.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref("Document")}} hiện tại chưa hoạt động.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref("Document")}} hiện tại không được tải trong secure context.
- `TypeError` {{domxref("DOMException")}}
  - : Được ném ra nếu `issuer` không phải là URL hợp lệ.

## Ví dụ

```js
const hasRR = await Document.hasRedemptionRecord(`issuer.example`);
if (hasRR) {
  await fetch("some-resource.example", {
    method: "POST",
    privateToken: {
      version: 1,
      operation: "send-redemption-record",
      issuers: ["https://issuer.example"],
    },
  });
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Private State Token API](/en-US/docs/Web/API/Private_State_Token_API)
