---
title: Tạo ứng dụng độc lập
slug: Web/Progressive_web_apps/How_to/Create_a_standalone_app
page-type: how-to
sidebar: pwasidebar
---

[Progressive Web Apps](/en-US/docs/Web/Progressive_web_apps) (PWA) được cài trên thiết bị của người dùng có thể định nghĩa cách chúng xuất hiện khi người dùng khởi chạy. Chúng có thể chọn hiển thị trong trình duyệt web, giống như các trang web, hoặc có cửa sổ riêng giống như cách các ứng dụng gốc của hệ điều hành hoạt động.

Người dùng thường có những kỳ vọng cụ thể về cách các ứng dụng đã cài hoạt động trên thiết bị của họ. Một trong những kỳ vọng đó là ứng dụng có cửa sổ riêng của mình.

Bằng cách dùng thành phần [`display`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/display) của [web app manifest](/en-US/docs/Web/Progressive_web_apps/Manifest), bạn có thể định nghĩa liệu PWA đã cài sẽ được hiển thị trong trình duyệt hay có cửa sổ riêng khi PWA được khởi chạy từ thiết bị của người dùng.

## Dùng chế độ hiển thị standalone

Để dùng chế độ hiển thị standalone và cho PWA của bạn có cửa sổ riêng, hãy thêm thành phần [`display`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/display) vào [web app manifest](/en-US/docs/Web/Progressive_web_apps/Manifest) và đặt giá trị của nó thành `standalone`:

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
  "display": "standalone"
}
```

Lưu ý rằng còn có các chế độ hiển thị khác, chẳng hạn `browser`, `minimal-ui`, và `fullscreen`. Chế độ hiển thị bạn chọn sẽ thay đổi mức độ giao diện người dùng của trình duyệt được hiển thị cho người dùng, từ hiển thị toàn bộ cho đến có cửa sổ riêng. Để tìm hiểu thêm về tất cả các chế độ hiển thị có sẵn và cách chúng dự phòng khi không được hỗ trợ, xem tài liệu về thành phần [`display`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/display).

## Thực hành tốt nhất

### Xử lý điều hướng nhiều trang

Nếu ứng dụng của bạn được xây dựng bằng nhiều trang HTML có thể điều hướng, hãy nhớ đưa vào các phần tử giao diện để điều khiển việc điều hướng trong ứng dụng.

Nếu bạn không có các phần tử điều hướng riêng, hãy dùng chế độ hiển thị `minimal-ui` để bảo đảm người dùng vẫn có thể đi giữa các trang bằng các nút trước và sau được trình duyệt hiển thị trên thanh tiêu đề của ứng dụng.

## Tùy chỉnh ứng dụng theo chế độ hiển thị

Khi bạn định nghĩa một chế độ hiển thị khác `browser` trong web app manifest, nó chỉ áp dụng khi ứng dụng được cài đặt. Giống như bất kỳ trang web nào khác, thành phần `display` trong manifest không có tác dụng khi PWA chưa được cài đặt. Bạn có thể kiểm tra chế độ hiển thị trong lúc chạy để phát hiện ứng dụng đã được cài hay chưa.

Bằng cách dùng đặc tính media CSS {{cssxref("@media/display-mode", "display-mode")}} hoặc tính năng JavaScript {{domxref("Window.matchMedia()")}}, bạn có thể chọn lọc áp dụng kiểu CSS hoặc chạy mã JavaScript trong ứng dụng dựa trên chế độ hiển thị của nó.

Sau đây là ví dụ cho thấy cách dùng at-rule CSS {{cssxref("@media")}} để chỉ hiển thị một phần tử trên trang web khi chế độ hiển thị `standalone` được bật:

```css
.app-button {
  display: none;
}

@media (display-mode: standalone) {
  .app-button {
    display: block;
  }
}
```

Trong ví dụ này, phần tử `.app-button` sẽ bị ẩn theo mặc định trừ khi chế độ hiển thị được đặt thành `standalone`, điều này xảy ra nếu thành phần manifest `display` được đặt thành `standalone` và ứng dụng đã được cài trên thiết bị của người dùng.

Sau đây là một ví dụ khác cho thấy cách dùng phương thức {{domxref("window.matchMedia()")}} để phát hiện xem chế độ hiển thị `standalone` có được bật hay không:

```js
function isStandaloneApp() {
  return window.matchMedia("(display-mode: standalone)").matches;
}
```

## Xem thêm

- [Web App Manifests](/en-US/docs/Web/Progressive_web_apps/Manifest).
- [Display modes](https://web.dev/learn/pwa/app-design/#display_modes).
- Tùy chỉnh thanh tiêu đề của ứng dụng trên hệ điều hành máy tính bằng cách dùng [Window Controls Overlay API](/en-US/docs/Web/API/Window_Controls_Overlay_API).
