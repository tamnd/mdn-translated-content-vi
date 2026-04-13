---
title: "SVGFESpecularLightingElement: result property"
short-title: result
slug: Web/API/SVGFESpecularLightingElement/result
page-type: web-api-instance-property
browser-compat: api.SVGFESpecularLightingElement.result
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`result`** của giao diện {{domxref("SVGFESpecularLightingElement")}} mô tả tên được gán cho một bộ lọc SVG dạng nguyên thủy dưới dạng {{domxref("SVGAnimatedString")}}.

Nó phản ánh thuộc tính {{SVGAttr("result")}} của phần tử {{SVGElement("feSpecularLighting")}}, phần tử này chiếu sáng đồ họa nguồn sử dụng kênh alpha như một bản đồ va chạm. Giá trị thuộc tính là {{cssxref("custom-ident")}}. Nếu được cung cấp, đồ họa xuất ra từ việc xử lý bộ lọc nguyên thủy này có thể được tham chiếu bằng thuộc tính {{SVGAttr("in")}} trên bộ lọc nguyên thủy tiếp theo trong cùng phần tử {{SVGElement("filter")}}.

Nếu không có thuộc tính `result` nào được xác định, `result.baseVal` và `result.animVal` của bộ lọc sẽ là chuỗi rỗng, và đầu ra của bộ lọc `<feSpecularLighting>` chỉ có thể được sử dụng lại như đầu vào ngầm định vào bộ lọc nguyên thủy tiếp theo nếu bộ lọc nguyên thủy đó không cung cấp giá trị nào cho thuộc tính `in` của nó.

## Giá trị

Một {{domxref("SVGAnimatedString")}}.

## Ví dụ

```js
const feSpecularLightingElement = document.querySelector("feSpecularLighting");
const filterName = feSpecularLightingElement.result;
console.log(filterName.baseVal); // tên được gán của bộ lọc
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFESpecularLightingElement.in1")}}
- Kiểu dữ liệu {{cssxref("custom-ident")}}
- {{domxref("SVGFEDiffuseLightingElement")}}
- Thuộc tính CSS {{cssxref("lighting-color")}}
