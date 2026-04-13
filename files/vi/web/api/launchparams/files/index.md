---
title: "LaunchParams: files property"
short-title: files
slug: Web/API/LaunchParams/files
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.LaunchParams.files
---

{{APIRef("Launch Handler API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`files`** của giao diện {{domxref("LaunchParams")}} trả về một mảng các đối tượng {{domxref("FileSystemHandle")}} đại diện cho các tệp được truyền cùng với điều hướng khởi chạy qua phương thức [`POST`](/en-US/docs/Web/HTTP/Reference/Methods/POST).

## Giá trị

Một mảng chỉ đọc các đối tượng {{domxref("FileSystemHandle")}}.

## Ví dụ

```js
if ("launchQueue" in window) {
  window.launchQueue.setConsumer((launchParams) => {
    if (launchParams.files) {
      const files = launchParams.files;
      for (file in files) {
        // Do stuff with file handles
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
