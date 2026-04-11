---
title: "HTMLTableElement: phương thức createCaption()"
short-title: createCaption()
slug: Web/API/HTMLTableElement/createCaption
page-type: web-api-instance-method
browser-compat: api.HTMLTableElement.createCaption
---

{{APIRef("HTML DOM")}}

Phương thức **`HTMLTableElement.createCaption()`** trả về phần tử {{HtmlElement("caption")}} được liên kết với một {{HtmlElement("table")}} đã cho. Nếu bảng không có phần tử `<caption>`, phương thức này sẽ tạo nó rồi trả về.

> [!NOTE]
> Nếu không có caption, `createCaption()` sẽ chèn một caption mới trực tiếp vào bảng. Caption không cần được thêm riêng lẻ như trường hợp dùng {{domxref("Document.createElement()")}} để tạo phần tử `<caption>` mới.

## Cú pháp

```js-nolint
createCaption()
```

### Tham số

Không có.

### Giá trị trả về

{{domxref("HTMLTableCaptionElement")}}

## Ví dụ

Ví dụ này dùng JavaScript để thêm một caption vào bảng vốn ban đầu chưa có caption.

### HTML

```html
<table>
  <tbody>
    <tr>
      <td>Cell 1.1</td>
      <td>Cell 1.2</td>
      <td>Cell 1.3</td>
    </tr>
    <tr>
      <td>Cell 2.1</td>
      <td>Cell 2.2</td>
      <td>Cell 2.3</td>
    </tr>
  </tbody>
</table>
```

### JavaScript

```js
let table = document.querySelector("table");
let caption = table.createCaption();
caption.textContent = "This caption was created by JavaScript!";
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
