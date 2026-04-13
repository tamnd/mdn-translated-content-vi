---
title: "SVGAnimatedBoolean: thuộc tính animVal"
short-title: animVal
slug: Web/API/SVGAnimatedBoolean/animVal
page-type: web-api-instance-property
browser-compat: api.SVGAnimatedBoolean.animVal
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`animVal`** của giao diện {{domxref("SVGAnimatedBoolean")}} đại diện cho giá trị hoạt hình hiện tại của thuộc tính SVG boolean có thể hoạt hình liên quan. Nếu thuộc tính không được hoạt hình, `animVal` giống với {{domxref("SVGAnimatedBoolean.baseVal")}}.

Một số thuộc tính SVG boolean, như [`preserveAlpha`](/en-US/docs/Web/SVG/Reference/Attribute/preserveAlpha), có thể được hoạt hình. Trong những trường hợp đó, thuộc tính `SVGAnimatedBoolean.animVal` là `true` khi giá trị thuộc tính phân giải thành true. Nếu không, giá trị là `false`.

## Giá trị

Một giá trị boolean; giá trị của thuộc tính boolean có thể hoạt hình.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGElement")}}
- {{domxref("SVGAnimationElement")}}
