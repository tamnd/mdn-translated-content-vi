---
title: "SourceBuffer: hủy bỏ sự kiện"
short-title: abort
slug: Web/API/SourceBuffer/abort_event
page-type: web-api-event
browser-compat: api.SourceBuffer.abort_event
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}

Sự kiện **`abort`** của giao diện {{domxref("SourceBuffer")}} được kích hoạt khi việc thêm bộ đệm bị hủy bỏ, vì phương thức {{domxref("SourceBuffer.abort()")}} hoặc {{domxref("SourceBuffer.remove()")}} được gọi trong khi thuật toán {{domxref("SourceBuffer.appendBuffer()")}} vẫn đang chạy. Thuộc tính {{domxref("SourceBuffer.updating", "updating")}} chuyển đổi từ `true` sang `false`. Sự kiện này được kích hoạt trước sự kiện {{domxref("SourceBuffer.updateend_event", "updateend")}}.


## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}} hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("abort", (event) => { })

onabort = (event) => { }
```


## Loại sự kiện


Một {{domxref("Event")}} chung.


## Ví dụ

### Hủy bỏ thao tác chắp thêm

Ví dụ này minh họa cách hủy bỏ thao tác chắp thêm và xử lý sự kiện `abort`.

```js
const sourceBuffer = source.addSourceBuffer(mimeCodec);
sourceBuffer.addEventListener("abort", () => {
  downloadStatus.textContent = "Canceled";
});
sourceBuffer.addEventListener("update", () => {
  downloadStatus.textContent = "Done";
});
sourceBuffer.addEventListener("updateend", () => {
  source.endOfStream();
});
cancelButton.addEventListener("click", () => {
  if (sourceBuffer.updating) {
    sourceBuffer.abort();
  }
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

- {{domxref("SourceBuffer.abort()")}}
