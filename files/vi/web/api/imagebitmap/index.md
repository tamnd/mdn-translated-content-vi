---
title: ImageBitmap
slug: Web/API/ImageBitmap
page-type: web-api-interface
browser-compat: api.ImageBitmap
---

{{APIRef("Canvas API")}}{{AvailableInWorkers}}

Giao diện **`ImageBitmap`** biểu thị một ảnh bitmap có thể được vẽ lên {{HTMLElement("canvas")}} mà không gây độ trễ đáng kể. Nó có thể được tạo từ nhiều đối tượng nguồn khác nhau bằng phương thức factory {{domxref("Window.createImageBitmap()")}} hoặc {{domxref("WorkerGlobalScope.createImageBitmap()")}}. `ImageBitmap` cung cấp một lộ trình bất đồng bộ và hiệu quả về tài nguyên để chuẩn bị texture cho việc render trong WebGL.

`ImageBitmap` là một [đối tượng có thể chuyển giao](/en-US/docs/Web/API/Web_Workers_API/Transferable_objects).

## Thuộc tính thực thể

- {{domxref("ImageBitmap.height")}} {{ReadOnlyInline}}
  - : Một `unsigned long` biểu thị chiều cao của `ImageBitmap`, tính bằng pixel CSS.
- {{domxref("ImageBitmap.width")}} {{ReadOnlyInline}}
  - : Một `unsigned long` biểu thị chiều rộng của `ImageBitmap`, tính bằng pixel CSS.

## Phương thức thực thể

- {{domxref("ImageBitmap.close()")}}
  - : Giải phóng tất cả tài nguyên đồ họa liên kết với một `ImageBitmap`.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Window.createImageBitmap")}}
- {{domxref("WorkerGlobalScope.createImageBitmap")}}
- {{domxref("CanvasRenderingContext2D.drawImage()")}}
- {{domxref("WebGLRenderingContext.texImage2D()")}}
- {{domxref("OffscreenCanvas.transferToImageBitmap()")}}
