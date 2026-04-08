---
title: display-mode
slug: Web/CSS/Reference/At-rules/@media/display-mode
page-type: css-media-feature
browser-compat: css.at-rules.media.display-mode
sidebar: cssref
---

Tính năng media **`display-mode`** trong [CSS](/en-US/docs/Web/CSS) có thể được dùng để kiểm tra xem một ứng dụng web đang được hiển thị trong tab trình duyệt thông thường hay theo cách khác, chẳng hạn như ứng dụng độc lập hay chế độ toàn màn hình.

Ví dụ:

- Một [progressive web app](/en-US/docs/Web/Progressive_web_apps) [có thể đặt chế độ hiển thị](/en-US/docs/Web/Progressive_web_apps/How_to/Create_a_standalone_app) bằng cách thiết lập thành viên [`display`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/display) trong manifest của nó. Trong trường hợp này, giá trị của `display-mode` xác định giá trị đã được đặt (nhưng lưu ý rằng giá trị này có thể không giống với giá trị được yêu cầu trong manifest, vì trình duyệt có thể không hỗ trợ chế độ được yêu cầu).

- Bất kỳ ứng dụng web nào cũng có thể sử dụng [Fullscreen API](/en-US/docs/Web/API/Fullscreen_API) hoặc [Document Picture-in-Picture API](/en-US/docs/Web/API/Document_Picture-in-Picture_API) để đặt chế độ hiển thị, và trong trường hợp này giá trị của `display-mode` xác định chế độ đã được đặt.

Giá trị `display-mode` áp dụng cho ngữ cảnh duyệt web cấp cao nhất và mọi ngữ cảnh duyệt web con.

## Cú pháp

Tính năng `display-mode` được chỉ định dưới dạng một giá trị từ khóa được chọn trong danh sách bên dưới.

- `browser`
  - : Ứng dụng mở trong tab trình duyệt thông thường hoặc cửa sổ mới, tùy thuộc vào trình duyệt và nền tảng.
- `fullscreen`
  - : Tất cả diện tích hiển thị có sẵn được sử dụng và không có {{glossary("chrome")}} của tác nhân người dùng nào được hiển thị. Có thể dùng để áp dụng CSS chỉ khi ứng dụng đã được đặt ở chế độ toàn màn hình bằng [Fullscreen API](/en-US/docs/Web/API/Fullscreen_API) hoặc bằng cách sử dụng giá trị `fullscreen` của thành viên [`display`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/display) trong Web App Manifest.
- `minimal-ui`
  - : Ứng dụng trông và hoạt động như một ứng dụng độc lập, nhưng sẽ có tập hợp tối thiểu các phần tử giao diện để điều khiển điều hướng. Các phần tử này sẽ khác nhau tùy theo trình duyệt.
- `picture-in-picture`
  - : Chế độ này cho phép người dùng tiếp tục xem nội dung cụ thể trong khi tương tác với các trang web hoặc ứng dụng khác trên thiết bị của họ. Ứng dụng được hiển thị trong cửa sổ nổi luôn ở trên cùng. Có thể dùng để áp dụng CSS chỉ khi ứng dụng đã được đặt ở chế độ Picture-in-Picture bằng [Document Picture-in-Picture API](/en-US/docs/Web/API/Document_Picture-in-Picture_API).
- `standalone`
  - : Ứng dụng trông và hoạt động như một ứng dụng độc lập. Điều này có thể bao gồm việc ứng dụng có cửa sổ khác, biểu tượng riêng trong trình khởi chạy ứng dụng, v.v. Trong chế độ này, tác nhân người dùng sẽ loại trừ các phần tử giao diện để điều khiển điều hướng, nhưng có thể bao gồm các phần tử giao diện khác như thanh trạng thái.
- `window-controls-overlay`
  - : Trong chế độ này, ứng dụng trông và hoạt động như một ứng dụng máy tính để bàn độc lập, và tính năng [Window Controls Overlay](/en-US/docs/Web/API/Window_Controls_Overlay_API) được bật.

## Ví dụ

### Áp dụng CSS khi ứng dụng ở chế độ toàn màn hình

```css
@media (display-mode: fullscreen) {
  body {
    margin: 0;
    border: 5px solid black;
  }
}
```

### Cung cấp bảng màu sáng và tối cho nội dung Picture-in-Picture

Trong ví dụ này, chúng ta kết hợp giá trị `display-mode: picture-in-picture` với tính năng media {{cssxref("@media/prefers-color-scheme", "prefers-color-scheme")}} để tạo bảng màu sáng và tối được áp dụng dựa trên tùy chọn bảng màu của người dùng, chỉ khi ứng dụng đang được hiển thị ở chế độ Picture-in-Picture.

```css
@media (display-mode: picture-in-picture) and (prefers-color-scheme: light) {
  body {
    background: antiquewhite;
  }
}

@media (display-mode: picture-in-picture) and (prefers-color-scheme: dark) {
  body {
    background: #333333;
  }

  a {
    color: antiquewhite;
  }
}
```

Xem [Sử dụng Document Picture-in-Picture API](/en-US/docs/Web/API/Document_Picture-in-Picture_API/Using) để biết thêm thông tin và ví dụ đầy đủ.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Media Queries](/en-US/docs/Web/CSS/Guides/Media_queries/Using)
- [@media](/en-US/docs/Web/CSS/Reference/At-rules/@media)
