---
title: "HTMLMediaElement: phương thức fastSeek()"
short-title: fastSeek()
slug: Web/API/HTMLMediaElement/fastSeek
page-type: web-api-instance-method
browser-compat: api.HTMLMediaElement.fastSeek
---

{{APIRef("HTML DOM")}}

Phương thức **`HTMLMediaElement.fastSeek()`** nhanh chóng tìm kiếm
phương tiện truyền thông đến thời điểm mới với sự cân bằng chính xác.

> [!NOTE]
> Nếu bạn cần tìm kiếm chính xác thì nên đặt [`HTMLMediaElement.currentTime`](/en-US/docs/Web/API/HTMLMediaElement/currentTime)
> thay vì.

## Cú pháp

```js-nolint
fastSeek(time)
```

### Tham số

- `time`
- : Một đôi.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Ví dụ này nhanh chóng tìm kiếm vị trí 20 giây của phần tử video.

```js
let myVideo = document.getElementById("myVideoElement");

myVideo.fastSeek(20);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [HTMLMediaElement.currentTime](/en-US/docs/Web/API/HTMLMediaElement/currentTime)
  để tìm kiếm mà không có sự đánh đổi chính xác
