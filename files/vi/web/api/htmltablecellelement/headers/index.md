---
title: "HTMLTableCellElement: thuộc tính headers"
short-title: headers
slug: Web/API/HTMLTableCellElement/headers
page-type: web-api-instance-property
browser-compat: api.HTMLTableCellElement.headers
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`headers`** của giao diện {{domxref("HTMLTableCellElement")}}
chứa một danh sách các ID của các phần tử {{HTMLElement("th")}} là _tiêu đề_ cho ô cụ thể này.

## Giá trị

Một chuỗi chứa các ID được phân tách bằng khoảng trắng.

## Ví dụ

Ví dụ này liệt kê ID của ô được nhấp cuối cùng của bảng:

### HTML

```html
<table>
  <thead>
    <tr>
      <th rowspan="2" id="h">Homework (ID = h)</th>
      <th colspan="3" id="e">Exams (ID = e)</th>
      <th colspan="3" id="p">Projects (ID = p)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th id="e1" headers="e">1 (ID = e1)</th>
      <th id="e2" headers="e">2 (ID = e2)</th>
      <th id="ef" headers="e">Final (ID = ef)</th>
      <th id="p1" headers="p">1 (ID = p1)</th>
      <th id="p2" headers="p">2 (ID = p2)</th>
      <th id="pf" headers="p">Final (ID = pf)</th>
    </tr>
    <tr>
      <td headers="h">15%</td>
      <td headers="e e1">15%</td>
      <td headers="e e2">15%</td>
      <td headers="e ef">20%</td>
      <td headers="p p1">10%</td>
      <td headers="p p2">10%</td>
      <td headers="p pf">15%</td>
    </tr>
  </tbody>
</table>
IDs of headers of the last clicked cell: <output>none</output>.
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
const table = document.querySelector("table");
const output = document.querySelector("output");

table.addEventListener("click", (ev) => {
  output.textContent = ev.target.headers ? ev.target.headers : "none";
});
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
