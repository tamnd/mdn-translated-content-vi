---
title: "HTMLTableCellElement: thuộc tính abbr"
short-title: abbr
slug: Web/API/HTMLTableCellElement/abbr
page-type: web-api-instance-property
browser-compat: api.HTMLTableCellElement.abbr
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`abbr`** của giao diện {{domxref("HTMLTableCellElement")}}
cho biết một từ viết tắt liên kết với ô. Nếu ô không đại diện cho một ô tiêu đề {{HTMLElement("th")}}, nó sẽ bị bỏ qua.

Nó phản ánh thuộc tính `abbr` của phần tử {{HTMLElement("th")}}.

> [!NOTE]
> Thuộc tính này không có hiệu ứng trực quan trong trình duyệt. Nó thêm thông tin để hỗ trợ công nghệ hỗ trợ như trình đọc màn hình có thể sử dụng từ viết tắt này

## Giá trị

Một chuỗi.

## Ví dụ

Ví dụ này thêm tiền tố với từ viết tắt liên kết với tiêu đề hàng của mỗi ô đầu tiên.

### HTML

```html
<table>
  <thead>
    <tr>
      <th abbr="Maker">Manufacturer</th>
      <th abbr="Model">Car model</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Tesla</td>
      <td>3</td>
    </tr>
    <tr>
      <td>BYD</td>
      <td>Dolphin</td>
    </tr>
    <tr>
      <td>VW</td>
      <td>ID.3</td>
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
const rows = document.querySelectorAll("thead tr");
const cells = rows[0].cells;

for (const cell of cells) {
  cell.textContent = `${cell.textContent} (${cell.abbr})`;
}
```

### Kết quả

{{EmbedLiveSample("Examples", "100%", 220)}}

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
