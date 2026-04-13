---
title: "VideoEncoder: phương thức reset()"
short-title: reset()
slug: Web/API/VideoEncoder/reset
page-type: web-api-instance-method
browser-compat: api.VideoEncoder.reset
---

{{APIRef("WebCodecs API")}}{{SecureContext_Header}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`reset()`** của giao diện {{domxref("VideoEncoder")}} đồng bộ hủy tất cả các lần mã hóa và callback đang chờ, giải phóng tất cả tài nguyên bên dưới và đặt {{domxref("VideoEncoder.state", "state")}} thành "unconfigured".
Sau khi gọi `reset()`, phải gọi {{domxref("VideoEncoder.configure()", "configure()")}} trước khi tiếp tục các lần gọi {{domxref("VideoEncoder.encode()", "encode()")}}.

> [!NOTE]
> Để tránh loại bỏ các khung đã được thêm vào hàng đợi qua {{domxref("VideoEncoder.encode()", "encode()")}}, nên gọi {{domxref("VideoEncoder.flush()", "flush()")}} và đợi nó hoàn thành trước khi gọi `reset()`.

## Cú pháp

```js-nolint
reset()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Ném ra nếu {{domxref("VideoEncoder.state","state")}} là `"closed"`.

## Ví dụ

Ví dụ sau đây đặt lại `VideoEncoder`.

```js
VideoEncoder.reset();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
