---
title: ImageTrack
slug: Web/API/ImageTrack
page-type: web-api-interface
browser-compat: api.ImageTrack
---

{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Giao diện **`ImageTrack`** của {{domxref('WebCodecs API','','','true')}} đại diện cho một track hình ảnh riêng lẻ.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("ImageTrack.animated")}} {{ReadOnlyInline}}
  - : Trả về {{jsxref("boolean")}} cho biết track có được hoạt hình hóa và do đó có nhiều khung hình hay không.
- {{domxref("ImageTrack.frameCount")}} {{ReadOnlyInline}}
  - : Trả về số nguyên cho biết số lượng khung hình trong track.
- {{domxref("ImageTrack.repetitionCount")}} {{ReadOnlyInline}}
  - : Trả về số nguyên cho biết số lần hoạt hình lặp lại.
- {{domxref("ImageTrack.selected")}} {{ReadOnlyInline}}
  - : Trả về {{jsxref("boolean")}} cho biết track có được chọn để giải mã hay không.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
