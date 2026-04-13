---
title: "SourceBuffer: cập nhật sự kiện cuối"
short-title: updateend
slug: Web/API/SourceBuffer/updateend_event
page-type: web-api-event
browser-compat: api.SourceBuffer.updateend_event
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}

Sự kiện **`updateend`** của giao diện {{domxref("SourceBuffer")}} báo hiệu sự hoàn thành (không nhất thiết thành công) của thao tác {{domxref("SourceBuffer.appendBuffer", "appendBuffer()")}} hoặc {{domxref("SourceBuffer.remove", "remove()")}}. Thuộc tính {{domxref("SourceBuffer.updating", "updating")}} chuyển đổi từ `true` sang `false`. Sự kiện này được kích hoạt sau các sự kiện {{domxref("SourceBuffer.update_event", "update")}}, {{domxref("SourceBuffer.error_event", "error")}} hoặc {{domxref("SourceBuffer.abort_event", "abort")}}.


## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}} hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("updateend", (event) => { })

onupdateend = (event) => { }
```


## Loại sự kiện


Một [[[PH10]] chung chung.


## Ví dụ

### Xử lý sự kiện updateend sau khi thêm dữ liệu

Ví dụ này minh hoạ cách xử lý sự kiện `updateend`. Lưu ý rằng chúng tôi xử lý riêng từng sự kiện hoàn thành và chỉ sử dụng `updateend` để hoàn tất luồng.

```js
const sourceBuffer = source.addSourceBuffer(mimeCodec);
sourceBuffer.addEventListener("abort", () => {
  downloadStatus.textContent = "Canceled";
});
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
