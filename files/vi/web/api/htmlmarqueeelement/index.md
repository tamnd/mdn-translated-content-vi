---
title: HTMLMarqueeElement
slug: Web/API/HTMLMarqueeElement
page-type: web-api-interface
status:
  - deprecated
browser-compat: api.HTMLMarqueeElement
---

{{APIRef("HTML DOM")}}{{Deprecated_Header}}

Giao diện **`HTMLMarqueeElement`** cung cấp các phương thức để thao tác các phần tử {{HTMLElement("marquee")}}.

Nó kế thừa các thuộc tính và phương thức từ giao diện {{DOMxRef("HTMLElement")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ giao diện cha là {{DOMxRef("HTMLElement")}}._

- `HTMLMarqueeElement.behavior` {{Deprecated_Inline}}
  - : Đặt cách văn bản cuộn trong marquee. Các giá trị có thể là `scroll`, `slide` và `alternate`. Nếu không có giá trị nào được chỉ định, giá trị mặc định là `scroll`.
- `HTMLMarqueeElement.bgColor` {{Deprecated_Inline}}
  - : Đặt màu nền thông qua tên màu hoặc giá trị thập lục phân.
- `HTMLMarqueeElement.direction` {{Deprecated_Inline}}
  - : Đặt hướng cuộn trong marquee. Các giá trị có thể là `left`, `right`, `up` và `down`. Nếu không có giá trị nào được chỉ định, giá trị mặc định là `left`.
- `HTMLMarqueeElement.height` {{Deprecated_Inline}}
  - : Đặt chiều cao theo pixel hoặc giá trị phần trăm.
- `HTMLMarqueeElement.hspace` {{Deprecated_Inline}}
  - : Đặt lề ngang.
- `HTMLMarqueeElement.loop` {{Deprecated_Inline}}
  - : Đặt số lần marquee sẽ cuộn. Nếu không có giá trị nào được chỉ định, giá trị mặc định là −1, nghĩa là marquee sẽ cuộn liên tục.
- `HTMLMarqueeElement.scrollAmount` {{Deprecated_Inline}}
  - : Đặt lượng cuộn tại mỗi khoảng thời gian theo pixel. Giá trị mặc định là 6.
- `HTMLMarqueeElement.scrollDelay` {{Deprecated_Inline}}
  - : Đặt khoảng cách giữa mỗi chuyển động cuộn tính bằng mili giây. Giá trị mặc định là 85.
- `HTMLMarqueeElement.trueSpeed` {{Deprecated_Inline}}
  - : Theo mặc định, các giá trị `scrollDelay` nhỏ hơn 60 bị bỏ qua. Nếu `trueSpeed` là `true`, thì các giá trị đó không bị bỏ qua.
- `HTMLMarqueeElement.vspace` {{Deprecated_Inline}}
  - : Đặt lề dọc.
- `HTMLMarqueeElement.width` {{Deprecated_Inline}}
  - : Đặt chiều rộng theo pixel hoặc giá trị phần trăm.

## Phương thức phiên bản

_Kế thừa các phương thức từ giao diện cha là {{DOMxRef("HTMLElement")}}._

- `HTMLMarqueeElement.start()` {{Deprecated_Inline}}
  - : Bắt đầu cuộn của marquee.
- `HTMLMarqueeElement.stop()` {{Deprecated_Inline}}
  - : Dừng cuộn của marquee.

## Sự kiện

- `bounce` {{Deprecated_Inline}}
  - : Kích hoạt khi marquee đạt đến cuối vị trí cuộn của nó.
- `finish` {{Deprecated_Inline}}
  - : Kích hoạt khi marquee đã hoàn thành lượng cuộn được đặt bởi thuộc tính loop.
- `start` {{Deprecated_Inline}}
  - : Kích hoạt khi marquee bắt đầu cuộn.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("marquee")}}
