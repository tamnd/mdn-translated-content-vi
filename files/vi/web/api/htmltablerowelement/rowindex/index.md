---
title: "HTMLTableRowElement: thuộc tính rowIndex"
short-title: rowIndex
slug: Web/API/HTMLTableRowElement/rowIndex
page-type: web-api-instance-property
browser-compat: api.HTMLTableRowElement.rowIndex
---

{{ APIRef("HTML DOM") }}

Thuộc tính chỉ đọc **`rowIndex`** của giao diện {{domxref("HTMLTableRowElement")}} đại diện cho vị trí của một hàng trong toàn bộ {{HtmlElement("table")}}.

Dù các phần tử {{HtmlElement("thead")}}, {{HtmlElement("tbody")}} và {{HtmlElement("tfoot")}} bị sắp xếp không theo thứ tự trong HTML, trình duyệt vẫn hiển thị bảng theo đúng thứ tự. Do đó, các hàng được đếm từ `<thead>` đến `<tbody>`, từ `<tbody>` đến `<tfoot>`.

## Giá trị

Chỉ số của hàng, hoặc `-1` nếu hàng không thuộc bảng nào.

## Ví dụ

Ví dụ này sử dụng JavaScript để gán nhãn số thứ tự cho tất cả các hàng trong bảng.

### HTML

```html
<table>
  <thead>
    <tr>
      <th>Item</th>
      <th>Price</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Bananas</td>
      <td>$2</td>
    </tr>
    <tr>
      <td>Oranges</td>
      <td>$8</td>
    </tr>
    <tr>
      <td>Top Sirloin</td>
      <td>$20</td>
    </tr>
  </tbody>
  <tfoot>
    <tr>
      <td>Total</td>
      <td>$30</td>
    </tr>
  </tfoot>
</table>
```

### JavaScript

```js
const rows = document.querySelectorAll("tr");

rows.forEach((row) => {
  const z = document.createElement("td");
  z.textContent = `(row #${row.rowIndex})`;
  row.appendChild(z);
});
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLTableRowElement.sectionRowIndex")}}
