---
title: "SVGSVGElement: phương thức checkEnclosure()"
short-title: checkEnclosure()
slug: Web/API/SVGSVGElement/checkEnclosure
page-type: web-api-instance-method
browser-compat: api.SVGSVGElement.checkEnclosure
---

{{APIRef("SVG")}}

Phương thức `checkEnclosure()` của giao diện {{domxref("SVGSVGElement")}} kiểm tra xem nội dung kết xuất của phần tử đã cho có hoàn toàn nằm trong hình chữ nhật được cung cấp hay không.

Mỗi phần tử đồ họa ứng viên chỉ được coi là khớp nếu cùng phần tử đồ họa đó có thể là đích của sự kiện con trỏ như được xác định trong quá trình xử lý {{SVGAttr("pointer-events")}}.

## Cú pháp

```js-nolint
checkEnclosure(element, rect)
```

### Tham số

- `element`
  - : Một {{domxref("Element")}} biểu thị phần tử đồ họa SVG cần kiểm tra.
- `rect`
  - : Một đối tượng {{domxref("SVGRect")}} xác định hình chữ nhật để kiểm tra.

### Giá trị trả về

Một boolean.

## Ví dụ

### Kiểm tra xem một phần tử có nằm trong hình chữ nhật không

```html
<svg id="exampleSVG" width="200" height="200">
  <rect
    id="checkRect"
    x="10"
    y="10"
    width="100"
    height="100"
    fill="none"
    stroke="red" />
  <circle id="targetElement" cx="50" cy="50" r="30" fill="blue" />
</svg>
<button id="checkEnclosureBtn">Kiểm tra bao phủ</button>
<pre id="result"></pre>
```

```js
const svgElement = document.getElementById("exampleSVG");
const checkRect = svgElement.getElementById("checkRect");
const targetElement = svgElement.getElementById("targetElement");
const resultDisplay = document.getElementById("result");

document.getElementById("checkEnclosureBtn").addEventListener("click", () => {
  const rect = svgElement.createSVGRect();
  rect.x = checkRect.x.baseVal.value;
  rect.y = checkRect.y.baseVal.value;
  rect.width = checkRect.width.baseVal.value;
  rect.height = checkRect.height.baseVal.value;

  const isEnclosed = svgElement.checkEnclosure(targetElement, rect);
  resultDisplay.textContent = `Is the circle enclosed in the rectangle? ${isEnclosed}`;
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGSVGElement.checkIntersection()")}}
