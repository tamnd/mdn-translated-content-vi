---
title: "ScreenDetailed: thuộc tính label"
short-title: label
slug: Web/API/ScreenDetailed/label
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.ScreenDetailed.label
---

{{APIRef("Window Management API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`label`** của giao diện {{domxref("ScreenDetailed")}} là một chuỗi cung cấp nhãn mô tả cho màn hình, ví dụ "Built-in Retina Display".

Điều này hữu ích khi xây dựng danh sách tùy chọn để hiển thị cho người dùng nếu bạn muốn họ chọn màn hình để hiển thị nội dung.

## Giá trị

Một chuỗi.

## Ví dụ

```js
const screenDetails = await window.getScreenDetails();

// Return the label of the first screen
const screen1Label = screenDetails.screens[0].label;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Window Management API](/en-US/docs/Web/API/Window_Management_API)
