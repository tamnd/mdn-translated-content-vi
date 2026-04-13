---
title: "HTMLTableRowElement: thuộc tính cells"
short-title: cells
slug: Web/API/HTMLTableRowElement/cells
page-type: web-api-instance-property
browser-compat: api.HTMLTableRowElement.cells
---

{{ APIRef("HTML DOM") }}

Thuộc tính chỉ đọc **`cells`** của giao diện {{domxref("HTMLTableRowElement")}} trả về một {{domxref("HTMLCollection")}} trực tiếp chứa các ô trong hàng. `HTMLCollection` này là trực tiếp và được cập nhật tự động khi các ô được thêm hoặc xóa.

## Giá trị

Một {{domxref("HTMLCollection")}} trực tiếp gồm các đối tượng {{domxref("HTMLTableCellElement")}}.

## Ví dụ

Ví dụ này sử dụng `HTMLTableRowElement.cells` để hiển thị số lượng ô trong một hàng.

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

- {{domxref("HTMLTableRowElement.insertCell()")}}
- {{domxref("HTMLTableRowElement.deleteCell()")}}
