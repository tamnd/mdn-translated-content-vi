---
title: "HTMLTableRowElement: thuộc tính sectionRowIndex"
short-title: sectionRowIndex
slug: Web/API/HTMLTableRowElement/sectionRowIndex
page-type: web-api-instance-property
browser-compat: api.HTMLTableRowElement.sectionRowIndex
---

{{ APIRef("HTML DOM") }}

Thuộc tính chỉ đọc **`sectionRowIndex`** của giao diện {{domxref("HTMLTableRowElement")}} đại diện cho vị trí của một hàng trong phần bảng hiện tại ({{htmlelement("thead")}}, {{htmlelement("tbody")}} hoặc {{htmlelement("tfoot")}}).

## Giá trị

Chỉ số của hàng, hoặc `-1` nếu hàng không thuộc phần nào.

## Ví dụ

Ví dụ này sử dụng JavaScript để gán nhãn số thứ tự cho tất cả các hàng trong `tbody`.

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
const rows = document.querySelectorAll("tbody tr");

rows.forEach((row) => {
  const z = document.createElement("td");
  z.textContent = `(row #${row.sectionRowIndex})`;
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

- {{domxref("HTMLTableRowElement.rowIndex")}}
