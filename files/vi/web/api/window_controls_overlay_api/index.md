---
title: Window Controls Overlay API
slug: Web/API/Window_Controls_Overlay_API
page-type: web-api-overview
status:
  - experimental
browser-compat: api.WindowControlsOverlay
spec-urls: https://wicg.github.io/window-controls-overlay/
---

{{DefaultAPISidebar("Window Controls Overlay API")}}{{SeeCompatTable}}

Window Controls Overlay API cung cấp cho các Progressive Web App được cài đặt trên hệ điều hành máy tính để bàn khả năng ẩn thanh tiêu đề cửa sổ mặc định và hiển thị nội dung của riêng họ trên toàn bộ diện tích bề mặt của cửa sổ ứng dụng, biến các nút điều khiển (phóng to, thu nhỏ và đóng) thành một lớp phủ.

## Chọn sử dụng tính năng

Trước khi sử dụng tính năng này, các điều kiện sau phải được đáp ứng:

- Thành viên [`display_override`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/display_override) trong Web App Manifest phải được đặt thành `window-controls-overlay`.
- Progressive Web App phải được cài đặt trên hệ điều hành máy tính để bàn.

## Các khái niệm chính

Các Progressive Web App được cài đặt trên thiết bị máy tính để bàn có thể được hiển thị trong các cửa sổ ứng dụng độc lập, giống như các ứng dụng gốc. Đây là giao diện của một cửa sổ ứng dụng:

![Hình minh họa PWA được cài đặt trên máy tính để bàn, với các nút điều khiển cửa sổ, thanh tiêu đề và nội dung web bên dưới](desktop-pwa-window.png)

Như thấy ở trên, cửa sổ ứng dụng bao gồm hai khu vực chính:

- Khu vực thanh tiêu đề ở trên cùng.
- Khu vực nội dung ứng dụng ở phía dưới, hiển thị nội dung HTML từ PWA.

Khu vực thanh tiêu đề chứa các nút phóng to, thu nhỏ và đóng quan trọng của hệ thống (vị trí của chúng có thể khác nhau tùy theo hệ điều hành), tên ứng dụng (lấy từ phần tử HTML `<title>` trong trang), và có thể là các nút PWA dành riêng cho user agent.

Với tính năng Window Controls Overlay, các Progressive Web App có thể hiển thị nội dung web của họ trên toàn bộ diện tích bề mặt cửa sổ ứng dụng. Vì các nút điều khiển cửa sổ và các nút PWA dành riêng cho user agent phải luôn hiển thị, chúng được chuyển thành một lớp phủ hiển thị trên nội dung web.

![Hình minh họa PWA được cài đặt trên máy tính để bàn với tính năng Window Controls Overlay, với các nút điều khiển cửa sổ, không có thanh tiêu đề, và nội dung web trải rộng toàn bộ cửa sổ](desktop-pwa-window-wco.png)

Phần của thanh tiêu đề thường chứa tên ứng dụng bị ẩn, và khu vực mà nó thường chiếm sẽ có thể truy cập được thông qua Window Controls Overlay API.

Các PWA có thể sử dụng API để định vị nội dung trong khu vực này và tránh nội dung bị ẩn sau lớp phủ của các nút điều khiển, tương tự như cách các tác giả web có thể tính đến sự hiện diện của các notch trên một số thiết bị di động nhất định.

## Biến môi trường CSS

Các Progressive Web App có thể định vị nội dung web của họ trong khu vực mà thanh tiêu đề thường chiếm bằng cách sử dụng các biến môi trường CSS `titlebar-area-x`, `titlebar-area-y`, `titlebar-area-width` và `titlebar-area-height`.
Xem [Sử dụng env() để đảm bảo nội dung không bị che khuất bởi các nút điều khiển cửa sổ trong PWA máy tính để bàn](/en-US/docs/Web/CSS/Reference/Values/env#using_env_to_ensure_content_is_not_obscured_by_window_control_buttons_in_desktop_pwas).

## Các giao diện

- {{domxref("WindowControlsOverlay")}} {{Experimental_Inline}}
  - : Cung cấp thông tin về tính khả dụng và hình học của thanh tiêu đề, cùng một sự kiện để biết khi nào nó thay đổi.
- {{domxref("WindowControlsOverlayGeometryChangeEvent")}} {{Experimental_Inline}}
  - : Đại diện cho các sự kiện cung cấp thông tin liên quan đến vùng thanh tiêu đề của Progressive Web App máy tính để bàn khi kích thước hoặc tính khả dụng của nó thay đổi.

### Mở rộng cho các giao diện khác

- {{domxref("Navigator.windowControlsOverlay")}}
  - : Trả về giao diện {{domxref("WindowControlsOverlay")}}, hiển thị thông tin về hình học thanh tiêu đề trong các Progressive Web App máy tính để bàn.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Tùy chỉnh lớp phủ điều khiển cửa sổ của thanh tiêu đề PWA](https://web.dev/articles/window-controls-overlay)
- [Breaking Out of the Box](https://alistapart.com/article/breaking-out-of-the-box/)
- [Hiển thị nội dung trong thanh tiêu đề](https://learn.microsoft.com/en-us/microsoft-edge/progressive-web-apps/how-to/window-controls-overlay)
