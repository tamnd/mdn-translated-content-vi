---
title: background_color
slug: Web/Progressive_web_apps/Manifest/Reference/background_color
page-type: web-manifest-member
browser-compat: manifests.webapp.background_color
sidebar: pwasidebar
---

Thành viên manifest `background_color` được dùng để chỉ định màu nền ban đầu cho ứng dụng web của bạn.
Màu này xuất hiện trong cửa sổ ứng dụng trước khi stylesheet của ứng dụng được tải xong.

## Cú pháp

```json-nolint
/* Dùng tên màu */
"background_color": "aliceblue"

/* Dùng giá trị thập lục phân */
"background_color": "#f0fbff"

/* Dùng giá trị RGB */
"background_color": "rgb(240 248 255)"
```

### Giá trị

- `background_color`
  - : Một chuỗi chỉ định một [giá trị màu](/en-US/docs/Web/CSS/Reference/Values/color_value) hợp lệ.

## Mô tả

Member `background_color` phục vụ các mục đích sau:

- Cung cấp một chuyển tiếp trực quan mượt mà từ lúc ứng dụng khởi chạy ban đầu đến trạng thái đã tải xong.
- Cải thiện trải nghiệm người dùng trong khi các tệp ứng dụng đang được tải qua mạng hoặc được truy cập từ phương tiện lưu trữ.
- Góp phần tạo nên diện mạo của màn hình chào trong một số trình duyệt và hệ điều hành khi một progressive web app (PWA) đã cài đặt được khởi chạy.

Bạn nên đặt giá trị màu cho member `background_color` khớp với giá trị thuộc tính {{cssxref("background-color")}} trong stylesheet của ứng dụng.
Điều này sẽ bảo đảm tính nhất quán trực quan giữa hiển thị ban đầu (bao gồm cả màn hình chào, nếu có) và ứng dụng đã tải xong.
Bằng cách làm cho các màu này trùng khớp, bạn có thể tạo trải nghiệm trau chuốt và liền mạch hơn cho người dùng.

Sau khi ứng dụng đã tải xong, `background-color` trong stylesheet sẽ được ưu tiên.
`background_color` của manifest chỉ được dùng như biện pháp tạm thời trong giai đoạn tải ban đầu và để tạo màn hình chào trong một số môi trường.

> [!NOTE]
> Trình duyệt có thể ghi đè giá trị `background_color` của manifest để hỗ trợ bất kỳ truy vấn media {{cssxref("@media/prefers-color-scheme")}} nào được định nghĩa trong CSS của ứng dụng.

## Ví dụ

### Đặt màu nền nhất quán cho ứng dụng của bạn

Hãy tưởng tượng bạn đang xây dựng một ứng dụng thời tiết, và màu nền trong stylesheet của ứng dụng được đặt như sau:

```css
body {
  background-color: skyblue;
}
```

Để bảo đảm người dùng thấy một màu nền nhất quán từ lúc khởi chạy đến khi ứng dụng tải xong, bạn sẽ đặt cùng màu nền đó trong tệp manifest của ứng dụng như sau:

```json
{
  "name": "WeatherPro",
  "display": "standalone",
  "background_color": "skyblue",
  "theme_color": "#4682b4",
  "icons": [
    {
      "src": "icon-192x192.png",
      "sizes": "192x192",
      "type": "image/png"
    }
  ]
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`display`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/display) manifest member
- [`theme_color`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/theme_color) manifest member
- [Customize your app's theme and background colors](/en-US/docs/Web/Progressive_web_apps/How_to/Customize_your_app_colors) khi xây dựng PWA
