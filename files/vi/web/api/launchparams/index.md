---
title: LaunchParams
slug: Web/API/LaunchParams
page-type: web-api-interface
status:
  - experimental
browser-compat: api.LaunchParams
---

{{APIRef("Launch Handler API")}}{{SeeCompatTable}}

Giao diện **`LaunchParams`** của {{domxref("Launch Handler API", "Launch Handler API", "", "nocode")}} được sử dụng khi triển khai xử lý điều hướng khởi chạy tùy chỉnh trong PWA. Khi {{domxref("LaunchQueue.setConsumer", "window.launchQueue.setConsumer()")}} được gọi để thiết lập chức năng xử lý điều hướng khởi chạy, hàm callback bên trong `setConsumer()` nhận một đối tượng `LaunchParams`.

Điều hướng tùy chỉnh như vậy được khởi tạo qua {{domxref("Window.launchQueue")}} khi PWA được khởi chạy với giá trị `client_mode` của [`launch_handler`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/launch_handler) là `focus-existing`, `navigate-new`, hoặc `navigate-existing`.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("LaunchParams.files")}} {{ReadOnlyInline}}{{Experimental_Inline}}
  - : Trả về một mảng chỉ đọc các đối tượng {{domxref("FileSystemHandle")}} đại diện cho các tệp được truyền cùng với điều hướng khởi chạy qua phương thức [`POST`](/en-US/docs/Web/HTTP/Reference/Methods/POST).
- {{domxref("LaunchParams.targetURL")}} {{ReadOnlyInline}}{{Experimental_Inline}}
  - : Trả về URL đích của lần khởi chạy.

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
- {{domxref("Window.launchQueue")}}
- [Musicr 2.0](https://mdn.github.io/dom-examples/launch-handler/) demo app
