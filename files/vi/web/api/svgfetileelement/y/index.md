---
title: "SVGFETileElement: y property"
short-title: y
slug: Web/API/SVGFETileElement/y
page-type: web-api-instance-property
browser-compat: api.SVGFETileElement.y
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`y`** của giao diện {{domxref("SVGFETileElement")}} mô tả tọa độ dọc của vị trí primitive bộ lọc SVG dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính {{SVGAttr("y")}} của phần tử {{SVGElement("feTile")}}, phần tử lấp đầy hình chữ nhật mục tiêu bằng một mẫu ô lặp lại từ ảnh đầu vào. Thuộc tính là [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage). `<coordinate>` là độ dài trong hệ tọa độ người dùng xác định khoảng cách từ gốc bộ lọc dọc theo trục y. Nếu thuộc tính `y` là giá trị phần trăm, giá trị thuộc tính là tương đối so với chiều cao của vùng bộ lọc theo đơn vị hệ tọa độ người dùng. Giá trị mặc định là `0`.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feTile = document.querySelector("feTile");
const topPosition = feTile.y;
console.log(topPosition.baseVal.value); // giá trị `y`
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFETileElement.x")}}
- {{domxref("SVGPatternElement")}}
