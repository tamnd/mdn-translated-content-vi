---
title: "Document: phương thức getElementsByName()"
short-title: getElementsByName()
slug: Web/API/Document/getElementsByName
page-type: web-api-instance-method
browser-compat: api.Document.getElementsByName
---

{{APIRef("DOM")}}

Phương thức **`getElementsByName()`** của đối tượng {{domxref("Document")}} trả về một bộ sưu tập {{domxref("NodeList")}} gồm các phần tử có thuộc tính `name` đã cho trong tài liệu.

## Cú pháp

```js-nolint
getElementsByName(name)
```

### Tham số

- `name`
  - : Giá trị của thuộc tính `name` của (các) phần tử chúng ta đang tìm.

### Giá trị trả về

Một bộ sưu tập {{domxref("NodeList")}} trực tiếp, nghĩa là nó tự động cập nhật khi các phần tử mới có cùng `name` được thêm vào hoặc xóa khỏi tài liệu.

## Ví dụ

```html
<!doctype html>
<html lang="en">
  <head>
    <title>Ví dụ: sử dụng document.getElementsByName</title>
  </head>
  <body>
    <input type="hidden" name="up" />
    <input type="hidden" name="down" />
  </body>
</html>
```

```js
const upNames = document.getElementsByName("up");
console.log(upNames[0].tagName); // hiển thị "INPUT"
```

## Ghi chú

Thuộc tính `name` chỉ có thể được áp dụng trong tài liệu (X)HTML.

Bộ sưu tập {{domxref("NodeList")}} trả về chứa _tất cả_ các phần tử có `name` đã cho, chẳng hạn như {{htmlelement("meta")}}, {{htmlelement("object")}}, và thậm chí các phần tử không hỗ trợ thuộc tính `name`.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("document.getElementById()")}} để trả về tham chiếu đến một phần tử theo `id` duy nhất của nó
- {{domxref("document.getElementsByTagName()")}} để trả về tham chiếu đến các phần tử có cùng [tên thẻ](/en-US/docs/Web/API/Element/tagName)
- {{domxref("document.querySelector()")}} để trả về tham chiếu đến các phần tử qua bộ chọn CSS như `'div.myclass'`
