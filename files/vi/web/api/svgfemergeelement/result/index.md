---
title: "SVGFEMergeElement: thuộc tính result"
short-title: result
slug: Web/API/SVGFEMergeElement/result
page-type: web-api-instance-property
browser-compat: api.SVGFEMergeElement.result
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`result`** của giao diện {{domxref("SVGFEMergeElement")}} mô tả tên được gán của một filter primitive SVG dưới dạng {{domxref("SVGAnimatedString")}}.

Nó phản ánh thuộc tính {{SVGAttr("result")}} của phần tử {{SVGElement("feMerge")}}. Giá trị thuộc tính là một {{cssxref("custom-ident")}}. Nếu được cung cấp, thì đồ họa kết quả từ việc xử lý filter primitive này có thể được tham chiếu bởi thuộc tính {{SVGAttr("in")}} trên một filter primitive tiếp theo trong cùng một phần tử {{SVGElement("filter")}}.

Nếu không có thuộc tính `result` nào được định nghĩa, `result.baseVal` và `result.animVal` của filter là các chuỗi rỗng, và đầu ra của filter `<feMerge>` sẽ chỉ có thể được tái sử dụng như đầu vào ngầm định vào filter primitive tiếp theo nếu filter primitive đó không cung cấp giá trị cho thuộc tính `in` của nó.

## Giá trị

Một {{domxref("SVGAnimatedString")}}.

## Ví dụ

```js
const feMergeElement = document.querySelector("feMerge");
const filterName = feMergeElement.result;
console.log(filterName.baseVal); // the filter's assigned name
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEMergeNodeElement.in1")}}
- {{cssxref("custom-ident")}} data type
