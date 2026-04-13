---
title: "SVGFEMorphologyElement: result property"
short-title: result
slug: Web/API/SVGFEMorphologyElement/result
page-type: web-api-instance-property
browser-compat: api.SVGFEMorphologyElement.result
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`result`** của giao diện {{domxref("SVGFEMorphologyElement")}} mô tả tên được gán cho một phần tử lọc SVG dưới dạng {{domxref("SVGAnimatedString")}}.

Nó phản ánh thuộc tính {{SVGAttr("result")}} của phần tử {{SVGElement("feMorphology")}}. Giá trị thuộc tính là một {{cssxref("custom-ident")}}. Nếu được cung cấp, đồ họa kết quả từ quá trình xử lý phần tử lọc này có thể được tham chiếu bởi thuộc tính {{SVGAttr("in")}} trên phần tử lọc tiếp theo trong cùng phần tử {{SVGElement("filter")}}.

Nếu không có thuộc tính `result` được định nghĩa, `result.baseVal` và `result.animVal` của bộ lọc là các chuỗi rỗng, và đầu ra của bộ lọc `<feMorphology>` chỉ có thể được tái sử dụng làm đầu vào ngầm cho phần tử lọc tiếp theo nếu phần tử đó không cung cấp giá trị nào cho thuộc tính `in` của nó.

## Giá trị

Một {{domxref("SVGAnimatedString")}}.

## Ví dụ

```js
const feMorphologyElement = document.querySelector("feMorphology");
const filterName = feMorphologyElement.result;
console.log(filterName.baseVal); // the filter's assigned name
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEMorphologyElement.in1")}}
- {{cssxref("custom-ident")}} data type
