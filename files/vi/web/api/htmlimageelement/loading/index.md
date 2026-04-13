---
title: "HTMLImageElement: loading property"
short-title: loading
slug: Web/API/HTMLImageElement/loading
page-type: web-api-instance-property
browser-compat: api.HTMLImageElement.loading
---

{{APIRef("HTML DOM")}}

Thuộc tính **`loading`** của giao diện {{domxref("HTMLImageElement")}} cung cấp gợi ý cho trình duyệt về cách xử lý việc tải hình ảnh hiện nằm ngoài {{Glossary("visual viewport")}} của cửa sổ. Điều này giúp tối ưu hóa việc tải nội dung của tài liệu bằng cách trì hoãn tải hình ảnh cho đến khi cần đến nó, thay vì ngay lập tức trong quá trình tải trang ban đầu. Nó phản ánh thuộc tính nội dung [`loading`](/en-US/docs/Web/HTML/Reference/Elements/img#loading) của phần tử `<img>`.

## Giá trị

Một chuỗi có giá trị là một trong `eager` hoặc `lazy`. Để biết ý nghĩa của chúng, hãy xem tài liệu tham khảo HTML [`<img>`](/en-US/docs/Web/HTML/Reference/Elements/img#loading).

## Ví dụ

### Cách sử dụng cơ bản

Hàm `addImageToList()` hiển thị bên dưới thêm hình thu nhỏ của ảnh vào danh sách các mục, sử dụng tính năng tải từng phần để tránh tải hình ảnh từ mạng cho đến khi thực sự cần.

```js
function addImageToList(url) {
  const list = document.querySelector("div.photo-list");

  const newItem = document.createElement("div");
  newItem.className = "photo-item";

  const newImg = document.createElement("img");
  newImg.loading = "lazy";
  newImg.width = 320;
  newImg.height = 240;
  newImg.src = url;

  newItem.appendChild(newImg);
  list.appendChild(newItem);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- Phần tử {{HTMLElement("img")}}
- [Hiệu suất web](/en-US/docs/Learn_web_development/Extensions/Performance) trong Khu vực học tập MDN
- [Lazy loading](/en-US/docs/Web/Performance/Guides/Lazy_loading) trong hướng dẫn hiệu suất web MDN
