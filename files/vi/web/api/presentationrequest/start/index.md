---
title: "PresentationRequest: start() method"
short-title: start()
slug: Web/API/PresentationRequest/start
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.PresentationRequest.start
---

{{APIRef("Presentation API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính **`start()`** của giao diện {{domxref("PresentationRequest")}} trả về một {{jsxref("Promise")}} được giải quyết với {{domxref("PresentationConnection")}} sau khi user agent nhắc người dùng chọn màn hình và cấp quyền sử dụng màn hình đó.

## Cú pháp

```js-nolint
start()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết với {{domxref("PresentationConnection")}}.

## Bảo mật

[Kích hoạt người dùng tạm thời](/en-US/docs/Web/Security/Defenses/User_activation) là bắt buộc. Người dùng phải tương tác với trang hoặc phần tử UI để tính năng này hoạt động.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
