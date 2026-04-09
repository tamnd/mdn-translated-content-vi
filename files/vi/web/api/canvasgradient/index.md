---
title: CanvasGradient
slug: Web/API/CanvasGradient
page-type: web-api-interface
browser-compat: api.CanvasGradient
---

{{APIRef("Canvas API")}}{{AvailableInWorkers}}

**`CanvasGradient`** là giao diện đại diện cho một [đối tượng trừu tượng](https://en.wikipedia.org/wiki/Opaque_data_type) mô tả một dải màu chuyển sắc. Nó được trả về bởi các phương thức {{domxref("CanvasRenderingContext2D.createLinearGradient()")}}, {{domxref("CanvasRenderingContext2D.createConicGradient()")}} hoặc {{domxref("CanvasRenderingContext2D.createRadialGradient()")}}.

Nó có thể được dùng làm {{domxref("CanvasRenderingContext2D.fillStyle", "fillStyle")}} hoặc {{domxref("CanvasRenderingContext2D.strokeStyle", "strokeStyle")}}.

## Thuộc tính thể hiện

_Vì đây là một đối tượng trừu tượng, nên không có thuộc tính nào được lộ ra._

## Phương thức thể hiện

- {{domxref("CanvasGradient.addColorStop()")}}
  - : Thêm một điểm dừng mới, được xác định bởi `offset` và `color`, vào dải màu chuyển sắc.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các phương thức tạo trong {{domxref("CanvasRenderingContext2D")}}.
- Phần tử {{HTMLElement("canvas")}} và giao diện liên quan của nó, {{domxref("HTMLCanvasElement")}}.
