---
title: "SVGAnimatedInteger: thuộc tính baseVal"
short-title: baseVal
slug: Web/API/SVGAnimatedInteger/baseVal
page-type: web-api-instance-property
browser-compat: api.SVGAnimatedInteger.baseVal
---

{{APIRef("SVG")}}

Thuộc tính **`baseVal`** của giao diện {{domxref("SVGAnimatedInteger")}} đại diện cho giá trị cơ sở (không hoạt hình) của một [`<integer>`](/en-US/docs/Web/SVG/Guides/Content_type#integer) có thể hoạt hình.

Một số thuộc tính, như thuộc tính {{SVGAttr("numOctaves")}} của phần tử {{SVGElement("feTurbulence")}} hoặc thuộc tính {{SVGAttr("order")}} của phần tử {{SVGElement("feConvolveMatrix")}}, chấp nhận số nguyên `long` làm giá trị. Thuộc tính này cung cấp quyền truy cập vào trạng thái tĩnh không hoạt hình của thuộc tính dưới dạng số.

## Giá trị

Một `long`; giá trị cơ sở (không hoạt hình) của thuộc tính được phản chiếu.

## Ví dụ

```js
const feTurbulence = document.querySelector("feTurbulence");

// Đặt thuộc tính 'numOctaves' có thể hoạt hình
feTurbulence.setAttribute("numOctaves", "4");

// Truy cập đối tượng SVGAnimatedInteger
const animatedInteger = feTurbulence.numOctaves;

// Lấy giá trị cơ sở
console.log(animatedInteger.baseVal); // Đầu ra: 4

// Sửa đổi giá trị cơ sở
animatedInteger.baseVal = 6;

// Xác minh giá trị thuộc tính được phản chiếu
console.log(feTurbulence.getAttribute("numOctaves")); // Đầu ra: "6"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`<integer>`](/en-US/docs/Web/SVG/Guides/Content_type#integer)
- {{SVGAttr("numOctaves")}}
- {{SVGAttr("order")}}
