---
title: "Document: phương thức createComment()"
short-title: createComment()
slug: Web/API/Document/createComment
page-type: web-api-instance-method
browser-compat: api.Document.createComment
---

{{APIRef("DOM")}}

**`createComment()`** tạo một nút chú thích mới và trả về nó.

## Cú pháp

```js-nolint
createComment(data)
```

### Tham số

- `data`
  - : Một chuỗi chứa dữ liệu cần được thêm vào Comment.

### Giá trị trả về

Một đối tượng {{domxref("Comment")}} mới.

## Ví dụ

```js
const doc = new DOMParser().parseFromString("<xml></xml>", "application/xml");
const comment = doc.createComment(
  "This is a not-so-secret comment in your document",
);

doc.querySelector("xml").appendChild(comment);

console.log(new XMLSerializer().serializeToString(doc));
// Displays: <xml><!--This is a not-so-secret comment in your document--></xml>
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
