---
title: "HTMLTableCellElement: thuộc tính cellIndex"
short-title: cellIndex
slug: Web/API/HTMLTableCellElement/cellIndex
page-type: web-api-instance-property
browser-compat: api.HTMLTableCellElement.cellIndex
---

{{ APIRef("HTML DOM") }}

Thuộc tính chỉ đọc **`cellIndex`** của giao diện {{domxref("HTMLTableCellElement")}}
đại diện cho vị trí của một ô trong hàng của nó ({{htmlelement("tr")}}). Ô đầu tiên có chỉ số là `0`.

## Giá trị

Trả về chỉ số của ô, hoặc `-1` nếu ô không là một phần của bất kỳ hàng nào.

## Ví dụ

Ví dụ này thêm nhãn cho tất cả các số ô của hàng đầu tiên của `tbody`.

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
      <td>Rice</td>
      <td>$2.5</td>
    </tr>
  </tbody>
</table>
```

```css hidden
table {
  border-collapse: collapse;
}

th,
td,
table {
  border: 1px solid black;
}

button {
  margin: 1em 1em 1em 0;
}
```

### JavaScript

```js
const rows = document.querySelectorAll("tbody tr");
const cells = rows[0].cells;

for (const cell of cells) {
  cell.textContent = `${cell.textContent} (cell #${cell.cellIndex})`;
}
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
