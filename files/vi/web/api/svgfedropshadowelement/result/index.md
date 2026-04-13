---
title: "SVGFEDropShadowElement: result property"
short-title: result
slug: Web/API/SVGFEDropShadowElement/result
page-type: web-api-instance-property
browser-compat: api.SVGFEDropShadowElement.result
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`result`** của giao diện {{domxref("SVGFEDropShadowElement")}} mô tả tên được gán của một bộ lọc SVG dưới dạng {{domxref("SVGAnimatedString")}}.

Nó phản ánh thuộc tính {{SVGAttr("result")}}. Giá trị thuộc tính là {{cssxref("custom-ident")}}. Nếu được cung cấp, đồ họa kết quả từ việc xử lý bộ lọc này có thể được tham chiếu bằng thuộc tính {{SVGAttr("in")}} trên một bộ lọc tiếp theo trong cùng phần tử {{SVGElement("filter")}}.

Nếu không có thuộc tính `result` nào được định nghĩa, `result.baseVal` và `result.animVal` của bộ lọc sẽ là các chuỗi rỗng, và đầu ra của bộ lọc `<feDropShadow>` chỉ có thể được sử dụng lại làm đầu vào ngầm định cho bộ lọc tiếp theo nếu bộ lọc đó không cung cấp giá trị cho thuộc tính `in` của nó.

## Giá trị

Một {{domxref("SVGAnimatedString")}}.

## Ví dụ

```js
const feDropShadowElement = document.querySelector("feDropShadow");
const filterName = feDropShadowElement.result;
console.log(filterName.baseVal); // the filter's assigned name
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEDropShadowElement.in1")}}
- {{cssxref("custom-ident")}} data type
- CSS {{cssxref("filter-function/drop-shadow", "drop-shadow()")}} function
- CSS {{cssxref("box-shadow")}} property
- CSS {{cssxref("text-shadow")}} property
- CSS {{cssxref("blend-mode")}} data type
- CSS {{cssxref("mix-blend-mode")}} property
