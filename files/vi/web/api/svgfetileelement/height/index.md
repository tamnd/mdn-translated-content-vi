---
title: "SVGFETileElement: height property"
short-title: height
slug: Web/API/SVGFETileElement/height
page-type: web-api-instance-property
browser-compat: api.SVGFETileElement.height
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`height`** của giao diện {{domxref("SVGFETileElement")}} mô tả kích thước theo chiều dọc của một primitive bộ lọc SVG dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính {{SVGAttr("height")}} của phần tử {{SVGElement("feTile")}}, phần tử lấp đầy hình chữ nhật mục tiêu bằng một mẫu ô lặp lại từ ảnh đầu vào. Thuộc tính là [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage) tương đối so với chiều cao của vùng bộ lọc. Giá trị mặc định là `100%`. Giá trị thuộc tính là độ dài theo đơn vị hệ tọa độ người dùng.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feTile = document.querySelector("feTile");
const verticalSize = feTile.height;
console.log(verticalSize.baseVal.value); // giá trị `height`
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFETileElement.width")}}
- {{domxref("SVGPatternElement")}}
