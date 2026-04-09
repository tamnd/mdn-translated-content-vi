---
title: launch_handler
slug: Web/Progressive_web_apps/Manifest/Reference/launch_handler
page-type: web-manifest-member
status:
  - experimental
browser-compat: manifests.webapp.launch_handler
sidebar: pwasidebar
---

{{SeeCompatTable}}

Member `launch_handler` xác định các giá trị điều khiển việc khởi chạy một ứng dụng web. Hiện tại nó chỉ có thể chứa một giá trị duy nhất, `client_mode`, giá trị này chỉ định ngữ cảnh mà ứng dụng nên được tải vào khi khởi chạy. Ví dụ, trong một web app client hiện có đang chứa một thể hiện của ứng dụng, hoặc trong một web app client mới. Điều này để ngỏ chỗ cho nhiều giá trị `launch_handler` hơn được định nghĩa trong tương lai.

## Giá trị

Đối tượng `launch_handler` có thể chứa các giá trị sau:

- `client_mode` {{experimental_inline}}
  - : Một chuỗi, hoặc một mảng chuỗi phân tách bằng dấu phẩy, chỉ định ngữ cảnh mà ứng dụng nên được tải vào khi khởi chạy. Nếu cung cấp một mảng chuỗi, giá trị hợp lệ đầu tiên sẽ được dùng.
    Các giá trị có thể là:</p>
    - `auto`
      - : Tác nhân người dùng quyết định ngữ cảnh nào phù hợp với nền tảng để tải ứng dụng vào. Ví dụ, `navigate-existing` có thể hợp lý hơn trên di động, nơi một thể hiện ứng dụng đơn là phổ biến, trong khi `navigate-new` có thể hợp lý hơn trong ngữ cảnh máy tính để bàn. Đây là giá trị mặc định nếu tất cả giá trị được cung cấp đều không hợp lệ.
    - `focus-existing`
      - : Nếu ứng dụng đã được tải trong một web app client, nó sẽ được đưa vào focus nhưng không được điều hướng tới URL đích khởi chạy. URL đích được cung cấp thông qua {{domxref("Window.launchQueue")}} để có thể triển khai xử lý điều hướng khởi chạy tùy chỉnh. Nếu ứng dụng chưa được tải trong web app client, hành vi `navigate-new` sẽ được dùng thay thế.
    - `navigate-existing`
      - : Nếu ứng dụng đã được tải trong một web app client, nó sẽ được đưa vào focus và được điều hướng tới URL đích khởi chạy đã chỉ định. URL đích được cung cấp thông qua {{domxref("Window.launchQueue")}} để có thể triển khai thêm xử lý điều hướng khởi chạy tùy chỉnh. Nếu ứng dụng chưa được tải trong web app client, hành vi `navigate-new` sẽ được dùng thay thế.
    - `navigate-new`
      - : Ứng dụng được tải bên trong một web app client mới. URL đích được cung cấp thông qua {{domxref("Window.launchQueue")}} để có thể triển khai thêm xử lý điều hướng khởi chạy tùy chỉnh.

## Ví dụ

```json
{
  "launch_handler": {
    "client_mode": "focus-existing"
  }
}
```

```json
{
  "launch_handler": {
    "client_mode": ["focus-existing", "auto"]
  }
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Launch Handler API: Control how your app is launched](https://developer.chrome.com/docs/web-platform/launch-handler/)
- {{domxref("Window.launchQueue")}}
- [Musicr 2.0](https://mdn.github.io/dom-examples/launch-handler/) ứng dụng demo
