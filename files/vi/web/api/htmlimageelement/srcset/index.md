---
title: "HTMLImageElement: srcset property"
short-title: srcset
slug: Web/API/HTMLImageElement/srcset
page-type: web-api-instance-property
browser-compat: api.HTMLImageElement.srcset
---

{{APIRef("HTML DOM")}}

Thuộc tính **`srcset`** của giao diện {{domxref("HTMLImageElement")}} xác định một hoặc nhiều _chuỗi ứng viên hình ảnh_, được phân tách bằng dấu phẩy (`,`), mỗi chuỗi chỉ định tài nguyên hình ảnh sẽ sử dụng trong các trường hợp nhất định. Mỗi chuỗi ứng cử viên hình ảnh chứa một URL hình ảnh và bộ mô tả độ rộng hoặc mật độ pixel tùy chọn cho biết các điều kiện mà ứng cử viên đó nên được sử dụng thay vì hình ảnh được chỉ định bởi thuộc tính {{domxref("HTMLImageElement.src", "src")}}. Nó phản ánh thuộc tính nội dung [`srcset`](/en-US/docs/Web/HTML/Reference/Elements/img#srcset) của phần tử `<img>`.

Thuộc tính `srcset`, cùng với thuộc tính {{domxref("HTMLImageElement.sizes", "sizes")}}, là thành phần quan trọng trong việc thiết kế trang web phản hồi vì chúng có thể được sử dụng cùng nhau để tạo các trang sử dụng hình ảnh phù hợp cho tình huống hiển thị.

## Giá trị

Một sợi dây. Để biết thêm thông tin về cú pháp của thuộc tính `srcset`, hãy xem tài liệu tham khảo HTML [`<img>`](/en-US/docs/Web/HTML/Reference/Elements/img#srcset).

## Ví dụ

### Đặt thuộc tính srcset

```js
const img = new Image();
img.srcset =
  "/en-US/docs/Web/HTML/Reference/Elements/img/clock-demo-400px.png 2x, /en-US/docs/Web/HTML/Reference/Elements/img/clock-demo-200px.png";
img.alt = "An example picture";
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [Hình ảnh HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_images)
- [Hình ảnh phản hồi](/en-US/docs/Web/HTML/Guides/Responsive_images)
- [Hướng dẫn định dạng và loại tệp hình ảnh](/en-US/docs/Web/Media/Guides/Formats/Image_types)
- {{domxref("HTMLImageElement.currentSrc")}}
- {{domxref("HTMLImageElement.sizes")}}
- {{domxref("HTMLImageElement.src")}}
