---
title: "HTMLTableColElement: thuộc tính span"
short-title: span
slug: Web/API/HTMLTableColElement/span
page-type: web-api-instance-property
browser-compat: api.HTMLTableColElement.span
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`span`** của giao diện {{domxref("HTMLTableColElement")}} đại diện cho số cột mà {{htmlelement("col")}} hoặc {{htmlelement("colgroup")}} này phải kéo dài; điều này cho phép cột chiếm không gian trên nhiều cột của bảng. Nó phản ánh thuộc tính [`span`](/en-US/docs/Web/HTML/Reference/Elements/col#span).

## Giá trị

Một số dương đại diện cho số cột.

> [!NOTE]
> Khi đặt giá trị mới, giá trị sẽ bị _kẹp_ về số dương gần nhất (tối đa là 1000).

## Ví dụ

Ví dụ này cung cấp hai nút để sửa đổi span cột của ô đầu tiên trong thân bảng.

### HTML

```html
<table>
  <colgroup>
    <col />
    <col span="2" class="multiColumn" />
  </colgroup>
  <thead>
    <tr>
      <th></th>
      <th scope="col">C1</th>
      <th scope="col">C2</th>
      <th scope="col">C3</th>
      <th scope="col">C4</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">Row 1</th>
      <td>cell</td>
      <td>cell</td>
      <td>cell</td>
      <td>cell</td>
    </tr>
  </tbody>
</table>
<button id="increase">Increase column span</button>
<button id="decrease">Decrease column span</button>
<div>The first &lt;col&gt; spans <output>2</output> actual column(s).</div>
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

### CSS

```css
.multiColumn {
  background-color: #d7d9f2;
}
```

### JavaScript

```js
// Lấy các phần tử giao diện liên quan
const col = document.querySelectorAll("col")[1];
const output = document.querySelectorAll("output")[0];

const increaseButton = document.getElementById("increase");
const decreaseButton = document.getElementById("decrease");

increaseButton.addEventListener("click", () => {
  col.span += 1;

  // Cập nhật hiển thị
  output.textContent = col.span;
});

decreaseButton.addEventListener("click", () => {
  col.span -= 1;

  // Cập nhật hiển thị
  output.textContent = col.span;
});
```

### Kết quả

{{EmbedLiveSample("Examples", "100%", 175)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLTableCellElement.colSpan")}}
