---
title: "ScreenDetailed: thuộc tính isPrimary"
short-title: isPrimary
slug: Web/API/ScreenDetailed/isPrimary
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.ScreenDetailed.isPrimary
---

{{APIRef("Window Management API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`isPrimary`** của giao diện {{domxref("ScreenDetailed")}} là một giá trị boolean cho biết màn hình có được đặt làm màn hình chính của hệ điều hành (OS) hay không.

OS chạy trình duyệt sẽ có một màn hình chính và một hoặc nhiều màn hình phụ. Màn hình chính thường có thể được chỉ định bởi người dùng thông qua cài đặt OS và thường chứa các tính năng giao diện OS như thanh tác vụ/dock. Màn hình chính có thể thay đổi vì nhiều lý do, chẳng hạn như khi một màn hình bị rút ra.

## Giá trị

Một giá trị boolean: `true` nếu màn hình là chính, `false` nếu là phụ.

## Ví dụ

```js
const screenDetails = await window.getScreenDetails();

// Is the first screen primary?
const screen1Primary = screenDetails.screens[0].isPrimary;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Window Management API](/en-US/docs/Web/API/Window_Management_API)
