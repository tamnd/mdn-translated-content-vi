---
title: "SVGFEOffsetElement: result property"
short-title: result
slug: Web/API/SVGFEOffsetElement/result
page-type: web-api-instance-property
browser-compat: api.SVGFEOffsetElement.result
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`result`** của giao diện {{domxref("SVGFEOffsetElement")}} mô tả tên được gán cho một SVG filter primitive dưới dạng {{domxref("SVGAnimatedString")}}.

Nó phản ánh thuộc tính {{SVGAttr("result")}} của phần tử {{SVGElement("feOffset")}}, phần tử này dịch chuyển ảnh đầu vào so với vị trí hiện tại của nó. Giá trị thuộc tính là {{cssxref("custom-ident")}}. Nếu được cung cấp, đồ họa kết quả từ việc xử lý filter primitive này có thể được tham chiếu bởi thuộc tính {{SVGAttr("in")}} trên filter primitive tiếp theo trong cùng phần tử {{SVGElement("filter")}}.

Nếu không có thuộc tính `result` nào được định nghĩa, `result.baseVal` và `result.animVal` của filter sẽ là chuỗi rỗng, và đầu ra của filter `<feOffset>` chỉ có thể được sử dụng lại làm đầu vào ngầm định cho filter primitive tiếp theo nếu filter primitive đó không cung cấp giá trị cho thuộc tính `in` của nó.

## Giá trị

Một {{domxref("SVGAnimatedString")}}.

## Ví dụ

```js
const feOffsetElement = document.querySelector("feOffset");
const filterName = feOffsetElement.result;
console.log(filterName.baseVal); // the filter's assigned name
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGFEOffsetElement.in1")}}
- Kiểu dữ liệu {{cssxref("custom-ident")}}
