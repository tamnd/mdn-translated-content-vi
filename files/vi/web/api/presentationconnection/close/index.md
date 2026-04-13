---
title: "PresentationConnection: close() method"
short-title: close()
slug: Web/API/PresentationConnection/close
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.PresentationConnection.close
---

{{APIRef("Presentation API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Khi phương thức `close()` được gọi trên một {{domxref("PresentationConnection")}}, {{Glossary("user agent")}} bắt đầu quá trình đóng kết nối bằng cách gửi một `closeMessage` rỗng với `closeReason` được đặt thành `closed`.

## Cú pháp

```js-nolint
close()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
