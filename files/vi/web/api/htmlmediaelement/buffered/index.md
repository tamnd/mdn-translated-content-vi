---
title: "HTMLMediaElement: thuộc tính buffered"
short-title: buffered
slug: Web/API/HTMLMediaElement/buffered
page-type: web-api-instance-property
browser-compat: api.HTMLMediaElement.buffered
---

{{APIRef("HTML DOM")}}

Thuộc tính **`buffered`** chỉ đọc của các đối tượng {{domxref("HTMLMediaElement")}} trả về một [normalized `TimeRanges` object](/en-US/docs/Web/API/TimeRanges#normalized_timeranges_objects) tĩnh mới đại diện cho phạm vi của tài nguyên phương tiện, nếu có, mà tác nhân người dùng đã lưu vào bộ đệm tại thời điểm thuộc tính `buffered` được truy cập.

## Giá trị

Một [normalized TimeRanges object](/en-US/docs/Web/API/TimeRanges#normalized_timeranges_objects) tĩnh mới đại diện cho phạm vi của tài nguyên phương tiện, nếu có, mà tác nhân người dùng đã lưu vào bộ đệm tại thời điểm thuộc tính `buffered` được truy cập.

## Ví dụ

```js
const obj = document.createElement("video");
console.log(obj.buffered); // TimeRanges { length: 0 }
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLMediaElement")}}: Giao diện dùng để định nghĩa thuộc tính `HTMLMediaElement.buffered`
