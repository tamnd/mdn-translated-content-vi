---
title: "HTMLTableRowElement: phương thức insertCell()"
short-title: insertCell()
slug: Web/API/HTMLTableRowElement/insertCell
page-type: web-api-instance-method
browser-compat: api.HTMLTableRowElement.insertCell
---

{{APIRef("HTML DOM")}}

Phương thức **`insertCell()`** của giao diện {{domxref("HTMLTableRowElement")}} chèn một ô mới ({{HtmlElement("td")}}) vào một hàng của bảng ({{HtmlElement("tr")}}) và trả về tham chiếu đến ô đó.

> [!NOTE]
> `insertCell()` chèn ô trực tiếp vào hàng. Ô không cần được thêm riêng bằng {{domxref("Node.appendChild()")}} như trường hợp sử dụng {{domxref("Document.createElement()")}} để tạo phần tử `<td>` mới.
>
> Tuy nhiên, bạn không thể dùng `insertCell()` để tạo phần tử `<th>` mới.

## Cú pháp

```js-nolint
insertCell()
insertCell(index)
```

### Tham số

- `index` {{optional_inline}}
  - : Chỉ số ô của ô mới. Nếu `index` là `-1` hoặc bằng số lượng ô, ô được thêm vào cuối hàng. Nếu `index` bị bỏ qua, mặc định là `-1`.

### Giá trị trả về

Một {{domxref("HTMLTableCellElement")}} tham chiếu đến ô mới.

### Ngoại lệ

- `IndexSizeError` {{domxref("DOMException")}}
  - : Được ném ra nếu `index` lớn hơn số lượng ô.

## Ví dụ

Ví dụ này sử dụng `HTMLTableRowElement.insertCell()` để thêm một ô mới vào hàng.

### HTML

```html
<table>
  <thead>
    <tr>
      <th>C1</th>
      <th>C2</th>
      <th>C3</th>
      <th>C4</th>
      <th>C5</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Cell 1</td>
      <td>Cell 2</td>
    </tr>
  </tbody>
</table>

<button id="add">Add a cell</button>
<button id="remove">Remove last cell</button>
<div>This first row has <output>2</output> cell(s).</div>
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
const bodySection = document.querySelectorAll("tbody")[0];
const row = bodySection.rows[0]; // Select the first row of the body section
const cells = row.cells; // The collection is live, therefore always up-to-date
const cellNumberDisplay = document.querySelectorAll("output")[0];

const addButton = document.getElementById("add");
const removeButton = document.getElementById("remove");

function updateCellNumber() {
  cellNumberDisplay.textContent = cells.length;
}

addButton.addEventListener("click", () => {
  // Add a new cell at the end of the first row
  const newCell = row.insertCell();
  newCell.textContent = `Cell ${cells.length}`;

  // Update the row counter
  updateCellNumber();
});

removeButton.addEventListener("click", () => {
  // Delete the row from the body
  row.deleteCell(-1);

  // Update the row counter
  updateCellNumber();
});
```

### Kết quả

{{EmbedLiveSample("Examples", "100%", 175)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLTableElement.insertRow()")}}
- Phần tử HTML đại diện cho các ô: {{domxref("HTMLTableCellElement")}}
