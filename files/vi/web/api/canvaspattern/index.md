---
title: CanvasPattern
slug: Web/API/CanvasPattern
page-type: web-api-interface
browser-compat: api.CanvasPattern
---

{{APIRef("Canvas API")}}{{AvailableInWorkers}}

**`CanvasPattern`** là giao diện đại diện cho một [đối tượng trừu tượng](https://en.wikipedia.org/wiki/Opaque_data_type) mô tả một mẫu, dựa trên ảnh, canvas hoặc video, được tạo bởi phương thức {{domxref("CanvasRenderingContext2D.createPattern()")}}.

Nó có thể được dùng làm {{domxref("CanvasRenderingContext2D.fillStyle", "fillStyle")}} hoặc {{domxref("CanvasRenderingContext2D.strokeStyle", "strokeStyle")}}.

## Thuộc tính thể hiện

_Vì đây là một đối tượng trừu tượng, nên không có thuộc tính nào được lộ ra._

## Phương thức thể hiện

_Không có phương thức kế thừa._

- {{domxref("CanvasPattern.setTransform()")}}
  - : Áp dụng một {{domxref("DOMMatrix")}} biểu diễn một phép biến đổi tuyến tính lên mẫu.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CanvasRenderingContext2D.createPattern()")}}
- Phần tử {{HTMLElement("canvas")}} và giao diện liên quan của nó, {{domxref("HTMLCanvasElement")}}
