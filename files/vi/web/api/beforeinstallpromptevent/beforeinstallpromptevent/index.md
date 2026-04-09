---
title: "BeforeInstallPromptEvent: hàm tạo BeforeInstallPromptEvent()"
short-title: BeforeInstallPromptEvent()
slug: Web/API/BeforeInstallPromptEvent/BeforeInstallPromptEvent
page-type: web-api-constructor
status:
  - experimental
  - non-standard
browser-compat: api.BeforeInstallPromptEvent.BeforeInstallPromptEvent
---

{{APIRef}}{{SeeCompatTable}}{{Non-standard_header}}

Hàm tạo **`BeforeInstallPromptEvent()`** tạo một đối tượng {{domxref("BeforeInstallPromptEvent")}} mới.

## Cú pháp

```js-nolint
new BeforeInstallPromptEvent(type)
new BeforeInstallPromptEvent(type, eventInitDict)
```

### Tham số

- `type`
  - : Một chuỗi chứa tên của sự kiện, được đặt thành `beforeinstallprompt`.
- `eventInitDict` {{optional_inline}}
  - : Một đối tượng với một thuộc tính tùy chọn duy nhất là `platforms`, đây là một mảng chuỗi liệt kê các nền tảng mà sự kiện sẽ được gửi tới.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Làm cho PWA có thể cài đặt](/en-US/docs/Web/Progressive_web_apps/Guides/Making_PWAs_installable)
- [How to provide your own in-app install experience](https://web.dev/articles/customize-install) trên web.dev (2021)
