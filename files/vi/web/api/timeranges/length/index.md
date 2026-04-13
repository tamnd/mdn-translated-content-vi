---
title: "TimeRanges: thuộc tính length"
short-title: length
slug: Web/API/TimeRanges/length
page-type: web-api-instance-property
browser-compat: api.TimeRanges.length
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`TimeRanges.length`** trả về số khoảng trong đối tượng.

## Giá trị

Một số.

## Ví dụ

Cho một phần tử video với ID "myVideo":

```js
const v = document.getElementById("myVideo");

const buf = v.buffered;

const numRanges = buf.length;

if (buf.length === 1) {
  // Only one range
  if (buf.start(0) === 0 && buf.end(0) === v.duration) {
    // The one range starts at the beginning and ends at
    // the end of the video, so the whole thing is loaded
  }
}
```

Ví dụ này xem xét các khoảng thời gian và kiểm tra xem toàn bộ video đã được tải chưa.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
