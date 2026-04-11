---
title: "SVGFETurbulenceElement: result property"
short-title: result
slug: Web/API/SVGFETurbulenceElement/result
page-type: web-api-instance-property
browser-compat: api.SVGFETurbulenceElement.result
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`result`** của giao diện {{domxref("SVGFETurbulenceElement")}} mô tả tên được gán cho một phần tử lọc SVG dưới dạng {{domxref("SVGAnimatedString")}}.

Nó phản ánh thuộc tính {{SVGAttr("result")}} của phần tử {{SVGElement("feTurbulence")}}, cho phép tổng hợp các kết cấu nhân tạo. Giá trị thuộc tính là một {{cssxref("custom-ident")}}. Nếu được cung cấp, đồ họa kết quả từ việc xử lý phần tử lọc này có thể được tham chiếu bởi thuộc tính {{SVGAttr("in")}} trên một phần tử lọc tiếp theo trong cùng phần tử {{SVGElement("filter")}}.

Nếu không có thuộc tính `result` nào được định nghĩa, `result.baseVal` và `result.animVal` của bộ lọc là các chuỗi rỗng, và đầu ra của bộ lọc `<feTurbulence>` sẽ chỉ có thể được tái sử dụng như đầu vào ngầm định cho phần tử lọc tiếp theo nếu phần tử lọc đó không cung cấp giá trị nào cho thuộc tính `in` của nó.

## Giá trị

Một {{domxref("SVGAnimatedString")}}.

## Ví dụ

```js
const feTurbulenceElement = document.querySelector("feTurbulence");
const filterName = feTurbulenceElement.result;
console.log(filterName.baseVal); // the filter's assigned name
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("custom-ident")}} data type
