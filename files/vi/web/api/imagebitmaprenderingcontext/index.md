---
title: ImageBitmapRenderingContext
slug: Web/API/ImageBitmapRenderingContext
page-type: web-api-interface
browser-compat: api.ImageBitmapRenderingContext
---

{{APIRef("Canvas API")}}{{AvailableInWorkers}}

Giao diện **`ImageBitmapRenderingContext`** là một ngữ cảnh kết xuất canvas cung cấp chức năng thay thế nội dung của canvas bằng {{domxref("ImageBitmap")}} đã cho. ID ngữ cảnh của nó (tham số đầu tiên của {{domxref("HTMLCanvasElement.getContext()")}} hoặc {{domxref("OffscreenCanvas.getContext()")}}) là `"bitmaprenderer"`.

Giao diện này có sẵn trong cả ngữ cảnh window và [worker](/en-US/docs/Web/API/Web_Workers_API).

## Thuộc tính phiên bản

- {{domxref("ImageBitmapRenderingContext.canvas")}} {{ReadOnlyInline}}
  - : Tham chiếu chỉ đọc đến đối tượng {{domxref("HTMLCanvasElement")}} hoặc {{domxref("OffscreenCanvas")}} được liên kết với ngữ cảnh đã cho.

## Phương thức phiên bản

- {{domxref("ImageBitmapRenderingContext.transferFromImageBitmap()")}}
  - : Hiển thị `ImageBitmap` đã cho trong canvas liên kết với ngữ cảnh kết xuất này. Quyền sở hữu `ImageBitmap` được chuyển cho canvas. Tên cũ là `transferImageBitmap()`, nhưng đã được đổi tên trong một thay đổi thông số kỹ thuật. Tên cũ vẫn được giữ lại như một bí danh để tránh phá vỡ code.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("OffscreenCanvas")}}
