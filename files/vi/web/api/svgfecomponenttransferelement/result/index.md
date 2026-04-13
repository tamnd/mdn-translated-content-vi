---
title: "SVGFEComponentTransferElement: result property"
short-title: result
slug: Web/API/SVGFEComponentTransferElement/result
page-type: web-api-instance-property
browser-compat: api.SVGFEComponentTransferElement.result
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`result`** của giao diện {{domxref("SVGFEComponentTransferElement")}} mô tả tên được gán cho một primitive bộ lọc SVG dưới dạng {{domxref("SVGAnimatedString")}}.

Nó phản ánh thuộc tính {{SVGAttr("result")}} của phần tử {{SVGElement("feComponentTransfer")}}. Giá trị thuộc tính là một {{cssxref("custom-ident")}}. Nếu được cung cấp, đồ họa kết quả từ quá trình xử lý primitive bộ lọc này có thể được tham chiếu bằng thuộc tính {{SVGAttr("in")}} trên một primitive bộ lọc tiếp theo trong cùng phần tử {{SVGElement("filter")}}.

Nếu không có thuộc tính `result` nào được định nghĩa, `result.baseVal` và `result.animVal` của bộ lọc là chuỗi rỗng, và đầu ra của bộ lọc `<feComponentTransfer>` chỉ khả dụng để tái sử dụng như đầu vào ngầm định cho primitive bộ lọc tiếp theo nếu primitive bộ lọc đó không cung cấp giá trị cho thuộc tính `in` của nó.

## Giá trị

Một {{domxref("SVGAnimatedString")}}.

## Ví dụ

```js
const feComponentTransferElement = document.querySelector(
  "feComponentTransfer",
);
const filterName = feComponentTransferElement.result;
console.log(filterName.baseVal); // tên được gán cho bộ lọc
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEComponentTransferElement.in1")}}
- Các phần tử {{SVGElement("feFuncR")}}, {{SVGElement("feFuncG")}}, {{SVGElement("feFuncB")}}, {{SVGElement("feFuncA")}}
- Kiểu dữ liệu {{cssxref("custom-ident")}}
