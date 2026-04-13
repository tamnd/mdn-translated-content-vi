---
title: "SVGFEColorMatrixElement: result property"
short-title: result
slug: Web/API/SVGFEColorMatrixElement/result
page-type: web-api-instance-property
browser-compat: api.SVGFEColorMatrixElement.result
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`result`** của giao diện {{domxref("SVGFEColorMatrixElement")}} mô tả tên được gán cho một SVG filter primitive dưới dạng {{domxref("SVGAnimatedString")}}.

Nó phản ánh thuộc tính {{SVGAttr("result")}} của phần tử {{SVGElement("feColorMatrix")}}. Filter `<feColorMatrix>` áp dụng phép biến đổi ma trận trên các giá trị màu {{glossary("RGB")}} và {{glossary("alpha")}}. Giá trị thuộc tính là {{cssxref("custom-ident")}}. Nếu được cung cấp, đồ họa kết quả từ việc xử lý filter primitive này có thể được tham chiếu bởi thuộc tính {{SVGAttr("in")}} trên filter primitive tiếp theo trong cùng phần tử {{SVGElement("filter")}}.

Nếu không có thuộc tính `result` nào được định nghĩa, `result.baseVal` và `result.animVal` của filter sẽ là chuỗi rỗng, và đầu ra của filter `<feColorMatrix>` chỉ có thể được sử dụng lại làm đầu vào ngầm định cho filter primitive tiếp theo nếu filter primitive đó không cung cấp giá trị cho thuộc tính `in` của nó.

## Giá trị

Một {{domxref("SVGAnimatedString")}}.

## Ví dụ

```js
const feColorMatrixElement = document.querySelector("feColorMatrix");
const filterName = feColorMatrixElement.result;
console.log(filterName.baseVal); // the filter's assigned name
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEColorMatrixElement.in1")}}
- Kiểu dữ liệu {{cssxref("custom-ident")}}
- Kiểu dữ liệu CSS {{cssxref("blend-mode")}}
- Thuộc tính CSS {{cssxref("mix-blend-mode")}}
- [Hiệu ứng CSS filter](/en-US/docs/Web/CSS/Guides/Filter_effects)
- Phần tử SVG {{SVGElement("filter")}}, thuộc tính SVG {{SVGAttr("filter")}} trong [SVG](/en-US/docs/Web/SVG)
- [Áp dụng hiệu ứng SVG vào nội dung HTML](/en-US/docs/Web/SVG/Guides/Applying_SVG_effects_to_HTML_content)
