---
title: "SVGFEGaussianBlurElement: result property"
short-title: result
slug: Web/API/SVGFEGaussianBlurElement/result
page-type: web-api-instance-property
browser-compat: api.SVGFEGaussianBlurElement.result
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`result`** của giao diện {{domxref("SVGFEGaussianBlurElement")}} mô tả tên được gán cho một phần tử lọc SVG dưới dạng {{domxref("SVGAnimatedString")}}.

Nó phản ánh thuộc tính {{SVGAttr("result")}} của phần tử {{SVGElement("feGaussianBlur")}}, phần tử này làm mờ ảnh đầu vào. Giá trị thuộc tính là một {{cssxref("custom-ident")}}. Nếu được cung cấp, đồ họa kết quả từ quá trình xử lý phần tử lọc này có thể được tham chiếu bởi thuộc tính {{SVGAttr("in")}} trên phần tử lọc tiếp theo trong cùng phần tử {{SVGElement("filter")}}.

Nếu không có thuộc tính `result` được định nghĩa, `result.baseVal` và `result.animVal` của bộ lọc là các chuỗi rỗng, và đầu ra của bộ lọc `<feGaussianBlur>` chỉ có thể được tái sử dụng làm đầu vào ngầm cho phần tử lọc tiếp theo nếu phần tử đó không cung cấp giá trị nào cho thuộc tính `in` của nó.

## Giá trị

Một {{domxref("SVGAnimatedString")}}.

## Ví dụ

```js
const feGaussianBlurElement = document.querySelector("feGaussianBlur");
const filterName = feGaussianBlurElement.result;
console.log(filterName.baseVal); // the filter's assigned name
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEGaussianBlurElement.in1")}}
- {{cssxref("custom-ident")}} data type
- [SVG filter tutorial](/en-US/docs/Web/SVG/Guides/SVG_filters)
- CSS {{cssxref("blend-mode")}} data type
- CSS {{cssxref("filter-function/blur", "blur()")}} function
- [CSS filter effects](/en-US/docs/Web/CSS/Guides/Filter_effects) module- CSS {{cssxref("mix-blend-mode")}} property
