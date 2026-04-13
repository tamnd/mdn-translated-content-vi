---
title: "HTMLTableCellElement: thuộc tính colSpan"
short-title: colSpan
slug: Web/API/HTMLTableCellElement/colSpan
page-type: web-api-instance-property
browser-compat: api.HTMLTableCellElement.colSpan
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`colSpan`** của giao diện {{domxref("HTMLTableCellElement")}} đại diện cho số cột mà ô này phải trải rộng; điều này cho phép ô chiếm không gian trên nhiều cột của bảng. Nó phản ánh thuộc tính [`colspan`](/en-US/docs/Web/HTML/Reference/Elements/td#colspan).

## Giá trị

Một số dương đại diện cho số cột.

> [!NOTE]
> Khi đặt một giá trị mới, giá trị được _kẹp_ đến số dương nghiêm ngặt gần nhất.

## Ví dụ

Ví dụ này cung cấp hai nút để sửa đổi độ trải rộng cột của ô đầu tiên của phần thân.

### HTML

```html
<table>
  <thead>
    <tr>
      <th>Col 1</th>
      <th>Col 2</th>
      <th>Col 3</th>
      <th>Col 4</th>
      <th>Col 5</th>
      <th>Col 6</th>
      <th>Col 7</th>
      <th>Col 8</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2">1</td>
      <td>2</td>
      <td>3</td>
      <td>4</td>
      <td>5</td>
      <td>6</td>
      <td>7</td>
      <td>8</td>
    </tr>
  </tbody>
</table>
<button id="increase">Increase colspan</button>
<button id="decrease">Decrease colspan</button>
<div>The first cell spans <output>2</output> column(s).</div>
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
const cell = document.querySelectorAll("tbody tr td")[0];
const output = document.querySelectorAll("output")[0];

const increaseButton = document.getElementById("increase");
const decreaseButton = document.getElementById("decrease");

increaseButton.addEventListener("click", () => {
  cell.colSpan += 1;

  // Update the display
  output.textContent = cell.colSpan;
});

decreaseButton.addEventListener("click", () => {
  cell.colSpan -= 1;

  // Update the display
  output.textContent = cell.colSpan;
});
```

### Kết quả

{{EmbedLiveSample("Examples", "100%", 175)}}

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLTableCellElement.rowSpan")}}
- {{domxref("HTMLTableColElement.span")}}
