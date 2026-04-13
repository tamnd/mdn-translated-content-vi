---
title: LaunchQueue
slug: Web/API/LaunchQueue
page-type: web-api-interface
status:
  - experimental
browser-compat: api.LaunchQueue
---

{{APIRef("Launch Handler API")}}{{SeeCompatTable}}

Giao diện **`LaunchQueue`** của {{domxref("Launch Handler API", "Launch Handler API", "", "nocode")}} có thể truy cập thông qua thuộc tính {{domxref("Window.launchQueue")}}. Khi một [ứng dụng web tiến bộ](/en-US/docs/Web/Progressive_web_apps) (PWA) được khởi chạy với giá trị `client_mode` của [`launch_handler`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/launch_handler) là `focus-existing`, `navigate-new` hoặc `navigate-existing`, `LaunchQueue` cung cấp quyền truy cập vào chức năng cho phép triển khai xử lý điều hướng khởi chạy tùy chỉnh trong PWA. Chức năng này được kiểm soát bởi các thuộc tính của đối tượng {{domxref("LaunchParams")}} được truyền vào hàm callback của {{domxref("LaunchQueue.setConsumer", "setConsumer()")}}.

{{InheritanceDiagram}}

## Phương thức phiên bản

- {{domxref("LaunchQueue.setConsumer", "setConsumer()")}} {{Experimental_Inline}}
  - : Chứa hàm callback xử lý điều hướng khởi chạy tùy chỉnh cho một PWA.

## Ví dụ

```js
if ("launchQueue" in window) {
  window.launchQueue.setConsumer((launchParams) => {
    if (launchParams.targetURL) {
      const params = new URL(launchParams.targetURL).searchParams;

      // Giả sử ứng dụng nghe nhạc nhận một bài hát để phát
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
- {{domxref("Window.launchQueue")}}
- [Musicr 2.0](https://mdn.github.io/dom-examples/launch-handler/) demo app
