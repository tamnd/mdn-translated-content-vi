---
title: "SVGFETurbulenceElement: height property"
short-title: height
slug: Web/API/SVGFETurbulenceElement/height
page-type: web-api-instance-property
browser-compat: api.SVGFETurbulenceElement.height
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`height`** của giao diện {{domxref("SVGFETurbulenceElement")}} mô tả kích thước theo chiều dọc của một phần tử lọc SVG dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính {{SVGAttr("height")}} của phần tử {{SVGElement("feTurbulence")}}, cho phép tổng hợp các kết cấu nhân tạo. Thuộc tính là một [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc một [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage) tương đối với chiều cao của vùng bộ lọc. Giá trị mặc định là `100%`. Giá trị thuộc tính là độ dài tính theo đơn vị hệ tọa độ người dùng.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feTurbulence = document.querySelector("feTurbulence");
const verticalSize = feTurbulence.height;
console.log(verticalSize.baseVal.value); // the `height` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFETurbulenceElement.width")}}
