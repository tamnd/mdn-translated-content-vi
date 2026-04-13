---
title: "HTMLImageElement: x property"
short-title: x
slug: Web/API/HTMLImageElement/x
page-type: web-api-instance-property
browser-compat: api.HTMLImageElement.x
---

{{APIRef("HTML DOM")}}

Thuộc tính **`x`** chỉ đọc của giao diện {{domxref("HTMLImageElement")}} cho biết tọa độ x của cạnh viền trái của phần tử {{HTMLElement("img")}} so với gốc của phần tử gốc.

Thuộc tính `x` và {{domxref("HTMLImageElement.y", "y")}} chỉ hợp lệ cho một hình ảnh nếu thuộc tính {{cssxref("display")}} của nó có giá trị được tính toán `table-column` hoặc `table-column-group`. Nói cách khác: nó có một trong những giá trị đó được đặt rõ ràng trên đó hoặc nó đã kế thừa nó từ một phần tử chứa hoặc bằng cách nằm trong một cột được mô tả bởi {{HTMLElement("col")}} hoặc {{HTMLElement("colgroup")}}.

## Giá trị

Một giá trị số nguyên biểu thị khoảng cách tính bằng pixel từ cạnh trái của phần tử gốc gần nhất của phần tử và cạnh trái của hộp viền của phần tử {{HTMLElement("img")}}. Phần tử gốc gần nhất là phần tử {{HTMLElement("html")}} ngoài cùng có chứa hình ảnh. Nếu hình ảnh nằm trong {{HTMLElement("iframe")}} thì `x` của nó sẽ tương ứng với khung hình đó.

Trong sơ đồ bên dưới, cạnh viền trái là cạnh trái của vùng đệm màu xanh. Vì vậy giá trị được trả về bởi `x` sẽ là khoảng cách từ điểm đó đến cạnh trái của vùng nội dung.

![Sơ đồ thể hiện mối quan hệ giữa các hộp khác nhau được liên kết với một phần tử](boxmodel-3.png)

## Ví dụ

Ví dụ dưới đây minh họa cách sử dụng thuộc tính `HTMLImageElement` `x` và {{domxref("HTMLImageElement.y", "y")}}.

### HTML

Trong ví dụ này, chúng ta thấy một bảng hiển thị thông tin về người dùng trang web, bao gồm ID người dùng, tên đầy đủ và hình ảnh đại diện của họ.

```html
<table id="userinfo">
  <colgroup>
    <col span="2" class="group1" />
    <col />
  </colgroup>
  <thead>
    <tr>
      <th>UserID</th>
      <th>Name</th>
      <th>Avatar</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>12345678</td>
      <td>Johnny Rocket</td>
      <td>
        <img src="/shared-assets/images/examples/grapefruit-slice.jpg" />
      </td>
    </tr>
  </tbody>
</table>
<pre id="log"></pre>
```

### JavaScript

Mã JavaScript tìm nạp hình ảnh từ bảng và tra cứu các giá trị `x` và `y` của nó ở bên dưới.

```js
const logBox = document.querySelector("pre");
const tbl = document.getElementById("userinfo");

const log = (msg) => {
  logBox.innerText += `${msg}\n`;
};

const cell = tbl.rows[1].cells[2];
const image = cell.querySelector("img");

log(`Image's global X: ${image.x}`);
log(`Image's global Y: ${image.y}`);
```

Cái này sử dụng thuộc tính {{domxref("HTMLTableElement.rows", "rows")}} của {{HTMLElement("table")}} để lấy danh sách các hàng trong bảng, từ đó nó tra cứu hàng 1 (là chỉ mục dựa trên 0, có nghĩa là hàng thứ hai từ trên xuống). Sau đó, nó xem xét thuộc tính {{domxref("HTMLTableRowElement.cells", "cells")}} của phần tử {{HTMLElement("tr")}} (hàng trong bảng) đó để lấy danh sách các ô trong hàng đó. Ô thứ ba được lấy từ hàng đó (một lần nữa, chỉ định 2 là phần bù dựa trên số 0).

Từ đó, chúng ta có thể lấy chính phần tử `<img>` từ ô bằng cách gọi {{domxref("Element.querySelector", "querySelector()")}} trên {{domxref("HTMLTableCellElement")}} đại diện cho ô đó.

Cuối cùng, chúng ta có thể tra cứu và hiển thị các giá trị thuộc tính `x` và `y` của `HTMLImageElement`.

### CSS

CSS xác định diện mạo của bảng:

```css
.group1 {
  background-color: #d7d9f2;
}

table {
  border-collapse: collapse;
  border: 2px solid rgb(100 100 100);
  font-family: sans-serif;
}

td,
th {
  border: 1px solid rgb(100 100 100);
  padding: 10px 14px;
}

td > img {
  max-width: 4em;
}
```

### Kết quả

Bảng kết quả trông như thế này:

{{EmbedLiveSample("Example", 600, 200)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("display")}}
- {{HTMLElement("col")}}
- {{HTMLElement("colgroup")}}
- {{domxref("HTMLImageElement.y")}}
