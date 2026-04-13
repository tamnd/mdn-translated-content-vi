---
title: "TimeRanges: phương thức end()"
short-title: end()
slug: Web/API/TimeRanges/end
page-type: web-api-instance-method
browser-compat: api.TimeRanges.end
---

{{APIRef("HTML DOM")}}

Phương thức **`end()`** của giao diện {{domxref("TimeRanges")}} trả về offset thời gian (tính bằng giây) tại đó một khoảng thời gian được chỉ định kết thúc.

## Cú pháp

```js-nolint
end(index)
```

### Tham số

- `index`
  - : Số khoảng để trả về thời gian kết thúc.

### Giá trị trả về

Một số.

### Ngoại lệ

- `IndexSizeError` {{domxref("DOMException")}}
  - : Được ném nếu chỉ mục được chỉ định không tương ứng với khoảng hiện có.

## Ví dụ

Cho một phần tử video với ID `"myVideo"`:

```js
const v = document.getElementById("myVideo");

const buf = v.buffered;

const numRanges = buf.length;

if (buf.length === 1) {
  // only one range
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
