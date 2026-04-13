---
title: "SVGAnimatedInteger: thuộc tính animVal"
short-title: animVal
slug: Web/API/SVGAnimatedInteger/animVal
page-type: web-api-instance-property
browser-compat: api.SVGAnimatedInteger.animVal
---

{{APIRef("SVG")}}

Thuộc tính **`animVal`** của giao diện {{domxref("SVGAnimatedInteger")}} đại diện cho giá trị hoạt hình của một [`<integer>`](/en-US/docs/Web/SVG/Guides/Content_type#integer). Nếu không có hoạt hình nào được áp dụng, `animVal` bằng với `baseVal`.

Một số thuộc tính, như thuộc tính {{SVGAttr("numOctaves")}} của phần tử {{SVGElement("feTurbulence")}} hoặc thuộc tính {{SVGAttr("order")}} của phần tử {{SVGElement("feConvolveMatrix")}}, chấp nhận số nguyên `long` làm giá trị. Thuộc tính này cung cấp quyền truy cập vào trạng thái hoạt hình hiện tại của thuộc tính dưới dạng số.

## Giá trị

Một `long`; giá trị hoạt hình của thuộc tính.

## Ví dụ

```js
const feTurbulence = document.querySelector("feTurbulence");

// Đặt thuộc tính 'numOctaves' có thể hoạt hình
feTurbulence.setAttribute("numOctaves", "4");

// Truy cập đối tượng SVGAnimatedInteger
const animatedInteger = feTurbulence.numOctaves;

// Lấy giá trị hoạt hình (chỉ đọc)
console.log(animatedInteger.animVal); // Đầu ra: 4 (giá trị hoạt hình hiện tại)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`<integer>`](/en-US/docs/Web/SVG/Guides/Content_type#integer)
- {{SVGAttr("numOctaves")}}
- {{SVGAttr("order")}}
