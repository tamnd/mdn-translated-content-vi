---
title: "SVGFEConvolveMatrixElement: result property"
short-title: result
slug: Web/API/SVGFEConvolveMatrixElement/result
page-type: web-api-instance-property
browser-compat: api.SVGFEConvolveMatrixElement.result
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`result`** của giao diện {{domxref("SVGFEConvolveMatrixElement")}} mô tả tên được gán cho một phần tử lọc SVG dưới dạng {{domxref("SVGAnimatedString")}}.

Nó phản ánh thuộc tính {{SVGAttr("result")}} của phần tử {{SVGElement("feConvolveMatrix")}}. Bộ lọc `<feConvolveMatrix>` áp dụng hiệu ứng tích chập ma trận, kết hợp các điểm ảnh trong ảnh đầu vào với các điểm ảnh lân cận để tạo ra các hiệu ứng tích chập như làm mờ, phát hiện cạnh, làm sắc nét, dập nổi hoặc vát mép.

Giá trị thuộc tính là một {{cssxref("custom-ident")}}. Nếu được cung cấp, đồ họa kết quả từ việc xử lý phần tử lọc này có thể được tham chiếu bởi thuộc tính {{SVGAttr("in")}} trên một phần tử lọc tiếp theo trong cùng phần tử {{SVGElement("filter")}}.

Nếu không có thuộc tính `result` nào được định nghĩa, `result.baseVal` và `result.animVal` của bộ lọc là các chuỗi rỗng, và đầu ra của bộ lọc `<feConvolveMatrix>` sẽ chỉ có thể được tái sử dụng như đầu vào ngầm định cho phần tử lọc tiếp theo nếu phần tử lọc đó không cung cấp giá trị nào cho thuộc tính `in` của nó.

## Giá trị

Một {{domxref("SVGAnimatedString")}}.

## Ví dụ

```js
const feConvolveMatrixElement = document.querySelector("feConvolveMatrix");
const filterName = feConvolveMatrixElement.result;
console.log(filterName.baseVal); // the filter's assigned name
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEConvolveMatrixElement.in1")}}
- {{cssxref("custom-ident")}} data type
- [CSS filter effects](/en-US/docs/Web/CSS/Guides/Filter_effects) module
- SVG {{SVGElement("filter")}} element, SVG {{SVGAttr("filter")}} attribute in [SVG](/en-US/docs/Web/SVG)
- [Applying SVG effects to HTML content](/en-US/docs/Web/SVG/Guides/Applying_SVG_effects_to_HTML_content)
