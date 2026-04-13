---
title: "HTMLMediaElement: thuộc tính error"
short-title: error
slug: Web/API/HTMLMediaElement/error
page-type: web-api-instance-property
browser-compat: api.HTMLMediaElement.error
---

{{APIRef("HTML DOM")}}

Thuộc tính **`HTMLMediaElement.error`** là
{{domxref("MediaError")}} đối tượng cho lỗi gần đây nhất hoặc `null` nếu
chưa hề có một lỗi nào. Khi một sự kiện {{domxref("HTMLMediaElement/error_event", "error")}} được nhận bởi
phần tử, bạn có thể xác định chi tiết về những gì đã xảy ra bằng cách kiểm tra đối tượng này.

## Giá trị

Một đối tượng {{domxref("MediaError")}} mô tả lỗi gần đây nhất xảy ra trên
phần tử media hoặc `null` nếu không có lỗi xảy ra.

## Ví dụ

Ví dụ này thiết lập phần tử video và thêm trình xử lý lỗi vào phần tử đó; lỗi
trình xử lý ghi nhật ký chi tiết vào bảng điều khiển.

```js
const videoElement = document.createElement("video");
videoElement.onerror = () => {
  console.error(
    `Error ${videoElement.error.code}; details: ${videoElement.error.message}`,
  );
};
videoElement.src = "https://example.com/bogusvideo.mp4";
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLMediaElement")}}: Giao diện dùng để định nghĩa thuộc tính `HTMLMediaElement.error`
- {{HTMLElement("audio")}} và {{HTMLElement("video")}}
