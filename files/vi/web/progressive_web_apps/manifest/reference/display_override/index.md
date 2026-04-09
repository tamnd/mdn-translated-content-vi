---
title: display_override
slug: Web/Progressive_web_apps/Manifest/Reference/display_override
page-type: web-manifest-member
status:
  - experimental
browser-compat: manifests.webapp.display_override
sidebar: pwasidebar
---

{{SeeCompatTable}}

Member [`display`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/display) được dùng để xác định chế độ hiển thị ưu tiên của nhà phát triển cho một website. Nó đi theo một quy trình trong đó trình duyệt sẽ thử chế độ hiển thị tiếp theo nếu chế độ được yêu cầu không được hỗ trợ. Trong một số trường hợp dùng nâng cao, quy trình dự phòng này có thể vẫn chưa đủ.

Member `display_override` giải quyết vấn đề này bằng cách cho phép nhà phát triển cung cấp một chuỗi các chế độ hiển thị mà trình duyệt sẽ xem xét trước khi dùng member `display`. Giá trị của nó là một mảng các chế độ hiển thị được xét theo thứ tự, và chế độ được hỗ trợ đầu tiên sẽ được áp dụng.

## Giá trị

Các đối tượng display override là các chuỗi display-mode, các giá trị có thể là:

- `browser`
  - : Ứng dụng mở trong một tab trình duyệt hoặc cửa sổ mới thông thường, tùy theo trình duyệt và nền tảng.
    Đây là giá trị mặc định.

- `fullscreen`
  - : Toàn bộ vùng hiển thị sẵn có được dùng và không hiển thị {{Glossary("chrome")}} của tác nhân người dùng.

- `minimal-ui`
  - : Ứng dụng sẽ trông và hoạt động như một ứng dụng độc lập với một tập tối thiểu các phần tử giao diện để điều khiển điều hướng.
    Các phần tử sẽ thay đổi theo trình duyệt.

- `standalone`
  - : Ứng dụng sẽ trông và hoạt động như một ứng dụng độc lập.
    Điều này có thể bao gồm việc ứng dụng có một cửa sổ khác, biểu tượng riêng trong trình khởi chạy ứng dụng, v.v.
    Ở chế độ này, tác nhân người dùng sẽ loại bỏ các phần tử giao diện để điều khiển điều hướng, nhưng có thể vẫn bao gồm các phần tử khác như thanh trạng thái.

- `tabbed` {{experimental_inline}}
  - : Ứng dụng có thể chứa nhiều ngữ cảnh ứng dụng bên trong một cửa sổ ở cấp độ hệ điều hành.
    Các trình duyệt hỗ trợ có thể chọn cách hiển thị các ngữ cảnh này, nhưng cách phổ biến là cung cấp một thanh tab để chuyển giữa chúng.

- `window-controls-overlay` {{experimental_inline}}
  - : Chế độ hiển thị này chỉ áp dụng khi ứng dụng ở trong một cửa sổ PWA riêng biệt và trên hệ điều hành máy tính để bàn.
    Ứng dụng sẽ chọn tham gia vào tính năng Window Controls Overlay, trong đó toàn bộ bề mặt cửa sổ sẽ có sẵn cho nội dung web của ứng dụng và các nút điều khiển cửa sổ (phóng to, thu nhỏ, đóng, và các nút dành riêng cho PWA khác) sẽ xuất hiện như một lớp phủ phía trên nội dung web.

## Ví dụ

Trong ví dụ bên dưới, trình duyệt sẽ xem xét chuỗi dự phòng display-mode theo thứ tự sau: `fullscreen` → `minimal-ui` → `standalone`.

```json
{
  "display_override": ["fullscreen", "minimal-ui"],
  "display": "standalone"
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Preparing for the display modes of tomorrow](https://developer.chrome.com/docs/capabilities/display-override)
- [Customize the window controls overlay of your PWA's title bar](https://web.dev/articles/window-controls-overlay)
