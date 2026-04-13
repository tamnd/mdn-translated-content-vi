---
title: "Navigator: thuộc tính windowControlsOverlay"
short-title: windowControlsOverlay
slug: Web/API/Navigator/windowControlsOverlay
page-type: web-api-instance-property
browser-compat: api.Navigator.windowControlsOverlay
---

{{SecureContext_Header}}{{APIRef("Window Controls Overlay API")}}

Thuộc tính chỉ đọc **`windowControlsOverlay`** của {{domxref("Navigator")}}
giao diện trả về giao diện {{domxref("WindowControlsOverlay")}}, hiển thị
thông tin về hình dạng thanh tiêu đề trong Ứng dụng web lũy tiến trên máy tính để bàn sử dụng [Window Controls Overlay API](/en-US/docs/Web/API/Window_Controls_Overlay_API).

Các ứng dụng web lũy tiến được cài đặt trên máy tính để bàn Hệ điều hành có thể chọn tham gia
Tính năng Lớp phủ Điều khiển Cửa sổ bằng cách sử dụng giá trị `window-controls-overlay` trong
Thành viên bảng kê khai ứng dụng web [`display_override`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/display_override).

Làm như vậy sẽ ẩn thanh tiêu đề cửa sổ mặc định và cấp cho ứng dụng quyền truy cập vào toàn bộ khu vực
của cửa sổ ứng dụng.

## Giá trị

Giao diện {{domxref("WindowControlsOverlay")}}.

## Ví dụ

```js
if ("windowControlsOverlay" in navigator) {
  const rect = navigator.windowControlsOverlay.getTitlebarAreaRect();
  // Do something with the title bar area rectangle.
} else {
  // The Window Controls Overlay feature is not available.
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}
