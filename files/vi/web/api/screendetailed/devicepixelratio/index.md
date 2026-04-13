---
title: "ScreenDetailed: thuộc tính devicePixelRatio"
short-title: devicePixelRatio
slug: Web/API/ScreenDetailed/devicePixelRatio
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.ScreenDetailed.devicePixelRatio
---

{{APIRef("Window Management API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`devicePixelRatio`** của giao diện {{domxref("ScreenDetailed")}} là một số đại diện cho tỷ lệ {{glossary("device pixel")}} của màn hình.

Giá trị này giống với giá trị trả về bởi {{domxref("Window.devicePixelRatio")}}, ngoại trừ `Window.devicePixelRatio`:

- luôn trả về tỷ lệ pixel thiết bị của {{domxref("ScreenDetails.currentScreen", "màn hình hiện tại", "", "nocode")}}.
- cũng bao gồm hệ số thu phóng của cửa sổ, tức là thu phóng trang (ít nhất trong một số triển khai trình duyệt).

## Giá trị

Một số.

## Ví dụ

```js
const screenDetails = await window.getScreenDetails();

// Return the device pixel ratio of the first screen
const screen1DPR = screenDetails.screens[0].devicePixelRatio;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Window Management API](/en-US/docs/Web/API/Window_Management_API)
