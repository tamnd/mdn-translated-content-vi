---
title: "TextTrackList: getTrackById() method"
short-title: getTrackById()
slug: Web/API/TextTrackList/getTrackById
page-type: web-api-instance-method
browser-compat: api.TextTrackList.getTrackById
---

{{APIRef("HTML DOM")}}

Phương thức **`getTrackById()`** của **{{domxref("TextTrackList")}}** trả về đối tượng {{domxref("TextTrack")}} đầu tiên từ danh sách track có [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) khớp với chuỗi được chỉ định. Điều này cho phép bạn tìm một track cụ thể nếu bạn biết chuỗi ID của nó.

## Cú pháp

```js-nolint
getTrackById(id)
```

### Tham số

- `id`
  - : Một chuỗi chỉ định ID của track cần tìm trong danh sách track.

### Giá trị trả về

Một đối tượng {{domxref("TextTrack")}} chỉ định track đầu tiên được tìm thấy trong `TextTrackList` có `id` khớp với chuỗi được chỉ định. Nếu không tìm thấy kết quả phù hợp, phương thức này trả về `null`.

Các track được tìm kiếm theo thứ tự tự nhiên của chúng, tức là theo thứ tự được định nghĩa bởi tài nguyên media, hoặc nếu tài nguyên không định nghĩa thứ tự, theo thứ tự tương đối mà các track được khai báo bởi tài nguyên media.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
