---
title: "Document: phương thức elementsFromPoint()"
short-title: elementsFromPoint()
slug: Web/API/Document/elementsFromPoint
page-type: web-api-instance-method
browser-compat: api.Document.elementsFromPoint
---

{{APIRef("DOM")}}

Phương thức **`elementsFromPoint()`** của giao diện {{domxref("Document")}} trả về một mảng gồm tất cả các phần tử tại tọa độ đã chỉ định (tương đối so với viewport). Các phần tử được sắp xếp từ hộp trên cùng đến hộp dưới cùng của viewport.

Nó hoạt động tương tự như phương thức {{domxref("Document.elementFromPoint", "elementFromPoint()")}}.

## Cú pháp

```js-nolint
elementsFromPoint(x, y)
```

### Tham số

- `x`
  - : Tọa độ ngang của một điểm.
- `y`
  - : Tọa độ dọc của một điểm.

### Giá trị trả về

Một mảng các đối tượng {{domxref('Element')}}, được sắp xếp từ hộp trên cùng đến hộp dưới cùng của viewport.

## Ví dụ

### HTML

```html
<div>
  <p>Some text</p>
</div>
<p>Các phần tử tại điểm 30, 20:</p>
<div id="output"></div>
```

### JavaScript

```js
let output = document.getElementById("output");
if (document.elementsFromPoint) {
  let elements = document.elementsFromPoint(30, 20);
  elements.forEach((elt, i) => {
    output.textContent += elt.localName;
    if (i < elements.length - 1) {
      output.textContent += " < ";
    }
  });
} else {
  output.innerHTML = `<span style="color: red">
  Trình duyệt không hỗ trợ
  <code>document.elementsFromPoint()</code>
</span>
`;
}
```

{{EmbedLiveSample('Examples', '420', '160')}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("Document.elementFromPoint()")}}
