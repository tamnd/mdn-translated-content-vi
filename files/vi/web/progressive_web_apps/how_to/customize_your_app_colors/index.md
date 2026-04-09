---
title: Tùy chỉnh màu chủ đề và màu nền của ứng dụng
short-title: Tùy chỉnh màu ứng dụng
slug: Web/Progressive_web_apps/How_to/Customize_your_app_colors
page-type: how-to
sidebar: pwasidebar
---

Khi xây dựng [Progressive Web Apps (PWAs)](/en-US/docs/Web/Progressive_web_apps), điều quan trọng là không chỉ cân nhắc giao diện nội dung của ứng dụng, mà còn cả cách ứng dụng xuất hiện trên thiết bị của người dùng sau khi được cài đặt.

Một cách để tùy chỉnh cửa sổ mà ứng dụng xuất hiện là dùng các thành phần [web app manifest](/en-US/docs/Web/Progressive_web_apps/Manifest) [`theme_color`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/theme_color) và [`background_color`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/background_color).

Bằng cách định nghĩa các thành phần `theme_color` và `background_color` trong manifest của PWA, bạn có thể tạo trải nghiệm trau chuốt hơn cho người dùng. Những chi tiết nhỏ này có thể giúp PWA của bạn giống một ứng dụng gốc của hệ điều hành hơn và quen thuộc hơn với người dùng.

## Tùy chỉnh màu nền của cửa sổ ứng dụng

Thành phần manifest [`background_color`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/background_color) định nghĩa màu xuất hiện trong cửa sổ ứng dụng trước khi stylesheet của ứng dụng được tải xong.

Vì màu này xuất hiện trước khi stylesheet được tải, hãy đặt giá trị của nó trùng với giá trị màu của thuộc tính CSS `background-color` trong stylesheet của ứng dụng. Điều này sẽ bảo đảm chuyển tiếp hình ảnh mượt mà giữa lúc khởi chạy ứng dụng web và lúc nội dung của nó được tải.

Giá trị có thể là bất kỳ {{cssxref("&lt;color&gt;")}} CSS hợp lệ nào. Trong ví dụ tệp web app manifest này, màu nền của ứng dụng được đặt thành màu có tên [named color](/en-US/docs/Web/CSS/Reference/Values/named-color) `peachpuff`.

```json
{
  "name": "My app",
  "start_url": "/",
  "icons": [
    {
      "src": "icon.webp",
      "sizes": "256x256",
      "type": "image/webp"
    }
  ],
  "display": "standalone",
  "background_color": "peachpuff"
}
```

Ứng dụng cũng tải một stylesheet áp dụng cùng màu đó cho nền của phần tử body:

```css
body {
  background-color: peachpuff;
}
```

Ảnh chụp màn hình sau cho thấy đoạn mã trên hoạt động. PWA dùng đoạn mã này được cài trên Windows, và ảnh chụp cho thấy cửa sổ ứng dụng trông như thế nào trước khi nội dung của ứng dụng được tải:

![Cửa sổ ứng dụng trên Windows hiển thị màu nền peachpuff](./background-color-windows.png)

## Định nghĩa màu chủ đề

Thành phần [`theme_color`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/theme_color) trong manifest của PWA định nghĩa màu mặc định của các thành phần giao diện người dùng của hệ điều hành và trình duyệt được dùng trong ứng dụng.

Các thiết bị, hệ điều hành, và trình duyệt khác nhau sẽ áp dụng thành phần `theme_color` theo những cách khác nhau. Ví dụ:

- Trên thiết bị di động, màu chủ đề được áp dụng cho thanh trạng thái.
- Trên hệ điều hành máy tính, màu chủ đề được dùng để tùy chỉnh thanh tiêu đề của [cửa sổ ứng dụng độc lập](/en-US/docs/Web/Progressive_web_apps/How_to/Create_a_standalone_app).

Hãy chọn một `theme_color` bổ sung cho thiết kế tổng thể và thương hiệu của PWA, đồng thời hoạt động tốt trên nhiều loại thiết bị và nền tảng để bảo đảm trải nghiệm người dùng nhất quán.

Cũng như `background_color`, bất kỳ giá trị {{cssxref("&lt;color&gt;")}} nào cũng hợp lệ. Trong ví dụ tệp web app manifest này, `theme_color` được đặt thành `rgb(255 218 185)`, là giá trị tương đương [RGB](/en-US/docs/Web/CSS/Reference/Values/color_value/rgb) của `peachpuff`:

```json
{
  "name": "My app",
  "start_url": "/",
  "icons": [
    {
      "src": "icon.webp",
      "sizes": "48x48",
      "type": "image/webp"
    }
  ],
  "display": "standalone",
  "background_color": "peachpuff",
  "theme_color": "rgb(255 218 185)"
}
```

Ảnh chụp màn hình sau cho thấy đoạn mã trên hoạt động khi ứng dụng được cài trên Windows, nơi thành phần manifest `theme_color` được dùng làm màu của thanh tiêu đề:

![Cửa sổ ứng dụng trên Windows hiển thị màu chủ đề ở thanh tiêu đề](./background-theme-colors-windows.png)

### Quan hệ với giá trị phần tử meta `theme-color`

Giá trị [`theme-color`](/en-US/docs/Web/HTML/Reference/Elements/meta/name/theme-color) cho thuộc tính [`name`](/en-US/docs/Web/HTML/Reference/Elements/meta/name) của phần tử HTML {{htmlelement("meta")}} có thể được dùng để định nghĩa màu chủ đề cho từng trang web. Điều này khác với thành phần manifest `theme_color`, vốn bạn chỉ định nghĩa một lần, ở phạm vi toàn cục, cho ứng dụng của mình.

Nếu cả hai đều được đặt, giá trị phần tử meta `theme-color` sẽ ghi đè lên thành phần manifest `theme_color`. Điều này cho phép bạn định nghĩa một màu toàn cục cho ứng dụng và ghi đè nó trên các trang cụ thể.

Lưu ý rằng trên một số trình duyệt, như Safari trên macOS và Chrome trên Android, giá trị phần tử meta `theme-color` cũng được dùng để tạo kiểu cho giao diện trình duyệt.

## Xem thêm

- [Web App Manifests](/en-US/docs/Web/Progressive_web_apps/Manifest).
- [Meta Theme Color and Trickery on css-tricks.com](https://css-tricks.com/meta-theme-color-and-trickery/) (2021)
- [Recommended fields on web.dev](https://web.dev/learn/pwa/web-app-manifest#recommended_fields)
