---
title: "HTMLMediaElement: thuộc tính seekable"
short-title: seekable
slug: Web/API/HTMLMediaElement/seekable
page-type: web-api-instance-property
browser-compat: api.HTMLMediaElement.seekable
---

{{APIRef("HTML DOM")}}

Thuộc tính **`seekable`** chỉ đọc của các đối tượng {{domxref("HTMLMediaElement")}} trả về một [normalized `TimeRanges` object](/en-US/docs/Web/API/TimeRanges#normalized_timeranges_objects) tĩnh mới đại diện cho phạm vi của tài nguyên phương tiện, nếu có, mà tác nhân người dùng có thể tìm kiếm tại thời điểm thuộc tính `seekable` được truy cập.

## Giá trị

Một [normalized TimeRanges object](/en-US/docs/Web/API/TimeRanges#normalized_timeranges_objects) tĩnh mới đại diện cho phạm vi của tài nguyên phương tiện, nếu có, mà tác nhân người dùng có thể tìm kiếm tại thời điểm thuộc tính `seekable` được truy cập.

## Ví dụ

```js
const video = document.querySelector("video");
const timeRangesObject = video.seekable;
const timeRanges = [];
// Go through the object and output an array
for (let count = 0; count < timeRangesObject.length; count++) {
  timeRanges.push([timeRangesObject.start(count), timeRangesObject.end(count)]);
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLMediaElement")}}: Giao diện dùng để định nghĩa thuộc tính `HTMLMediaElement.seekable`
- [Media Source API](/en-US/docs/Web/API/Media_Source_Extensions_API)
- [Media buffering, seeking, and time ranges](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/buffering_seeking_time_ranges)
