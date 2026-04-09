---
title: "console: phương thức tĩnh profile()"
short-title: profile()
slug: Web/API/console/profile_static
page-type: web-api-static-method
status:
  - non-standard
browser-compat: api.console.profile_static
---

{{APIRef("Console API")}}{{Non-standard_header}} {{AvailableInWorkers}}

Phương thức tĩnh **`console.profile()`** bắt đầu ghi một hồ sơ hiệu năng (ví dụ: [công cụ hiệu năng của Firefox](https://firefox-source-docs.mozilla.org/devtools-user/performance/index.html)).

Bạn có thể tùy chọn cung cấp một đối số để đặt tên cho hồ sơ, nhờ đó có thể dừng riêng hồ sơ đó nếu đang có nhiều hồ sơ được ghi. Xem {{domxref("console/profileEnd_static", "console.profileEnd()")}} để biết đối số này được diễn giải như thế nào.

Để dừng việc ghi, hãy gọi {{domxref("console/profileEnd_static", "console.profileEnd()")}}.

## Cú pháp

```js-nolint
console.profile(profileName)
```

### Tham số

- `profileName` {{Optional_Inline}}
  - : Tên dùng cho hồ sơ.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("console/profileEnd_static", "console.profileEnd()")}}
