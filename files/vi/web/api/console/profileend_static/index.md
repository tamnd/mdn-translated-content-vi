---
title: "console: phương thức tĩnh profileEnd()"
short-title: profileEnd()
slug: Web/API/console/profileEnd_static
page-type: web-api-static-method
status:
  - non-standard
browser-compat: api.console.profileEnd_static
---

{{APIRef("Console API")}}{{Non-standard_header}} {{AvailableInWorkers}}

Phương thức tĩnh **`console.profileEnd()`** dừng việc ghi một hồ sơ đã được bắt đầu trước đó bằng {{domxref("console/profile_static", "console.profile()")}}.

Bạn có thể tùy chọn cung cấp một đối số để đặt tên cho hồ sơ. Làm như vậy cho phép bạn chỉ dừng đúng hồ sơ đó nếu đang có nhiều hồ sơ được ghi.

- Nếu `console.profileEnd()` được truyền một tên hồ sơ và tên đó khớp với tên của một hồ sơ đang được ghi, hồ sơ đó sẽ bị dừng.
- Nếu `console.profileEnd()` được truyền một tên hồ sơ nhưng tên đó không khớp với tên của hồ sơ nào đang được ghi, sẽ không có thay đổi nào xảy ra.
- Nếu `console.profileEnd()` không được truyền tên hồ sơ, hồ sơ được bắt đầu gần nhất sẽ bị dừng.

## Cú pháp

```js-nolint
console.profileEnd(profileName)
```

### Tham số

- `profileName` {{Optional_Inline}}
  - : Tên dùng cho hồ sơ.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("console/profile_static", "console.profile()")}}
