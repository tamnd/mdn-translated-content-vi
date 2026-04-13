---
title: "BeforeInstallPromptEvent: thuộc tính userChoice"
short-title: userChoice
slug: Web/API/BeforeInstallPromptEvent/userChoice
page-type: web-api-instance-property
status:
  - experimental
  - non-standard
browser-compat: api.BeforeInstallPromptEvent.userChoice
---

{{APIRef}}{{SeeCompatTable}}{{Non-standard_header}}

Thuộc tính **`userChoice`** của giao diện {{domxref("BeforeInstallPromptEvent")}} biểu thị lựa chọn cài đặt mà người dùng đã đưa ra khi họ được nhắc cài đặt ứng dụng.

## Giá trị

Một {{jsxref("Promise")}} được resolve thành một đối tượng chứa hai thuộc tính:

- `outcome` {{experimental_inline}} {{non-standard_inline}}
  - : Một chuỗi cho biết người dùng có chọn cài đặt ứng dụng hay không. Giá trị này phải là một trong các giá trị sau:
    - `"accepted"`: Người dùng đã cài đặt ứng dụng.
    - `"dismissed"`: Người dùng đã không cài đặt ứng dụng.

- `platform` {{experimental_inline}} {{non-standard_inline}}
  - : Nếu người dùng chọn cài đặt ứng dụng, đây là một chuỗi đặt tên nền tảng đã chọn, là một trong các giá trị từ thuộc tính {{domxref("BeforeInstallPromptEvent.platforms")}}. Nếu người dùng chọn không cài đặt ứng dụng, đây là một chuỗi rỗng.

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Làm cho PWA có thể cài đặt](/en-US/docs/Web/Progressive_web_apps/Guides/Making_PWAs_installable)
- [How to provide your own in-app install experience](https://web.dev/articles/customize-install) trên web.dev (2021)
