---
title: Nội dung khác trong SVG
slug: Web/SVG/Tutorials/SVG_from_scratch/Other_content_in_SVG
page-type: tutorial-chapter
sidebar: svgref
---

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Clipping_and_masking", "Web/SVG/Tutorials/SVG_from_scratch/Filter_effects") }}

Ngoài các khối hình đồ họa như hình chữ nhật và hình tròn, SVG còn cung cấp một tập phần tử để nhúng các loại nội dung khác vào ảnh.

## Nhúng ảnh raster

Giống như phần tử img trong HTML, SVG có phần tử `image` để phục vụ cùng mục đích. Bạn có thể dùng nó để nhúng các ảnh raster (và vector) bất kỳ. Đặc tả yêu cầu các ứng dụng hỗ trợ ít nhất các tệp PNG, JPEG và SVG.

Ảnh được nhúng trở thành một phần tử SVG bình thường. Điều này có nghĩa là bạn có thể dùng các clip, mask, filter, phép xoay và mọi công cụ SVG khác lên nội dung đó:

```html
<svg
  version="1.1"
  xmlns="http://www.w3.org/2000/svg"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  width="200"
  height="200">
  <image
    x="90"
    y="-65"
    width="128"
    height="146"
    transform="rotate(45)"
    href="https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/image/mdn_logo_only_color.png" />
</svg>
```

{{ EmbedLiveSample('Embedding_raster_images','220','240') }}

## Nhúng XML bất kỳ

Vì SVG là một ứng dụng XML, dĩ nhiên bạn _luôn_ có thể nhúng XML tùy ý ở bất kỳ đâu trong tài liệu SVG. Nhưng khi đó bạn sẽ không có cách nào xác định SVG xung quanh nên phản ứng thế nào với nội dung đó. Thực ra, trong một trình xem tuân thủ chuẩn, nó sẽ không phản ứng gì cả, dữ liệu sẽ bị bỏ qua. Vì vậy đặc tả thêm phần tử {{ SVGElement("foreignObject") }} vào SVG. Mục đích duy nhất của nó là làm container cho markup khác và là nơi mang các thuộc tính tạo kiểu SVG (đáng chú ý nhất là `width` và `height` để xác định không gian mà đối tượng chiếm).

Phần tử `foreignObject` là một cách tốt để nhúng XHTML trong SVG. Nếu bạn có văn bản dài, bố cục HTML phù hợp và thuận tiện hơn phần tử `text` của SVG. Một trường hợp sử dụng khác thường được nhắc đến là nhúng công thức bằng MathML. Với các ứng dụng SVG khoa học, đây là một cách rất tốt để kết hợp cả hai thế giới.

> [!NOTE]
> Hãy nhớ rằng nội dung của `foreignObject` phải có thể được trình xem xử lý. Một trình xem SVG độc lập khó có thể hiển thị HTML hoặc MathML.

Vì `foreignObject` là một phần tử SVG, bạn có thể, giống như với `image`, dùng mọi khả năng của SVG với nó, và các khả năng đó sẽ được áp dụng cho nội dung của nó.

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Clipping_and_masking", "Web/SVG/Tutorials/SVG_from_scratch/Filter_effects") }}
