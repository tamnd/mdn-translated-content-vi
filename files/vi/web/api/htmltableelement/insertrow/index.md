---
title: "HTMLTableElement: phương thức insertRow()"
short-title: insertRow()
slug: Web/API/HTMLTableElement/insertRow
page-type: web-api-instance-method
browser-compat: api.HTMLTableElement.insertRow
---

{{APIRef("HTML DOM")}}

Phương thức **`insertRow()`** của giao diện {{domxref("HTMLTableElement")}} chèn một hàng mới ({{HtmlElement("tr")}}) vào một {{HtmlElement("table")}} đã cho và trả về tham chiếu đến hàng mới.

Nếu một bảng có nhiều phần tử {{HtmlElement("tbody")}}, theo mặc định hàng mới sẽ được chèn vào `<tbody>` cuối cùng.
Để chèn hàng vào một phần cụ thể, hãy dùng {{domxref("HTMLTableSectionElement.insertRow()")}}

> [!NOTE]
> `insertRow()` chèn hàng trực tiếp vào bảng. Hàng không cần được thêm riêng lẻ như trường hợp khi dùng {{domxref("Document.createElement()")}} để tạo phần tử `<tr>` mới.

## Cú pháp

```js-nolint
insertRow()
insertRow(index)
```

{{domxref("HTMLTableElement")}} là tham chiếu đến phần tử {{HtmlElement("table")}} HTML.

### Tham số

- `index` {{optional_inline}}
  - : Chỉ số hàng của hàng mới. Nếu `index` là `-1` hoặc bằng số lượng hàng, hàng sẽ được thêm vào cuối cùng.
    Nếu bỏ qua `index`, giá trị mặc định là `-1`.

### Giá trị trả về

Một {{domxref("HTMLTableRowElement")}} tham chiếu đến hàng mới.

### Ngoại lệ

- `IndexSizeError` {{domxref("DOMException")}}
  - : Được ném nếu `index` lớn hơn số lượng hàng.

## Ví dụ

Ví dụ này dùng `insertRow(-1)` để thêm một hàng mới vào cuối bảng.

Sau đó chúng ta dùng {{domxref("HTMLTableRowElement.insertCell()")}} để chèn một ô mới vào hàng mới. (Để HTML hợp lệ, một `<tr>` phải có ít nhất một phần tử `<td>`.) Cuối cùng, chúng ta thêm một số văn bản vào ô bằng {{domxref("Document.createTextNode()")}} và {{domxref("Node.appendChild()")}}.

### HTML

```html
<table id="my-table">
  <tbody>
    <tr>
      <td>Row 1</td>
    </tr>
    <tr>
      <td>Row 2</td>
    </tr>
    <tr>
      <td>Row 3</td>
    </tr>
  </tbody>
</table>
```

### JavaScript

```js
function addRow(tableID) {
  // Get a reference to the table
  let tableRef = document.getElementById(tableID);

  // Insert a row at the end of the table
  let newRow = tableRef.insertRow(-1);

  // Insert a cell in the row at index 0
  let newCell = newRow.insertCell(0);

  // Append a text node to the cell
  let newText = document.createTextNode("New bottom row");
  newCell.appendChild(newText);
}

// Call addRow() with the table's ID
addRow("my-table");
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLTableRowElement.insertCell()")}}
- {{domxref("HTMLTableSectionElement.insertRow()")}}
