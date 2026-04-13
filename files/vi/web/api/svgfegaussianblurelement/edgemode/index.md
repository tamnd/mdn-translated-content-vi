---
title: "SVGFEGaussianBlurElement: edgeMode property"
short-title: edgeMode
slug: Web/API/SVGFEGaussianBlurElement/edgeMode
page-type: web-api-instance-property
browser-compat: api.SVGFEGaussianBlurElement.edgeMode
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`edgeMode`** của giao diện {{domxref("SVGFEGaussianBlurElement")}} xác định giá trị màu nào sẽ được sử dụng khi bộ lọc làm mờ cần lấy mẫu pixel vượt ra ngoài cạnh của ảnh đầu vào. Nó phản ánh thuộc tính {{SVGAttr("edgeMode")}} của phần tử {{SVGElement("feGaussianBlur")}} đã cho.

Giá trị của nó là một trong các hằng số `SVG_EDGEMODE_*` được định nghĩa trên giao diện {{domxref("SVGFEGaussianBlurElement")}}.

## Giá trị

Một đối tượng {{domxref("SVGAnimatedEnumeration")}}. Thuộc tính `baseVal` của đối tượng này chứa một trong các giá trị sau:

- `0`
  - : Đại diện cho `SVG_EDGEMODE_UNKNOWN`, nghĩa là thuộc tính {{SVGAttr("edgeMode")}} có giá trị khác với các từ khóa được định nghĩa trước.
- `1`
  - : Đại diện cho `SVG_EDGEMODE_DUPLICATE`, nghĩa là ảnh đầu vào được mở rộng dọc theo mỗi cạnh khi cần bằng cách sao chép các giá trị màu tại cạnh đó.
- `2`
  - : Đại diện cho `SVG_EDGEMODE_WRAP`, nghĩa là ảnh đầu vào được mở rộng bằng cách lấy các giá trị màu từ cạnh đối diện của ảnh.
- `3`
  - : Đại diện cho `SVG_EDGEMODE_NONE`, nghĩa là ảnh đầu vào được mở rộng với các giá trị pixel bằng không cho các kênh R, G, B và A.

## Ví dụ

### Truy cập thuộc tính `edgeMode`

```html
<svg
  viewBox="0 0 200 200"
  width="300"
  height="300"
  xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="blur-filter">
      <feGaussianBlur in="SourceGraphic" stdDeviation="5" />
    </filter>
  </defs>
  <rect
    x="20"
    y="20"
    width="160"
    height="160"
    fill="rebeccapurple"
    filter="url(#blur-filter)" />
</svg>
<output></output>
```

```css hidden
body {
  font-family: system-ui;
}

output {
  display: block;
  font: inherit;
  white-space: pre;
}
```

Chúng ta có thể truy cập thuộc tính `edgeMode` để đọc giá trị hiện tại:

```js
const gaussianBlur = document.querySelector("feGaussianBlur");
const log = document.querySelector("output");

if (gaussianBlur.edgeMode) {
  // Default edgeMode for feGaussianBlur is "none" (3)
  log.textContent = `edgeMode.baseVal: ${gaussianBlur.edgeMode.baseVal}`;
} else {
  log.textContent = "edgeMode is not supported in this browser";
}
```

{{EmbedLiveSample("Examples", "", "320")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGAttr("edgeMode")}}
- {{domxref("SVGFEConvolveMatrixElement.edgeMode")}}
