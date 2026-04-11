---
title: "SVGFETurbulenceElement: x property"
short-title: x
slug: Web/API/SVGFETurbulenceElement/x
page-type: web-api-instance-property
browser-compat: api.SVGFETurbulenceElement.x
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`x`** của giao diện {{domxref("SVGFETurbulenceElement")}} mô tả tọa độ ngang của vị trí một phần tử lọc SVG dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính {{SVGAttr("x")}} của phần tử {{SVGElement("feTurbulence")}}, cho phép tổng hợp các kết cấu nhân tạo. Thuộc tính là một [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage). `<coordinate>` là độ dài trong hệ tọa độ người dùng biểu thị khoảng cách tính từ gốc tọa độ của hệ tọa độ người dùng theo trục x. Nếu thuộc tính `x` là giá trị phần trăm, giá trị thuộc tính tương đối với chiều rộng của vùng bộ lọc tính theo đơn vị hệ tọa độ người dùng. Giá trị mặc định là `0`.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feTurbulence = document.querySelector("feTurbulence");
const leftPosition = feTurbulence.x;
console.log(leftPosition.baseVal.value); // the `x` value
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFETurbulenceElement.y")}}
