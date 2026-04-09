---
title: SVG như một hình ảnh
slug: Web/SVG/Guides/SVG_as_an_image
page-type: guide
spec-urls: https://drafts.csswg.org/css-backgrounds/#the-background-image
sidebar: svgref
---

SVG có thể được dùng như một định dạng hình ảnh trong HTML, CSS, một số phần tử SVG nhất định và thông qua Canvas API.
Trang này liệt kê các tính năng nơi bạn có thể cung cấp SVG làm nguồn hình ảnh.

## Các tính năng hỗ trợ SVG

Trình duyệt hỗ trợ hình ảnh SVG trong:

- phần tử HTML {{HTMLElement("img")}} hoặc {{SVGElement("svg")}}
- CSS {{cssxref("background-image")}}
- CSS {{cssxref("list-style-image")}}
- CSS {{cssxref("content")}}
- phần tử SVG {{SVGElement("image")}}
- phần tử SVG {{SVGElement("feImage")}}
- hàm Canvas [`drawImage`](/en-US/docs/Web/API/Canvas_API/Tutorial/Using_images#drawing_images)

## Hạn chế

Vì mục đích bảo mật, một số trình duyệt áp đặt các hạn chế lên nội dung SVG khi nó được dùng như một hình ảnh.
Cụ thể, có thể áp dụng các giới hạn sau:

- [JavaScript](/en-US/docs/Web/JavaScript) bị vô hiệu hóa.
- Tài nguyên bên ngoài (ví dụ: hình ảnh, stylesheet) không thể tải, dù chúng có thể được dùng nếu được nhúng qua [`data:` URLs](/en-US/docs/Web/URI/Reference/Schemes/data).
- Kiểu liên kết {{cssxref(":visited")}} không được hiển thị.
- Kiểu giao diện gốc của nền tảng (dựa trên giao diện hệ điều hành) bị vô hiệu hóa.

Lưu ý rằng các hạn chế trên chỉ áp dụng cho ngữ cảnh hình ảnh; chúng không áp dụng khi nội dung SVG được xem trực tiếp, hoặc khi nó được nhúng như một tài liệu thông qua các phần tử {{HTMLElement("iframe")}}, {{HTMLElement("object")}} hoặc {{HTMLElement("embed")}}.

## Đặc tả

{{Specifications}}
