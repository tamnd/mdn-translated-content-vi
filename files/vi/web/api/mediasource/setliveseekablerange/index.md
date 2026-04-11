---
title: "MediaSource: setLiveSeekableRange() method"
short-title: setLiveSeekableRange()
slug: Web/API/MediaSource/setLiveSeekableRange
page-type: web-api-instance-method
browser-compat: api.MediaSource.setLiveSeekableRange
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`setLiveSeekableRange()`** của giao diện {{domxref("MediaSource")}} đặt vùng mà người dùng có thể tua đến trong media element.

## Cú pháp

```js-nolint
setLiveSeekableRange(start, end)
```

### Tham số

- `start`
  - : Điểm bắt đầu của vùng có thể tua cần đặt, tính bằng giây kể từ đầu nguồn. Nếu thời lượng của media source là vô cùng dương, thì đối tượng {{domxref("TimeRanges")}} được trả về bởi thuộc tính {{domxref("HTMLMediaElement.seekable")}} sẽ có timestamp bắt đầu không lớn hơn giá trị này.
- `end`
  - : Điểm kết thúc của vùng có thể tua cần đặt, tính bằng giây kể từ đầu nguồn. Nếu thời lượng của media source là vô cùng dương, thì đối tượng {{domxref("TimeRanges")}} được trả về bởi thuộc tính {{domxref("HTMLMediaElement.seekable")}} sẽ có timestamp kết thúc không nhỏ hơn giá trị này.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
// TBD
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
