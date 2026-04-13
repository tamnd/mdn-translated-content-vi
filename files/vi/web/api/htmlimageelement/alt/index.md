---
title: "HTMLImageElement: alt property"
short-title: alt
slug: Web/API/HTMLImageElement/alt
page-type: web-api-instance-property
browser-compat: api.HTMLImageElement.alt
---

{{APIRef("HTML DOM")}}

Thuộc tính **`alt`** của giao diện {{domxref("HTMLImageElement")}} cung cấp văn bản dự phòng (thay thế) để hiển thị khi hình ảnh được chỉ định bởi phần tử {{HTMLElement("img")}} không được hiển thị, cho dù do lỗi, do người dùng đã tắt tính năng tải hình ảnh hoặc do hình ảnh chưa tải xong. Nó phản ánh thuộc tính nội dung [`alt`](/en-US/docs/Web/HTML/Reference/Elements/img#alt) của phần tử `<img>`.

Việc cung cấp văn bản thay thế phù hợp có ý nghĩa quan trọng về khả năng truy cập và các yêu cầu có thể khác nhau tùy theo mục đích của hình ảnh. Xem tài liệu tham khảo HTML [`<img>`](/en-US/docs/Web/HTML/Reference/Elements/img#authoring_meaningful_alternate_descriptions) để biết thêm thông tin.

## Giá trị

Một sợi dây.

## Ví dụ

### Đặt thuộc tính alt

```js
const img = new Image();
img.src = "example.png";
img.alt = "An example picture";
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}
