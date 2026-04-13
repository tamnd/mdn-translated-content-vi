---
title: "HTMLTableSectionElement: phương thức insertRow()"
short-title: insertRow()
slug: Web/API/HTMLTableSectionElement/insertRow
page-type: web-api-instance-method
browser-compat: api.HTMLTableSectionElement.insertRow
---

{{APIRef("HTML DOM")}}

Phương thức **`insertRow()`** của giao diện {{domxref("HTMLTableSectionElement")}} chèn một hàng mới ({{HtmlElement("tr")}}) vào phần tử phân đoạn bảng đã cho ({{HTMLElement("thead")}}, {{HTMLElement("tfoot")}}, hoặc {{HTMLElement("tbody")}}), sau đó trả về tham chiếu đến hàng mới này.

> [!NOTE]
> `insertRow()` chèn hàng trực tiếp vào phần. Hàng không cần được thêm riêng như sẽ là trường hợp nếu {{domxref("Document.createElement()")}} đã được sử dụng để tạo phần tử `<tr>` mới.

## Cú pháp

```js-nolint
insertRow()
insertRow(index)
```

### Tham số

- `index` {{optional_inline}}
  - : Chỉ mục hàng của hàng mới. Nếu `index` là `-1` hoặc bằng số hàng, hàng sẽ được thêm vào là hàng cuối cùng. Nếu `index` bị bỏ qua, mặc định là `-1`.

### Giá trị trả về

Một {{domxref("HTMLTableRowElement")}} tham chiếu đến hàng mới.

### Ngoại lệ

- `IndexSizeError` {{domxref("DOMException")}}
  - : Được ném nếu `index` lớn hơn số hàng, hoặc nhỏ hơn `-1`.

## Ví dụ

Trong ví dụ này, hai nút cho phép bạn thêm và xóa hàng khỏi phần body của bảng; nó cũng cập nhật phần tử {{HTMLElement("output")}} với số hàng hiện có trong bảng.

### HTML

```html
<table>
  <thead>
    <tr>
      <th>Col 1</th>
      <th>Col 2</th>
      <th>Col 3</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>X</td>
      <td>Y</td>
      <td>Z</td>
    </tr>
  </tbody>
</table>
<button id="add">Add a row</button>
<button id="remove">Remove last row</button>
<div>This table's body has <output>1</output> row(s).</div>
```

```css hidden
table {
  border-collapse: collapse;
}

th,
td {
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
const rows = bodySection.rows; // The collection is live, therefore always up-to-date
const rowNumberDisplay = document.querySelectorAll("output")[0];

const addButton = document.getElementById("add");
const removeButton = document.getElementById("remove");

function updateRowNumber() {
  rowNumberDisplay.textContent = rows.length;
}

addButton.addEventListener("click", () => {
  // Add a new row at the end of the body
  const newRow = bodySection.insertRow();

  // Add cells inside the new row
  ["A", "B", "C"].forEach(
    (elt) => (newRow.insertCell().textContent = `${elt}${rows.length}`),
  );

  // Update the row counter
  updateRowNumber();
});

removeButton.addEventListener("click", () => {
  // Delete the row from the body
  bodySection.deleteRow(-1);

  // Update the row counter
  updateRowNumber();
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
- {{domxref("HTMLTableElement.insertRow()")}}
