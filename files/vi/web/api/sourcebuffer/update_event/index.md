---
title: "SourceBuffer: sự kiện cập nhật"
short-title: update
slug: Web/API/SourceBuffer/update_event
page-type: web-api-event
browser-compat: api.SourceBuffer.update_event
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}

Sự kiện **`update`** của giao diện {{domxref("SourceBuffer")}} báo hiệu việc hoàn thành thành công thao tác {{domxref("SourceBuffer.appendBuffer", "appendBuffer()")}} hoặc {{domxref("SourceBuffer.remove", "remove()")}}. Thuộc tính {{domxref("SourceBuffer.updating", "updating")}} chuyển đổi từ `true` sang `false`. Sự kiện này được kích hoạt trước sự kiện {{domxref("SourceBuffer.updateend_event", "updateend")}}.


## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}} hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("update", (event) => { })

onupdate = (event) => { }
```


## Loại sự kiện


Một [[[PH8]] chung chung.


## Ví dụ

### Xử lý sự kiện cập nhật sau khi thêm dữ liệu

Ví dụ này minh họa cách xử lý sự kiện `update` sau khi thao tác `appendBuffer()` thành công.

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
