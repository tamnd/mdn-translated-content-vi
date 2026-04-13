---
title: "PresentationConnection: send() method"
short-title: send()
slug: Web/API/PresentationConnection/send
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.PresentationConnection.send
---

{{APIRef("Presentation")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`send()`** của giao diện {{domxref("PresentationConnection")}} yêu cầu ngữ cảnh duyệt web điều khiển gửi dữ liệu nhị phân hoặc văn bản đến ngữ cảnh duyệt web đang trình bày.

## Cú pháp

```js-nolint
send(data)
```

### Tham số

- `data`
  - : Dữ liệu cần gửi đến ngữ cảnh trình bày. Đây sẽ là một trong các kiểu:
    - {{jsxref("String")}}
    - {{domxref("Blob")}}
    - {{jsxref("Array")}}

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
