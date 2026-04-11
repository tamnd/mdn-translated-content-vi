---
title: "SVGSVGElement: phương thức checkIntersection()"
short-title: checkIntersection()
slug: Web/API/SVGSVGElement/checkIntersection
page-type: web-api-instance-method
browser-compat: api.SVGSVGElement.checkIntersection
---

{{APIRef("SVG")}}

Phương thức `checkIntersection()` của giao diện {{domxref("SVGSVGElement")}} kiểm tra xem nội dung kết xuất của phần tử đã cho có giao nhau với hình chữ nhật được cung cấp hay không.

Mỗi phần tử đồ họa ứng viên chỉ được coi là khớp nếu cùng phần tử đồ họa đó có thể là đích của sự kiện con trỏ như được xác định trong quá trình xử lý {{SVGAttr("pointer-events")}}.

## Cú pháp

```js-nolint
checkIntersection(element, rect)
```

### Tham số

- `element`
  - : Một {{domxref("Element")}} biểu thị phần tử đồ họa SVG cần kiểm tra.
- `rect`
  - : Một đối tượng {{domxref("SVGRect")}} xác định hình chữ nhật để kiểm tra.

### Giá trị trả về

Một boolean.

## Ví dụ

### Kiểm tra xem một phần tử có giao nhau với hình chữ nhật không

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
  <circle id="targetElement" cx="80" cy="80" r="50" fill="blue" />
</svg>
<button id="checkIntersectionBtn">Kiểm tra giao nhau</button>
<pre id="result"></pre>
```

```js
const svgElement = document.getElementById("exampleSVG");
const checkRect = document.getElementById("checkRect");
const targetElement = document.getElementById("targetElement");
const resultDisplay = document.getElementById("result");

document
  .getElementById("checkIntersectionBtn")
  .addEventListener("click", () => {
    const rect = svgElement.createSVGRect();
    rect.x = checkRect.x.baseVal.value;
    rect.y = checkRect.y.baseVal.value;
    rect.width = checkRect.width.baseVal.value;
    rect.height = checkRect.height.baseVal.value;

    const isIntersecting = svgElement.checkIntersection(targetElement, rect);
    resultDisplay.textContent = `Does the circle intersect with the rectangle? ${isIntersecting}`;
  });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGSVGElement.checkEnclosure()")}}
