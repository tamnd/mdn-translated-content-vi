---
title: "SVGFETileElement: width property"
short-title: width
slug: Web/API/SVGFETileElement/width
page-type: web-api-instance-property
browser-compat: api.SVGFETileElement.width
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`width`** của giao diện {{domxref("SVGFETileElement")}} mô tả kích thước theo chiều ngang của một primitive bộ lọc SVG dưới dạng {{domxref("SVGAnimatedLength")}}.

Nó phản ánh thuộc tính {{SVGAttr("width")}} của phần tử {{SVGElement("feTile")}}, phần tử lấp đầy hình chữ nhật mục tiêu bằng một mẫu ô lặp lại từ ảnh đầu vào. Thuộc tính là [`<length>`](/en-US/docs/Web/SVG/Guides/Content_type#length) hoặc [`<percentage>`](/en-US/docs/Web/SVG/Guides/Content_type#percentage) tương đối so với chiều rộng của vùng bộ lọc. Giá trị mặc định là `100%`. Giá trị thuộc tính là độ dài theo đơn vị hệ tọa độ người dùng.

## Giá trị

Một {{domxref("SVGAnimatedLength")}}.

## Ví dụ

```js
const feTile = document.querySelector("feTile");
const horizontalSize = feTile.width;
console.log(horizontalSize.baseVal.value); // giá trị `width`
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFETileElement.height")}}
- {{domxref("SVGPatternElement")}}
