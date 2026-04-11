---
title: "MediaKeySession: phương thức load()"
short-title: load()
slug: Web/API/MediaKeySession/load
page-type: web-api-instance-method
browser-compat: api.MediaKeySession.load
---

{{APIRef("Encrypted Media Extensions")}}{{SecureContext_Header}}

Phương thức `load()` của giao diện {{domxref('MediaKeySession')}} trả về một {{jsxref('Promise')}} phân giải thành giá trị boolean sau khi tải dữ liệu cho một đối tượng phiên được chỉ định.

## Cú pháp

```js-nolint
load(sessionId)
```

### Tham số

- `sessionId`
  - : Một chuỗi duy nhất được tạo bởi module mô tả nội dung cho đối tượng phương tiện hiện tại và các khóa hoặc giấy phép liên kết với nó.

### Giá trị trả về

Một {{jsxref('Promise')}} phân giải thành giá trị boolean cho biết việc tải có thành công hay không.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
