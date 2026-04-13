---
title: "SourceBuffer: phương thức Remove()"
short-title: remove()
slug: Web/API/SourceBuffer/remove
page-type: web-api-instance-method
browser-compat: api.SourceBuffer.remove
---

{{APIRef("Media Source Extensions")}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`remove()`** của {{domxref("SourceBuffer")}}
giao diện loại bỏ các phân đoạn phương tiện trong một phạm vi thời gian cụ thể khỏi
`SourceBuffer`. Phương thức này chỉ có thể được gọi khi
{{domxref("SourceBuffer.updating")}} bằng `false`. Nếu
`SourceBuffer.updating` không bằng `false`, hãy gọi
{{domxref("SourceBuffer.abort()")}}.


## Cú pháp

```js-nolint
remove(start, end)
```


### Thông số

- `start`
  - : Một double biểu thị thời điểm bắt đầu của phạm vi thời gian, tính bằng giây.
- `end`

  - : Một double biểu thị sự kết thúc của khoảng thời gian, tính bằng giây.

### Giá trị trả về


Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidAccessError` {{domxref("DOMException")}}
  - : Được ném nếu thuộc tính {{domxref("MediaSource.duration")}} bằng `NaN`, tham số `start` âm hoặc lớn hơn {{domxref("MediaSource.duration")}} hoặc tham số `end` nhỏ hơn hoặc bằng `start` hoặc bằng `NaN`.

- `InvalidStateError` {{domxref("DOMException")}}

  - : Được ném nếu thuộc tính {{domxref("SourceBuffer.updating")}} bằng
    tới `true` hoặc `SourceBuffer` này đã bị xóa
    từ {{domxref("MediaSource")}}.


## Ví dụ


TBD.

## Thông số kỹ thuật


{{Specifications}}


## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("MediaSource")}}
- {{domxref("SourceBufferList")}}
