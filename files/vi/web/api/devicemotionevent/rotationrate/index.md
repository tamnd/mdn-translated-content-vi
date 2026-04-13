---
title: "DeviceMotionEvent: rotationRate property"
short-title: rotationRate
slug: Web/API/DeviceMotionEvent/rotationRate
page-type: web-api-instance-property
browser-compat: api.DeviceMotionEvent.rotationRate
---

{{APIRef("Device Orientation Events")}}{{securecontext_header}}

Thuộc tính chỉ đọc **`rotationRate`** của giao diện {{domxref("DeviceMotionEvent")}} trả về tốc độ quay của thiết bị quanh mỗi trục của nó tính bằng độ trên giây.

> [!NOTE]
> Nếu phần cứng không thể cung cấp thông tin này, thuộc tính này trả về `null`.

## Giá trị

Thuộc tính `rotationRate` là đối tượng chỉ đọc mô tả tốc độ quay của thiết bị quanh mỗi trục của nó:

- `alpha`
  - : Tốc độ thiết bị quay quanh trục X của nó, tức là từ trước ra sau.
- `beta`
  - : Tốc độ thiết bị quay quanh trục Y của nó, tức là từ bên này sang bên kia.
- `gamma`
  - : Tốc độ thiết bị quay quanh trục Z của nó, tức là xoắn quanh một đường thẳng vuông góc với màn hình.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Device orientation events/Detecting device orientation", "Detecting device orientation", "", "nocode")}}
- {{domxref("Device orientation events/Orientation and motion data explained", "Orientation and motion data explained", "", "nocode")}}
- {{DOMxRef("Window/devicemotion_event", "devicemotion")}} event
