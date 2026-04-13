---
title: "LaunchQueue: phương thức setConsumer()"
short-title: setConsumer()
slug: Web/API/LaunchQueue/setConsumer
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.LaunchQueue.setConsumer
---

{{APIRef("Launch Handler API")}}{{SeeCompatTable}}

Phương thức **`setConsumer()`** của giao diện {{domxref("LaunchQueue")}} được sử dụng để khai báo callback sẽ xử lý điều hướng khởi chạy tùy chỉnh trong một [ứng dụng web tiến bộ](/en-US/docs/Web/Progressive_web_apps) (PWA). Điều hướng tùy chỉnh như vậy được khởi tạo thông qua {{domxref("Window.launchQueue")}} khi một PWA được khởi chạy với giá trị `client_mode` của [`launch_handler`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/launch_handler) là `focus-existing`, `navigate-new` hoặc `navigate-existing`.

## Cú pháp

```js-nolint
setConsumer(callback)
```

### Tham số

- `callback`
  - : Hàm callback xử lý điều hướng tùy chỉnh cho PWA. Callback được truyền một phiên bản đối tượng {{domxref("LaunchParams")}} làm tham số.

### Giá trị trả về

`undefined`.

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
