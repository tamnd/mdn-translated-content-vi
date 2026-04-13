---
title: "SVGGraphicsElement: getBBox() method"
short-title: getBBox()
slug: Web/API/SVGGraphicsElement/getBBox
page-type: web-api-instance-method
browser-compat: api.SVGGraphicsElement.getBBox
---

{{APIRef("SVG")}}

Phương thức **`SVGGraphicsElement.getBBox()`** cho phép chúng ta xác định tọa độ của hình chữ nhật nhỏ nhất bao quanh đối tượng. Tọa độ được trả về theo không gian SVG hiện tại (sau khi áp dụng tất cả các thuộc tính hình học trên tất cả các phần tử có trong phần tử mục tiêu).

> [!NOTE]
> `getBBox()` phải trả về hộp giới hạn thực tế vào thời điểm phương thức được gọi, ngay cả khi phần tử chưa được hiển thị. Nó cũng không tính đến bất kỳ phép biến đổi nào được áp dụng cho phần tử hoặc các phần tử cha của nó.

> [!NOTE]
> `getBBox` trả về các giá trị khác với {{domxref("Element.getBoundingClientRect()", "getBoundingClientRect()")}}, vì giá trị sau là tương đối so với viewport.

## Cú pháp

```js-nolint
getBBox()
getBBox(options)
```

### Tham số

- `options` {{experimental_inline}} {{optional_inline}}
  - : Từ điển tùy chọn dùng để kiểm soát phần nào của phần tử được đưa vào hộp giới hạn. Các tùy chọn khả dụng:
    - `fill`
      - : Giá trị boolean cho biết phần tô màu có được đưa vào hộp giới hạn không, mặc định là `true`.
    - `stroke`
      - : Giá trị boolean cho biết nét viền có được đưa vào hộp giới hạn không, mặc định là `false`.
    - `markers`
      - : Giá trị boolean cho biết các điểm đánh dấu có được đưa vào hộp giới hạn không, mặc định là `false`.
    - `clipped`
      - : Giá trị boolean cho biết hộp giới hạn có bị cắt xén không, mặc định là `false`.

### Giá trị trả về

Giá trị trả về là một đối tượng {{domxref("SVGRect")}}, định nghĩa hộp giới hạn. Giá trị này độc lập với bất kỳ thuộc tính biến đổi nào được áp dụng cho nó hay các phần tử cha.

## Ví dụ

### HTML

```html
<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <g id="group_text_1">
    <text x="5" y="16" transform="scale(2, 2)">Hello World!</text>
    <text x="8" y="32" transform="translate(0 20) scale(1.25 1)">
      Hello World Again!
    </text>
  </g>
  <!-- Hiển thị BBox bằng màu xanh lá -->
  <rect id="rect_1" stroke="green" stroke-width="3" fill="none"></rect>
  <!-- Hiển thị BoundingClientRect bằng màu đỏ -->
  <rect id="rect_2" stroke="red" stroke-width="3" fill="none"></rect>
</svg>
```

### JavaScript

```js
const rectBBox = document.querySelector("#rect_1");
const rectBoundingClientRect = document.querySelector("#rect_2");
const groupElement = document.querySelector("#group_text_1");

const bboxGroup = groupElement.getBBox();
rectBBox.setAttribute("x", bboxGroup.x);
rectBBox.setAttribute("y", bboxGroup.y);
rectBBox.setAttribute("width", bboxGroup.width);
rectBBox.setAttribute("height", bboxGroup.height);

const boundingClientRectGroup = groupElement.getBoundingClientRect();
rectBoundingClientRect.setAttribute("x", boundingClientRectGroup.x);
rectBoundingClientRect.setAttribute("y", boundingClientRectGroup.y);
rectBoundingClientRect.setAttribute("width", boundingClientRectGroup.width);
rectBoundingClientRect.setAttribute("height", boundingClientRectGroup.height);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [getBBox trong SVG Primer](https://www.w3.org/Graphics/SVG/IG/resources/svgprimer.html#getBBox)
