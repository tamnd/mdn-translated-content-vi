---
title: "ScreenDetails: currentScreen property"
short-title: currentScreen
slug: Web/API/ScreenDetails/currentScreen
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.ScreenDetails.currentScreen
---

{{APIRef("Window Management API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`currentScreen`** của giao diện {{domxref("ScreenDetails")}} chứa một đối tượng {{domxref("ScreenDetailed")}} đơn đại diện cho thông tin chi tiết về màn hình mà cửa sổ trình duyệt hiện tại đang hiển thị.

## Giá trị

Một đối tượng {{domxref("ScreenDetailed")}}.

## Ví dụ

```js
// Hàm tiện ích để mở cửa sổ mới
function openWindow(left, top, width, height, url) {
  const windowFeatures = `left=${left},top=${top},width=${width},height=${height}`;
  return window.open(url, "_blank", windowFeatures);
}

// Mở một cửa sổ mới lấp đầy vùng có sẵn của màn hình hiện tại.
const currentScreen = (await window.getScreenDetails()).currentScreen;
console.log(`Opening a window to fill screen ${currentScreen.label}`);
const windowRef = openWindow(
  currentScreen.availLeft,
  currentScreen.availTop,
  currentScreen.availWidth,
  currentScreen.availHeight,
  url,
);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Window Management API](/en-US/docs/Web/API/Window_Management_API)
