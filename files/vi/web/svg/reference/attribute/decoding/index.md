---
title: decoding
slug: Web/SVG/Reference/Attribute/decoding
page-type: svg-attribute
browser-compat: svg.elements.image.decoding
sidebar: svgref
---

Thuộc tính `decoding`, hợp lệ trên các phần tử {{SVGElement("image")}}, cung cấp một gợi ý cho trình duyệt về việc nó nên thực hiện giải mã hình ảnh cùng với việc hiển thị nội dung khác trong một bước trình bày duy nhất có vẻ "đúng" hơn (`sync`), hay hiển thị và trình bày nội dung khác trước rồi giải mã hình ảnh và trình bày nó sau (`async`). Trên thực tế, `async` có nghĩa là lần vẽ tiếp theo sẽ không chờ hình ảnh giải mã xong.

Thường rất khó nhận thấy bất kỳ hiệu ứng rõ rệt nào khi dùng `decoding` trên các phần tử `<image>` tĩnh. Chúng có thể sẽ được hiển thị ban đầu như những hình ảnh trống trong khi tệp hình ảnh đang được tìm nạp (từ mạng hoặc từ bộ nhớ đệm), rồi sau đó vẫn được xử lý độc lập, vì vậy việc "đồng bộ" các cập nhật nội dung ít rõ ràng hơn. Tuy nhiên, việc chặn kết xuất trong khi giải mã diễn ra, dù thường rất nhỏ, _vẫn có thể đo được_ - ngay cả khi khó quan sát bằng mắt người.

Việc dùng các kiểu `decoding` khác nhau có thể tạo ra khác biệt dễ nhận thấy hơn khi chèn động các phần tử `<image>` vào DOM thông qua JavaScript - xem {{domxref("SVGImageElement.decoding")}} để biết thêm chi tiết.

Các giá trị được phép:

- `sync`
  - : Giải mã hình ảnh đồng bộ cùng với việc hiển thị nội dung khác và trình bày mọi thứ cùng nhau.
- `async`
  - : Giải mã hình ảnh không đồng bộ, sau khi đã hiển thị và trình bày nội dung khác.
- `auto`
  - : Không có ưu tiên cho chế độ giải mã; trình duyệt sẽ quyết định điều gì là tốt nhất cho người dùng. Đây là giá trị mặc định.

## Ví dụ

```html
<svg width="200" height="200" xmlns="http://www.w3.org/2000/svg">
  <image
    href="https://example.com/mdn_logo_dark.png"
    height="200"
    width="200"
    decoding="async" />
</svg>
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [SVGImageElement: thuộc tính decoding](/en-US/docs/Web/API/SVGImageElement/decoding)
- [Thuộc tính giải mã hình ảnh thực sự làm gì?](https://www.tunetheweb.com/blog/what-does-the-image-decoding-attribute-actually-do/) trên tunetheweb.com (2023)
