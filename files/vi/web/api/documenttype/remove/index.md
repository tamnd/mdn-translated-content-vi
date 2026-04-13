---
title: "DocumentType: phương thức remove()"
short-title: remove()
slug: Web/API/DocumentType/remove
page-type: web-api-instance-method
browser-compat: api.DocumentType.remove
---

{{APIRef("DOM")}}

Phương thức **`DocumentType.remove()`** xóa `doctype` của tài liệu. Nếu nó đã bị tách khỏi tài liệu, việc gọi `remove()` sẽ không làm gì cả.

## Cú pháp

```js-nolint
remove()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Sử dụng `remove()`

```js
document.doctype; // "<!doctype html>'
document.doctype.remove();
document.doctype; // null
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document.doctype")}}
- {{domxref("CharacterData.remove()")}}
- {{domxref("Element.remove()")}}
