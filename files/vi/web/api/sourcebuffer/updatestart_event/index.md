---
title: "SourceBuffer: sự kiện bắt đầu cập nhật"
short-title: updatestart
slug: Web/API/SourceBuffer/updatestart_event
page-type: web-api-event
browser-compat: api.SourceBuffer.updatestart_event
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}

Sự kiện **`updatestart`** của giao diện {{domxref("SourceBuffer")}} báo hiệu sự bắt đầu của một thao tác {{domxref("SourceBuffer.appendBuffer", "appendBuffer()")}} hoặc {{domxref("SourceBuffer.remove", "remove()")}}. Thuộc tính {{domxref("SourceBuffer.updating", "updating")}} chuyển đổi từ `false` sang `true`.


## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}} hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("updatestart", (event) => { })

onupdatestart = (event) => { }
```


## Loại sự kiện


Một {{domxref("Event")}} chung.


## Ví dụ

### Lắng nghe sự kiện updatestart

```js
const sourceBuffer = source.addSourceBuffer(mimeCodec);
sourceBuffer.addEventListener("updatestart", () => {
  downloadStatus.textContent = "Modifying buffer...";
});
sourceBuffer.addEventListener("updateend", () => {

  downloadStatus.textContent = "Modification complete";
});
```


## Thông số kỹ thuật


{{Specifications}}


## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SourceBuffer.appendBuffer()")}}
- {{domxref("SourceBuffer.remove()")}}
