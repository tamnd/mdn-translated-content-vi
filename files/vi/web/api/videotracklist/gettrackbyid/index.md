---
title: "VideoTrackList: getTrackById() method"
short-title: getTrackById()
slug: Web/API/VideoTrackList/getTrackById
page-type: web-api-instance-method
browser-compat: api.VideoTrackList.getTrackById
---

{{APIRef("HTML DOM")}}

Phương thức **`getTrackById()`** của **{{domxref("VideoTrackList")}}** trả về đối tượng {{domxref("VideoTrack")}} đầu tiên từ danh sách track có {{domxref("VideoTrack.id", "id")}} khớp với chuỗi được chỉ định.

Điều này cho phép bạn tìm track được chỉ định nếu bạn biết chuỗi ID của nó.

## Cú pháp

```js-nolint
getTrackById(id)
```

### Tham số

- `id`
  - : Chuỗi chỉ định ID của track cần xác định vị trí trong danh sách track.

### Giá trị trả về

Đối tượng {{domxref("VideoTrack")}} chỉ track đầu tiên tìm thấy trong `VideoTrackList` có `id` khớp với chuỗi được chỉ định. Nếu không tìm thấy kết quả khớp, phương thức này trả về `null`.

Các track được tìm kiếm theo thứ tự tự nhiên của chúng; tức là theo thứ tự được định nghĩa bởi tài nguyên media, hoặc nếu tài nguyên không định nghĩa thứ tự, thứ tự tương đối mà các track được khai báo bởi tài nguyên media.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
