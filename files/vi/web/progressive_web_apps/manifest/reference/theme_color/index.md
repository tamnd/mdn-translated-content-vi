---
title: theme_color
slug: Web/Progressive_web_apps/Manifest/Reference/theme_color
page-type: web-manifest-member
browser-compat: manifests.webapp.theme_color
sidebar: pwasidebar
---

Member `theme_color` được dùng để chỉ định màu mặc định cho giao diện người dùng của ứng dụng web của bạn.
Màu này có thể được áp dụng cho nhiều phần tử giao diện trình duyệt, như thanh công cụ, thanh địa chỉ, và thanh trạng thái.
Nó có thể đặc biệt dễ nhận thấy trong các ngữ cảnh như trình chuyển tác vụ hoặc khi ứng dụng được thêm vào màn hình chính.

## Cú pháp

```json-nolint
/* Màu tên hợp lệ */
"theme_color": "rebeccapurple"

/* Dùng giá trị thập lục phân */
"theme_color": "#42b5f4"

/* Dùng giá trị RGB */
"theme_color": "rgb(66 133 244)"
```

### Giá trị

- `theme_color`
  - : Một chuỗi chỉ định một [giá trị màu](/en-US/docs/Web/CSS/Reference/Values/color_value) hợp lệ.

    > [!NOTE]
    > Trình duyệt có thể bỏ qua thành phần alpha của màu tùy theo ngữ cảnh.
    > Trong hầu hết môi trường, `theme_color` không thể trong suốt.
    > Nên dùng màu hoàn toàn không trong suốt (giá trị alpha là 1 hoặc 100%) để bảo đảm hành vi nhất quán trên các nền tảng và trình duyệt khác nhau.

## Mô tả

Mặc dù là tùy chọn, việc chỉ định `theme_color` cho phép bạn mở rộng nhận diện trực quan của ứng dụng vượt ra ngoài khu vực nội dung.
Việc áp dụng màu này có thể mang lại trải nghiệm giống ứng dụng gốc hơn cho ứng dụng web của bạn, đặc biệt khi nó được tải ở chế độ [standalone](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/display#standalone).
Hãy chọn một `theme_color` phù hợp với hướng dẫn thương hiệu của ứng dụng, vì điều này có thể tăng khả năng người dùng nhận ra và ghi nhớ, đặc biệt khi ứng dụng của bạn được xem cùng với các ứng dụng hoặc giao diện hệ thống khác.

Trong các trình duyệt hỗ trợ `theme_color`, giá trị được chỉ định trong tệp manifest sẽ là màu giao diện mặc định của ứng dụng web trên mọi trang nơi manifest được áp dụng.
Bạn có thể ghi đè mặc định này theo những cách sau:

- Dùng giá trị [`theme-color`](/en-US/docs/Web/HTML/Reference/Elements/meta/name/theme-color) của thuộc tính `name` trong phần tử HTML `<meta>`: Bạn có thể chỉ định màu giao diện cho một trang web khác với `theme_color` của manifest dành cho ứng dụng. Điều này cho phép bạn đặt màu giao diện khác nhau cho từng trang trong ứng dụng.

  ```html
  <meta name="theme-color" content="#9370DB" />
  ```

- Kết hợp phần tử `<meta name="theme-color">` với media query: Bạn có thể chỉ định màu giao diện sẽ dùng dựa trên sở thích scheme màu của người dùng.

  ```html
  <meta
    name="theme-color"
    content="#F4E6D8"
    media="(prefers-color-scheme: light)" />
  <meta
    name="theme-color"
    content="#5D4037"
    media="(prefers-color-scheme: dark)" />
  ```

Các cách ghi đè này mang lại cho bạn sự linh hoạt để điều chỉnh diện mạo ứng dụng cho các trang cụ thể hoặc sở thích người dùng, cải thiện trải nghiệm tổng thể.

Trình duyệt cũng có thể điều chỉnh màu giao diện được áp dụng dựa trên sở thích người dùng.
Nếu người dùng đã đặt chế độ sáng hoặc tối, trình duyệt có thể ghi đè giá trị `theme_color` của manifest để hỗ trợ bất kỳ media query {{cssxref("@media/prefers-color-scheme")}} nào được định nghĩa trong CSS của ứng dụng.

```css
body {
  background: #f8f9fa;
  color: #212529;
}

@media (prefers-color-scheme: dark) {
  body {
    background: #212529;
    color: #f8f9fa;
  }
}
```

## Ví dụ

### Dùng màu tên

```json
{
  "theme_color": "red"
}
```

### Dùng giá trị RGB

```json
{
  "theme_color": "rgb(66 133 244)"
}
```

### Dùng giá trị thập lục phân

```json
{
  "name": "My First App",
  "display": "standalone",
  "background_color": "white",
  "theme_color": "#ff4500"
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`display`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/display) manifest member
- [`background_color`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/background_color) manifest member
- [`scope`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/scope) manifest member
- [Customize your app's theme and background colors](/en-US/docs/Web/Progressive_web_apps/How_to/Customize_your_app_colors) khi xây dựng PWA
