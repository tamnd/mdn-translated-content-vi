---
title: "Document: phương thức close()"
short-title: close()
slug: Web/API/Document/close
page-type: web-api-instance-method
browser-compat: api.Document.close
---

{{APIRef("DOM")}}

Phương thức **`Document.close()`** hoàn tất việc ghi vào một tài liệu, được mở bằng {{domxref("Document.open()")}}.

## Cú pháp

```js-nolint
close()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
// Open a document to write to it
document.open();

// Write the content of the document
document.write("<p>The one and only content.</p>");

// Close the document
document.close();
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
