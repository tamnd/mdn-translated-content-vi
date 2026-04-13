---
title: "SVGFEImageElement: result property"
short-title: result
slug: Web/API/SVGFEImageElement/result
page-type: web-api-instance-property
browser-compat: api.SVGFEImageElement.result
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`result`** của giao diện {{domxref("SVGFEImageElement")}} mô tả tên được gán cho bộ lọc SVG dưới dạng {{domxref("SVGAnimatedString")}}.

Nó phản ánh thuộc tính {{SVGAttr("result")}} của phần tử {{SVGElement("feImage")}}, phần tử này tải dữ liệu hình ảnh từ nguồn bên ngoài và cung cấp dữ liệu pixel làm đầu ra. Giá trị thuộc tính là một {{cssxref("custom-ident")}}. Nếu được cung cấp, đồ họa kết quả từ quá trình xử lý bộ lọc này có thể được tham chiếu bởi thuộc tính {{SVGAttr("in")}} trên một bộ lọc tiếp theo trong cùng phần tử {{SVGElement("filter")}}.

Nếu không có thuộc tính `result` nào được định nghĩa, `result.baseVal` và `result.animVal` của bộ lọc là chuỗi rỗng, và đầu ra của bộ lọc `<feImage>` chỉ có sẵn như đầu vào ngầm định cho bộ lọc tiếp theo nếu bộ lọc đó không cung cấp giá trị cho thuộc tính `in` của nó.

## Giá trị

Một {{domxref("SVGAnimatedString")}}.

## Ví dụ

```js
const feImageElement = document.querySelector("feImage");
const filterName = feImageElement.result;
console.log(filterName.baseVa); // tên được gán của bộ lọc
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("custom-ident")}} data type
- [SVG tutorial: Filter effects](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Filter_effects)
- [SVG Filter primitive attributes](/en-US/docs/Web/SVG/Reference/Attribute#filters_attributes)
- CSS {{cssxref("blend-mode")}} data type
- CSS {{cssxref("mix-blend-mode")}} property
