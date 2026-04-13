---
title: "HTMLTableCellElement: thuộc tính rowSpan"
short-title: rowSpan
slug: Web/API/HTMLTableCellElement/rowSpan
page-type: web-api-instance-property
browser-compat: api.HTMLTableCellElement.rowSpan
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`rowSpan`** của giao diện {{domxref("HTMLTableCellElement")}} đại diện cho số hàng mà ô này phải trải rộng; điều này cho phép ô chiếm không gian trên nhiều hàng của bảng. Nó phản ánh thuộc tính [`rowspan`](/en-US/docs/Web/HTML/Reference/Elements/td#colspan).

## Giá trị

Một số dương đại diện cho số hàng. Nếu là `0`, nó có nghĩa là tất cả các hàng còn lại trong cột.

> [!NOTE]
> Khi đặt một giá trị mới, một giá trị khác 0 được _kẹp_ đến số dương nghiêm ngặt gần nhất.

## Ví dụ

Ví dụ này cung cấp hai nút để sửa đổi độ trải rộng hàng của ô đầu tiên của phần thân.

### HTML

```html
<table>
  <thead>
    <tr>
      <th>Col 1</th>
      <th>Col 2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1</td>
      <td>1</td>
    </tr>
    <tr>
      <td rowspan="2">2</td>
      <td>2</td>
    </tr>
    <tr>
      <td>3</td>
      <td>3</td>
    </tr>
    <tr>
      <td>4</td>
      <td>4</td>
    </tr>
  </tbody>
</table>
<button id="increase">Increase rowspan</button>
<button id="decrease">Decrease rowspan</button>
<div>The second cell of the first column spans <output>2</output> row(s).</div>
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
// Obtain relevant interface elements
const row = document.querySelectorAll("tbody tr")[1];
const cell = row.cells[0];
const output = document.querySelectorAll("output")[0];

const increaseButton = document.getElementById("increase");
const decreaseButton = document.getElementById("decrease");

increaseButton.addEventListener("click", () => {
  cell.rowSpan += 1;

  // Update the display
  output.textContent = cell.rowSpan;
});

decreaseButton.addEventListener("click", () => {
  cell.rowSpan -= 1;

  // Update the display
  output.textContent = `${cell.rowSpan === 0 ? "all remaining" : cell.rowSpan}`;
});
```

### Kết quả

{{EmbedLiveSample("Examples", "100%", 180)}}

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLTableCellElement.colSpan")}}
- {{domxref("HTMLTableColElement.span")}}
