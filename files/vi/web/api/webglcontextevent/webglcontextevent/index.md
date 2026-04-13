---
title: "WebGLContextEvent: hàm khởi tạo WebGLContextEvent()"
short-title: WebGLContextEvent()
slug: Web/API/WebGLContextEvent/WebGLContextEvent
page-type: web-api-constructor
browser-compat: api.WebGLContextEvent.WebGLContextEvent
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Hàm khởi tạo **`WebGLContextEvent()`** tạo một đối tượng {{domxref("WebGLContextEvent")}} mới.

> [!NOTE]
> Thông thường bạn không cần gọi hàm khởi tạo này; trình duyệt tạo các đối tượng này tự động khi các sự kiện ngữ cảnh WebGL được kích hoạt. Để kích hoạt thủ công sự kiện `webglcontextlost`, hãy sử dụng {{domxref("WEBGL_lose_context.loseContext()")}}.

## Cú pháp

```js-nolint
new WebGLContextEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi cho biết loại sự kiện. Phân biệt chữ hoa chữ thường và nên là một trong các giá trị `webglcontextcreationerror`, `webglcontextlost` hoặc `webglcontextrestored`.
- `options` {{Optional_inline}}
  - : Một đối tượng, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có các thuộc tính sau:
    - `statusMessage` {{Optional_inline}}
      - : Một chuỗi với thông tin trạng thái bổ sung. Mặc định là chuỗi rỗng (`""`).

### Giá trị trả về

Một đối tượng {{domxref("WebGLContextEvent")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`webglcontextlost`](/en-US/docs/Web/API/HTMLCanvasElement/webglcontextlost_event)
- [`webglcontextrestored`](/en-US/docs/Web/API/HTMLCanvasElement/webglcontextrestored_event)
- [`webglcontextcreationerror`](/en-US/docs/Web/API/HTMLCanvasElement/webglcontextcreationerror_event)
