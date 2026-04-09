---
title: "Comment: Hàm dựng Comment()"
short-title: Comment()
slug: Web/API/Comment/Comment
page-type: web-api-constructor
browser-compat: api.Comment.Comment
---

{{ApiRef("DOM")}}

Hàm dựng **`Comment()`** trả về một đối tượng {{domxref("Comment")}} mới được tạo, với chuỗi tùy chọn được truyền vào tham số làm nội dung văn bản của nó.

## Cú pháp

```js-nolint
new Comment()
new Comment(content)
```

### Tham số

- `content` {{optional_inline}}
  - : Một chuỗi biểu diễn nội dung văn bản của comment.

### Giá trị trả về

Một {{domxref("Comment")}} mới chứa `content`, hoặc chuỗi rỗng nếu không truyền tham số nào.

## Ví dụ

```js
const comment = new Comment("Test");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Chỉ mục các giao diện DOM](/en-US/docs/Web/API/Document_Object_Model)
- {{domxref("Document.createComment()")}} là một lựa chọn thay thế đã lỗi thời cho hàm dựng này.
