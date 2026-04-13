---
title: PictureInPictureEvent
slug: Web/API/PictureInPictureEvent
page-type: web-api-interface
browser-compat: api.PictureInPictureEvent
---

{{APIRef("Picture-in-Picture API")}}

Giao diện **`PictureInPictureEvent`** đại diện cho các sự kiện liên quan đến picture-in-picture, bao gồm {{domxref("HTMLVideoElement/enterpictureinpicture_event", "enterpictureinpicture")}}, {{domxref("HTMLVideoElement/leavepictureinpicture_event", "leavepictureinpicture")}} và {{domxref("PictureInPictureWindow/resize_event", "resize")}}.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("PictureInPictureEvent.PictureInPictureEvent", "PictureInPictureEvent()")}}
  - : Tạo một sự kiện `PictureInPictureEvent` với các tham số đã cho.

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ lớp cha {{domxref("Event")}}_.

- {{domxref("PictureInPictureEvent.pictureInPictureWindow")}}
  - : Trả về {{domxref("PictureInPictureWindow")}} mà sự kiện liên quan đến.

## Phương thức phiên bản

_Giao diện này cũng kế thừa các phương thức từ lớp cha {{domxref("Event")}}_.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện cơ sở {{domxref("Event")}}
