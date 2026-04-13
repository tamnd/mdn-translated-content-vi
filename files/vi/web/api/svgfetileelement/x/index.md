---
title: "SVGFETileElement: x property"
short-title: x
slug: Web/API/SVGFETileElement/x
page-type: web-api-instance-property
browser-compat: api.SVGFETileElement.x
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`x`** của giao diện {{domxref("SVGFETileElement")}} mô tả tọa độ ngang của vị trí primitive bộ lọc SVG dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính {{SVGAttr("x")}} của phần tử {{SVGElement("feTile")}}, phần tử lấp đầy hình chữ nhật mục tiêu bằng một mẫu ô lặp lại từ ảnh đầu vào. Thuộc tính là [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage). `<coordinate>` là độ dài trong hệ tọa độ người dùng xác định khoảng cách từ gốc tọa độ dọc theo trục x. Nếu thuộc tính `x` là giá trị phần trăm, giá trị thuộc tính là tương đối so với chiều rộng của vùng bộ lọc theo đơn vị hệ tọa độ người dùng. Giá trị mặc định là `0`.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feTile = document.querySelector("feTile");
const leftPosition = feTile.x;
console.log(leftPosition.baseVal.value); // giá trị `x`
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFETileElement.y")}}
