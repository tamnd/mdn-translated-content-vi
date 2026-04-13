---
title: "HTMLMediaElement: thuộc tính loading"
short-title: loading
slug: Web/API/HTMLMediaElement/loading
page-type: web-api-instance-property
browser-compat: api.HTMLMediaElement.loading
---

{{APIRef("HTML DOM")}}

Thuộc tính **`loading`** của giao diện {{domxref("HTMLMediaElement")}} cung cấp gợi ý cho trình duyệt về cách xử lý việc tải phương tiện hiện ở bên ngoài {{Glossary("visual viewport")}} của cửa sổ. Điều này giúp tối ưu hóa việc tải nội dung của tài liệu bằng cách trì hoãn tải phương tiện cho đến khi cần đến nó, thay vì ngay lập tức trong quá trình tải trang ban đầu. Nó phản ánh thuộc tính nội dung [`loading`](/en-US/docs/Web/HTML/Reference/Elements/audio#loading) của phần tử `<audio>` hoặc thuộc tính nội dung [`loading`](/en-US/docs/Web/HTML/Reference/Elements/video#loading) của phần tử `<video>`.

## Giá trị

Một chuỗi có giá trị là một trong `eager` hoặc `lazy`. Để biết ý nghĩa của chúng, hãy xem tài liệu tham khảo HTML [`<audio loading>`](/en-US/docs/Web/HTML/Reference/Elements/audio#loading) hoặc [`<video loading>`](/en-US/docs/Web/HTML/Reference/Elements/video#loading).

## Ví dụ

### Cách sử dụng cơ bản

Chức năng `addVideoToList()` hiển thị bên dưới sẽ thêm hình thu nhỏ của video vào danh sách các mục, sử dụng tính năng tải từng phần để tránh tải video từ mạng cho đến khi thực sự cần.

```js
function addVideoToList(url) {
  const list = document.querySelector("div.video-list");

  const newItem = document.createElement("div");
  newItem.className = "video-item";

  const newVideo = document.createElement("video");

  // Lazy-load if supported
  if ("loading" in HTMLVideoElement.prototype) {
    newVideo.loading = "lazy";
  } else {
    // If native lazy-loading is not supported you may want to consider
    // alternatives, though this may be fine as a progressive enhancement.
  }

  newVideo.width = 320;
  newVideo.height = 240;
  newVideo.src = url;

  newItem.appendChild(newVideo);
  list.appendChild(newItem);
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử {{HTMLElement("audio")}}
- Phần tử {{HTMLElement("video")}}
- [Web performance](/en-US/docs/Learn_web_development/Extensions/Performance) trong Khu vực học tập MDN
- [Lazy loading](/en-US/docs/Web/Performance/Guides/Lazy_loading) trong hướng dẫn hiệu suất web MDN
