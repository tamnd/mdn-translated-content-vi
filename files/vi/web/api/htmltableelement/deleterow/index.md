---
title: "HTMLTableElement: phương thức deleteRow()"
short-title: deleteRow()
slug: Web/API/HTMLTableElement/deleteRow
page-type: web-api-instance-method
browser-compat: api.HTMLTableElement.deleteRow
---

{{APIRef("HTML DOM")}}

Phương thức **`HTMLTableElement.deleteRow()`** xóa một hàng cụ thể ({{HtmlElement("tr")}}) khỏi một {{HtmlElement("table")}} đã cho.

## Cú pháp

```js-nolint
deleteRow(index)
```

### Tham số

- `index`
  - : `index` là một số nguyên đại diện cho hàng cần xóa.
    Tuy nhiên, chỉ số đặc biệt `-1` có thể được dùng để xóa hàng cuối cùng của bảng.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `IndexSizeError` {{domxref("DOMException")}}
  - : Được ném nếu `index` lớn hơn hoặc bằng số hàng hiện có hoặc là một giá trị âm khác `-1`.

## Ví dụ

Ví dụ này dùng JavaScript để xóa hàng thứ hai của bảng.

### HTML

```html
<table>
  <tbody>
    <tr>
      <td>Cell 1.1</td>
      <td>Cell 1.2</td>
      <td>Cell 1.3</td>
    </tr>
    <tr>
      <td>Cell 2.1</td>
      <td>Cell 2.2</td>
      <td>Cell 2.3</td>
    </tr>
    <tr>
      <td>Cell 3.1</td>
      <td>Cell 3.2</td>
      <td>Cell 3.3</td>
    </tr>
  </tbody>
</table>
```

### JavaScript

```js
let table = document.querySelector("table");

// Delete second row
table.deleteRow(1);
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLTableSectionElement.deleteRow()")}}
