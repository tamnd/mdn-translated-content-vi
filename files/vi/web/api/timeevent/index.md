---
title: TimeEvent
slug: Web/API/TimeEvent
page-type: web-api-interface
browser-compat: api.TimeEvent
---

{{APIRef("SVG")}}

Giao diện **`TimeEvent`**, là một phần của hoạt hình [SVG SMIL](/en-US/docs/Web/SVG/Guides/SVG_animation_with_SMIL), cung cấp thông tin ngữ cảnh cụ thể liên quan đến các sự kiện Time.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("TimeEvent.detail")}} {{ReadOnlyInline}}
  - : Một `long` chỉ định thông tin chi tiết về Sự kiện, tùy thuộc vào loại sự kiện. Đối với loại sự kiện này, chỉ định số lần lặp cho hoạt hình.
- {{domxref("TimeEvent.view")}} {{ReadOnlyInline}}
  - : Một {{glossary("WindowProxy")}} xác định Window mà sự kiện được tạo ra từ đó.

## Phương thức phiên bản

- {{domxref("TimeEvent.initTimeEvent()")}}
  - : Được dùng để khởi tạo giá trị của TimeEvent được tạo qua giao diện DocumentEvent. Phương thức này chỉ có thể được gọi trước khi TimeEvent được gửi đi qua phương thức dispatchEvent, mặc dù nó có thể được gọi nhiều lần trong giai đoạn đó nếu cần thiết.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
