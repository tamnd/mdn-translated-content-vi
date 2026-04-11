---
title: "SVGSVGElement: thuộc tính currentScale"
short-title: currentScale
slug: Web/API/SVGSVGElement/currentScale
page-type: web-api-instance-property
browser-compat: api.SVGSVGElement.currentScale
---

{{APIRef("SVG")}}

Thuộc tính **`currentScale`** của giao diện {{domxref("SVGSVGElement")}} phản ánh hệ số tỉ lệ hiện tại so với chế độ xem ban đầu, tính đến các thao tác phóng to và di chuyển của người dùng trên phần tử {{SVGElement("svg")}} ngoài cùng.

Các thuộc tính DOM `currentScale` và `currentTranslate` tương đương với ma trận 2×3 `[a b c d e f] = [currentScale 0 0 currentScale currentTranslate.x currentTranslate.y]`. Nếu "phóng to" được bật (tức là `zoomAndPan="magnify"`), hiệu ứng như thể có một phép biến đổi bổ sung được đặt ở cấp ngoài cùng trên mảnh tài liệu SVG (tức là bên ngoài phần tử {{SVGElement("svg")}} ngoài cùng).

Nếu phần tử {{SVGElement("svg")}} không ở cấp ngoài cùng, thì `currentScale` luôn là `1` và việc đặt giá trị cho nó không có hiệu lực.

## Giá trị

Một số thực (float).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGSVGElement.currentTranslate")}}
