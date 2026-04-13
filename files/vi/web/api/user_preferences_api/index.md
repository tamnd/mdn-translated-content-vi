---
title: API Tùy chọn người dùng
slug: Web/API/User_Preferences_API
page-type: web-api-overview
status:
  - experimental
browser-compat:
  - api.Navigator.preferences
  - api.PreferenceManager
  - api.PreferenceObject
spec-urls: https://drafts.csswg.org/mediaqueries-5/#preferences-attribute
---

{{DefaultAPISidebar("User Preferences API")}}{{SeeCompatTable}}

**API Tùy chọn người dùng** cho phép các tác giả trang web ghi đè theo chương trình các cài đặt [truy vấn phương tiện](/en-US/docs/Web/CSS/Guides/Media_queries/Using) liên quan đến tùy chọn người dùng.

## Khái niệm và cách sử dụng

Các tác nhân người dùng hỗ trợ định nghĩa các giá trị cho truy vấn phương tiện CSS {{cssxref("@media/prefers-color-scheme", "prefers-color-scheme")}}, {{cssxref("@media/prefers-contrast", "prefers-contrast")}}, {{cssxref("@media/prefers-reduced-motion", "prefers-reduced-motion")}}, {{cssxref("@media/prefers-reduced-transparency", "prefers-reduced-transparency")}} và {{cssxref("@media/prefers-reduced-data", "prefers-reduced-data")}}. Đối tượng {{domxref("PreferenceManager")}} cung cấp quyền truy cập lập trình vào các tùy chọn này, cho phép tác giả trang lắng nghe các thay đổi tùy chọn và ghi đè chúng.

## Ví dụ

### Nút bật/tắt chế độ tối

Đoạn mã sau triển khai một nút bật/tắt chế độ tối tối giản.

#### HTML

HTML bao gồm một biểu mẫu chứa ba nút radio. Các nút radio này đặt trường `color-scheme` thành `system`, `light` hoặc `dark`.

```html live-sample___dark-mode-toggle
<!doctype html>
<html lang="en-US">
  <head>
    <meta name="color-scheme" content="light dark" />
  </head>
  <body>
    <form>
      <label>
        <input type="radio" name="color-scheme" value="light" />
        Light
      </label>
      <label>
        <input type="radio" name="color-scheme" value="dark" />
        Dark
      </label>
    </form>
  </body>
</html>
```

#### JavaScript

JavaScript đăng ký trình lắng nghe sự kiện thay đổi cho tất cả các phần tử có tên `color-scheme`. Nếu giá trị là `system`, trình xử lý sẽ xóa ghi đè bảng màu. Nếu không, nó sẽ yêu cầu ghi đè bảng màu với giá trị của phần tử đầu vào.

```js live-sample___dark-mode-toggle
if (navigator.preferences) {
  const inputs = {
    light: document.querySelector('[name="color-scheme"][value="light"]'),
    dark: document.querySelector('[name="color-scheme"][value="dark"]'),
  };

  inputs[navigator.preferences.colorScheme.value].checked = true;

  inputs.light.addEventListener("change", () => {
    navigator.preferences.colorScheme.requestOverride("light");
  });
  inputs.dark.addEventListener("change", () => {
    navigator.preferences.colorScheme.requestOverride("dark");
  });

  navigator.preferences.colorScheme.addEventListener("change", () => {
    inputs[navigator.preferences.colorScheme.value].checked = true;
  });
} else {
  document.body.append(
    "Your browser doesn't support the navigator.preferences API",
  );
}
```

#### Kết quả

```css hidden live-sample___dark-mode-toggle
body {
  font-family: system-ui, sans-serif;
}

label {
  display: block;
  margin: 0.5em 0;
}
```

{{EmbedLiveSample("dark-mode-toggle", "100%", 200)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
