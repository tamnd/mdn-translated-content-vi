---
title: "SourceBuffer: sự kiện lỗi"
short-title: error
slug: Web/API/SourceBuffer/error_event
page-type: web-api-event
browser-compat: api.SourceBuffer.error_event
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}

Sự kiện **`error`** của giao diện {{domxref("SourceBuffer")}} được kích hoạt khi xảy ra lỗi trong quá trình xử lý thao tác {{domxref("SourceBuffer.appendBuffer", "appendBuffer()")}}. Điều này có thể xảy ra, ví dụ: nếu dữ liệu được thêm vào không ở định dạng mong muốn, `SourceBuffer` ở trạng thái không hợp lệ hoặc tác nhân người dùng không thể xử lý dữ liệu. Thuộc tính {{domxref("SourceBuffer.updating", "updating")}} chuyển đổi từ `true` sang `false`. Sự kiện này được kích hoạt trước sự kiện {{domxref("SourceBuffer.updateend_event", "updateend")}}.


## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}} hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("error", (event) => { })

onerror = (event) => { }
```


## Loại sự kiện


Một {{domxref("Event")}} chung.


## Ví dụ

### Xử lý lỗi trong quá trình addBuffer()

Ví dụ này trình bày cách xử lý các lỗi xảy ra trong thao tác `appendBuffer()`.

```js
const sourceBuffer = source.addSourceBuffer(mimeCodec);
sourceBuffer.addEventListener("error", () => {
  downloadStatus.textContent = "Error occurred during decoding";
});
sourceBuffer.addEventListener("update", () => {
  downloadStatus.textContent = "Done";
});
sourceBuffer.addEventListener("updateend", () => {
  source.endOfStream();
});
downloadStatus.textContent = "Downloading...";
fetch(assetURL)
  .then((response) => response.arrayBuffer())
  .then((data) => {
    downloadStatus.textContent = "Decoding...";

    sourceBuffer.appendBuffer(data);
  });
```


## Thông số kỹ thuật


{{Specifications}}


## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SourceBuffer.appendBuffer()")}}
- {{domxref("SourceBuffer.remove()")}}
