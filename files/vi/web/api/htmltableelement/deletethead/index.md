---
title: "HTMLTableElement: phương thức deleteTHead()"
short-title: deleteTHead()
slug: Web/API/HTMLTableElement/deleteTHead
page-type: web-api-instance-method
browser-compat: api.HTMLTableElement.deleteTHead
---

{{APIRef("HTML DOM")}}

Phương thức **`HTMLTableElement.deleteTHead()`** xóa phần tử {{HTMLElement("thead")}} khỏi một {{HtmlElement("table")}} đã cho.

## Cú pháp

```js-nolint
deleteTHead()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Ví dụ này dùng JavaScript để xóa header của bảng.

### HTML

```html
<table>
  <thead>
    <tr>
      <th>Name</th>
      <th>Occupation</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Bob</td>
      <td>Plumber</td>
    </tr>
    <tr>
      <td>Jim</td>
      <td>Roofer</td>
    </tr>
  </tbody>
</table>
```

### JavaScript

```js
let table = document.querySelector("table");
table.deleteTHead();
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
