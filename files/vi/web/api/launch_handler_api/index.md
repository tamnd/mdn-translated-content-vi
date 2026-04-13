---
title: Launch Handler API
slug: Web/API/Launch_Handler_API
page-type: web-api-overview
status:
  - experimental
browser-compat: api.Window.launchQueue
---

{{SeeCompatTable}}{{DefaultAPISidebar("Launch Handler API")}}

**Launch Handler API** cho phép các nhà phát triển kiểm soát cách một [progressive web app](/en-US/docs/Web/Progressive_web_apps) (PWA) được khởi chạy, ví dụ liệu nó có sử dụng cửa sổ hiện có hay tạo cửa sổ mới, và cách URL khởi chạy mục tiêu của ứng dụng được xử lý.

## Khái niệm và cách sử dụng

Bạn có thể chỉ định hành vi khởi chạy cho ứng dụng của mình bằng cách thêm trường [`launch_handler`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/launch_handler) vào tệp web app manifest. Trường này có một trường con, `client_mode`, chứa giá trị chuỗi chỉ định cách ứng dụng nên được khởi chạy và điều hướng đến. Ví dụ:

```json
{
  "launch_handler": {
    "client_mode": "focus-existing"
  }
}
```

Nếu không được chỉ định, giá trị `client_mode` mặc định là `auto`. Các giá trị có sẵn là:

- `focus-existing`
  - : Ngữ cảnh duyệt được tương tác gần đây nhất trong cửa sổ ứng dụng web được chọn để xử lý lần khởi chạy. Điều này sẽ điền URL khởi chạy mục tiêu vào thuộc tính {{domxref("LaunchParams.targetURL", "targetURL")}} của đối tượng {{domxref("LaunchParams")}} được truyền vào hàm callback của {{domxref("LaunchQueue.setConsumer", "window.launchQueue.setConsumer()")}}.
- `navigate-existing`
  - : Ngữ cảnh duyệt được tương tác gần đây nhất trong cửa sổ ứng dụng web được điều hướng đến URL khởi chạy mục tiêu.
- `navigate-new`
  - : Ngữ cảnh duyệt mới được tạo trong cửa sổ ứng dụng web để tải URL khởi chạy mục tiêu.
- `auto`
  - : User agent quyết định điều gì phù hợp nhất với nền tảng. Đây là giá trị mặc định được sử dụng nếu các giá trị được cung cấp không hợp lệ.

Khi `focus-existing` được sử dụng, bạn có thể bao gồm mã bên trong hàm callback của {{domxref("LaunchQueue.setConsumer", "window.launchQueue.setConsumer()")}} để cung cấp xử lý tùy chỉnh của {{domxref("LaunchParams.targetURL", "targetURL")}}:

```js
window.launchQueue.setConsumer((launchParams) => {
  // Do something with launchParams.targetURL
});
```

## Các giao diện

- {{domxref("LaunchParams")}}
  - : Được sử dụng khi triển khai xử lý điều hướng khởi chạy tùy chỉnh trong PWA.
- {{domxref("LaunchQueue")}}
  - : Khi PWA được khởi chạy với giá trị `client_mode` là `focus-existing`, `navigate-new` hoặc `navigate-existing`, `LaunchQueue` cung cấp quyền truy cập vào chức năng cho phép triển khai xử lý điều hướng khởi chạy tùy chỉnh trong PWA.

### Mở rộng cho các giao diện khác

- {{domxref("window.launchQueue")}}
  - : Cung cấp quyền truy cập vào lớp {{domxref("LaunchQueue")}}, cho phép triển khai xử lý điều hướng khởi chạy tùy chỉnh trong PWA.

## Ví dụ

```js
if ("launchQueue" in window) {
  window.launchQueue.setConsumer((launchParams) => {
    if (launchParams.targetURL) {
      const params = new URL(launchParams.targetURL).searchParams;

      // Assuming a music player app that gets a track passed to it to be played
      const track = params.get("track");
      if (track) {
        audio.src = track;
        title.textContent = new URL(track).pathname.slice(1);
        audio.play();
      }
    }
  });
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Launch Handler API: Control how your app is launched](https://developer.chrome.com/docs/web-platform/launch-handler/)
