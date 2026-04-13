---
title: "SVGSVGElement: thuộc tính currentTranslate"
short-title: currentTranslate
slug: Web/API/SVGSVGElement/currentTranslate
page-type: web-api-instance-property
browser-compat: api.SVGSVGElement.currentTranslate
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`currentTranslate`** của giao diện {{domxref("SVGSVGElement")}} phản ánh hệ số dịch chuyển tính đến thao tác "phóng to" của người dùng tương ứng với phần tử {{SVGElement("svg")}} ngoài cùng.

Nếu phần tử {{SVGElement("svg")}} không ở cấp ngoài cùng, thì `currentTranslate` luôn là `{ x: 0, y: 0 }` và chỉ đọc. Ngược lại, nó có thể ghi.

## Giá trị

Một {{domxref("DOMPointReadOnly")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGSVGElement.currentScale")}}
- {{domxref("DOMPointReadOnly")}}
