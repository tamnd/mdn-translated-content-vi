---
title: "SVGSVGElement: phương thức getElementById()"
short-title: getElementById()
slug: Web/API/SVGSVGElement/getElementById
page-type: web-api-instance-method
browser-compat: api.SVGSVGElement.getElementById
---

{{APIRef("SVG")}}

Phương thức `getElementById()` của giao diện {{domxref("SVGSVGElement")}} tìm kiếm trong mảnh tài liệu SVG (tức là, tìm kiếm được giới hạn trong một tập con của cây tài liệu) một {{domxref("Element")}} có thuộc tính `id` khớp với chuỗi đã chỉ định.

## Cú pháp

```js-nolint
getElementById(id)
```

### Tham số

- `id`
  - : ID của phần tử cần tìm. ID là một chuỗi phân biệt chữ hoa chữ thường và duy nhất trong mảnh tài liệu SVG; chỉ một phần tử được phép có bất kỳ ID đã cho nào.

### Giá trị trả về

Một đối tượng {{domxref("Element")}} mô tả đối tượng phần tử DOM khớp với ID đã chỉ định, hoặc `null` nếu không tìm thấy phần tử khớp trong mảnh tài liệu SVG.

## Ví dụ

### Lấy phần tử theo ID

```html
<svg
  id="exampleSVG"
  width="200"
  height="200"
  xmlns="http://www.w3.org/2000/svg">
  <circle id="circle1" cx="100" cy="100" r="50" fill="blue" />
</svg>
<button id="getElementButton">Lấy phần tử</button>
<p id="elementDisplay"></p>
```

```js
const svgElement = document.getElementById("exampleSVG");
const getElementButton = document.getElementById("getElementButton");
const elementDisplay = document.getElementById("elementDisplay");

getElementButton.addEventListener("click", () => {
  const circleElement = svgElement.getElementById("circle1");
  if (circleElement) {
    elementDisplay.textContent = `Element found: ${circleElement.tagName}`;
  } else {
    elementDisplay.textContent = "Element not found.";
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
