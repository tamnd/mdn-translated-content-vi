---
title: "BeforeInstallPromptEvent: phương thức prompt()"
short-title: prompt()
slug: Web/API/BeforeInstallPromptEvent/prompt
page-type: web-api-instance-method
status:
  - experimental
  - non-standard
browser-compat: api.BeforeInstallPromptEvent.prompt
---

{{APIRef}}{{SeeCompatTable}}{{Non-standard_header}}

Phương thức **`prompt()`** của giao diện {{domxref("BeforeInstallPromptEvent")}} cho phép nhà phát triển hiển thị lời nhắc cài đặt vào thời điểm họ tự chọn. Thông thường, phương thức này sẽ được gọi trong trình xử lý sự kiện cho giao diện cài đặt tùy chỉnh của ứng dụng.

Phương thức này phải được gọi trong trình xử lý sự kiện của một hành động do người dùng thực hiện (chẳng hạn như nhấp nút) và chỉ có thể được gọi một lần trên một thực thể `BeforeInstallPromptEvent` nhất định.

## Cú pháp

```js-nolint
prompt()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} được resolve thành một đối tượng chứa các thuộc tính sau:

- `outcome` {{experimental_inline}} {{non-standard_inline}}
  - : Một chuỗi cho biết người dùng có chọn cài đặt ứng dụng hay không. Giá trị này phải là một trong các giá trị sau:
    - `"accepted"`: Người dùng đã cài đặt ứng dụng.
    - `"dismissed"`: Người dùng đã không cài đặt ứng dụng.

- `platform` {{experimental_inline}} {{non-standard_inline}}
  - : Nếu người dùng chọn cài đặt ứng dụng, đây là một chuỗi đặt tên nền tảng đã chọn, là một trong các giá trị từ thuộc tính {{domxref("BeforeInstallPromptEvent.platforms")}}. Nếu người dùng chọn không cài đặt ứng dụng, đây là một chuỗi rỗng.

## Ví dụ

Xem [ví dụ cho giao diện `BeforeInstallPromptEvent`](/en-US/docs/Web/API/BeforeInstallPromptEvent#examples).

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Làm cho PWA có thể cài đặt](/en-US/docs/Web/Progressive_web_apps/Guides/Making_PWAs_installable)
- [How to provide your own in-app install experience](https://web.dev/articles/customize-install) trên web.dev (2021)
