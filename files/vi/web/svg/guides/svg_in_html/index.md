---
title: Giới thiệu SVG trong HTML
slug: Web/SVG/Guides/SVG_in_HTML
page-type: guide
sidebar: svgref
---

Bài viết này và ví dụ đi kèm cho thấy cách sử dụng SVG [nội tuyến](/en-US/docs/Web/SVG).

## Ví dụ cơ bản

Để đưa một SVG nội tuyến vào một tệp HTML, hãy dán toàn bộ tệp SVG vào trong tệp HTML.

```html
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="utf-8" />
    <title>Ví dụ SVG</title>
    <meta name="viewport" content="width=device-width" />
  </head>
  <body>
    <svg viewBox="0 0 100 100" preserveAspectRatio="xMidYMid slice" role="img">
      <title>Một dải màu chuyển sắc</title>
      <linearGradient id="gradient">
        <stop class="begin" offset="0%" stop-color="red" />
        <stop class="end" offset="100%" stop-color="black" />
      </linearGradient>
      <rect x="0" y="0" width="100" height="100" fill="url(#gradient)" />
      <circle cx="50" cy="50" r="30" fill="url(#gradient)" />
    </svg>
  </body>
</html>
```

## Thảo luận

Trang này là HTML và CSS thông thường với một SVG duy nhất. Phần duy nhất đáng chú ý là phần tử `<svg>` mà nó chứa. Phần tử này và các phần tử con của nó được khai báo là nằm trong namespace SVG. Phần tử chứa một gradient và hai hình được tô bằng gradient đó. Các điểm dừng màu của gradient có màu được đặt bằng CSS.

Có ba thuộc tính và một phần tử lồng nhau đáng lưu ý:

1. Thuộc tính [`viewBox`](/en-US/docs/Web/SVG/Reference/Attribute/viewBox) thiết lập một hệ tọa độ logic mà tọa độ của hình SVG được tham chiếu theo. Trong trường hợp này, hình của chúng ta được bố trí trong một viewport 100 x 100.

2. Thuộc tính [`preserveAspectRatio`](/en-US/docs/Web/SVG/Reference/Attribute/preserveAspectRatio) chỉ định rằng {{glossary("aspect ratio")}} phải được giữ nguyên bằng cách căn giữa hình trong kích thước có sẵn, co giãn tới mức tối đa theo chiều cao hoặc chiều rộng rồi cắt bỏ phần tràn ra ngoài.

3. Bao gồm [`role="img"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/img_role) đảm bảo các công nghệ hỗ trợ sẽ xử lý SVG như một hình ảnh.

4. Một [`<title>`](/en-US/docs/Web/SVG/Reference/Element/title) bên trong SVG cung cấp mô tả ngắn, có thể truy cập được của đồ họa. Văn bản tiêu đề không được hiển thị, nhưng trình duyệt có thể hiển thị nó như một tooltip khi SVG được di chuột lên. `<title>` nên là phần tử đầu tiên ngay sau thẻ mở `<svg>`.

## Thực hành tốt nhất

Khi một SVG được nhúng thông qua phần tử {{HTMLElement('img')}}, thuộc tính `alt` cung cấp văn bản thay thế giúp hình ảnh có thể truy cập. SVG nội tuyến không hỗ trợ thuộc tính `alt`. Nhưng nó hỗ trợ một số cách khác để làm cho nó có thể truy cập được. Với SVG nội tuyến, mã nguồn có sẵn trong DOM, nghĩa là toàn bộ phần đánh dấu bên trong một tệp SVG nội tuyến đều có thể truy cập được đối với Accessibility Object Model, hay AOM. Bao gồm phần tử `<title>` sẽ cung cấp văn bản thay thế đó.

Nếu hình ảnh truyền đạt nhiều hơn một tiêu đề ngắn, hãy thêm mô tả dài hơn bằng phần tử [`<desc>`](/en-US/docs/Web/SVG/Reference/Element/desc). Phần tử `<desc>` cung cấp mô tả dài, có thể truy cập được. Tương tự như văn bản `<title>`, văn bản trong `<desc>` không được hiển thị lên màn hình.

Nếu SVG có thể được gắn nhãn bằng văn bản hiển thị, hãy tham chiếu văn bản đó bằng thuộc tính [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby). Hoặc, bao gồm thuộc tính `aria-labelledby` với [`id`](/en-US/docs/Web/SVG/Reference/Attribute/id) của `<title>`.

```html
<svg viewBox="0 0 100 125" role="img" aria-labelledby="svgTitle svgDescription">
  <title id="svgTitle">Sổ tay</title>
  <desc id="svgDescription">
    Một tập sách không có gì đặc biệt gồm mười hai trang, mở ra ở trang giữa
  </desc>
  <defs>
    <style>
      rect {
        fill: #cccccc;
        stroke: #666666;
        transform-origin: top;
      }
    </style>
  </defs>

  <rect width="36" height="60" x="13" y="18" ry="2" transform="skewy(24deg)" />
  <rect width="39" height="60" x="11" y="20" ry="2" transform="skewY(18deg)" />
  <rect width="42" height="90" x="8" y="22" ry="2" transform="skewY(12deg)" />
  <rect width="36" height="60" x="50" y="18" ry="2" transform="skewY(-24deg)" />
  <rect width="39" height="60" x="50" y="20" ry="2" transform="skewY(-18deg)" />
  <rect width="42" height="90" x="50" y="22" ry="2" transform="skewY(-12deg)" />
</svg>
```

Nếu SVG có thể được mô tả bằng văn bản hiển thị, thì văn bản đó có thể được tham chiếu bằng thuộc tính [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby). Nếu dùng aria-describedby, nó sẽ được ưu tiên hơn `<desc>`.

Trong ví dụ của chúng ta, chúng ta đã bao gồm cả mô tả lẫn tiêu đề trong thuộc tính `aria-labelledby`, vì nó có hỗ trợ tốt hơn từ công nghệ hỗ trợ so với `aria-describedby`.

## Xem thêm

- [Bắt đầu với SVG](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Getting_started)
