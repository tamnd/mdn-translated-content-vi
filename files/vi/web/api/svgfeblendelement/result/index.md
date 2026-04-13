---
title: "SVGFEBlendElement: result property"
short-title: result
slug: Web/API/SVGFEBlendElement/result
page-type: web-api-instance-property
browser-compat: api.SVGFEBlendElement.result
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`result`** của giao diện {{domxref("SVGFEBlendElement")}} mô tả tên được gán cho một SVG filter primitive dưới dạng {{domxref("SVGAnimatedString")}}.

Nó phản ánh thuộc tính {{SVGAttr("result")}} của phần tử {{SVGElement("feBlend")}}.
SVG filter `<feBlend>` pha trộn hai ảnh đầu vào với nhau bằng các [chế độ pha trộn](/en-US/docs/Web/CSS/Reference/Values/blend-mode) phổ biến trong phần mềm xử lý ảnh.

Giá trị thuộc tính là {{cssxref("custom-ident")}}. Nếu được cung cấp, đồ họa kết quả từ việc xử lý filter primitive này có thể được tham chiếu bởi thuộc tính {{SVGAttr("in")}} trên filter primitive tiếp theo trong cùng phần tử {{SVGElement("filter")}}.

Nếu không có thuộc tính `result` nào được định nghĩa, `result.baseVal` và `result.animVal` của filter sẽ là chuỗi rỗng, và đầu ra của filter `<feBlend>` chỉ có thể được sử dụng lại làm đầu vào ngầm định cho filter primitive tiếp theo nếu filter primitive đó không cung cấp giá trị cho thuộc tính `in` của nó.

## Giá trị

Một {{domxref("SVGAnimatedString")}}.

## Ví dụ

```js
const feBlendElement = document.querySelector("feBlend");
const filterName = feBlendElement.result;
console.log(filterName.baseVal); // the filter's assigned name
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEBlendElement.in1")}}
- Kiểu dữ liệu {{cssxref("custom-ident")}}
- Kiểu dữ liệu CSS {{cssxref("blend-mode")}}
- Thuộc tính CSS {{cssxref("mix-blend-mode")}}
