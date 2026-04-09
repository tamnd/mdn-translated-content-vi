---
title: Liên kết
slug: Web/SVG/Guides/Linking
page-type: guide
sidebar: svgref
---

Thuộc tính {{SVGAttr("target")}} trên phần tử SVG {{SVGElement("a")}} không hoạt động trong Mozilla Firefox 1.5. Khi tài liệu SVG được nhúng vào một tài liệu HTML cha bằng thẻ:

page1.html:

```html
<html lang="en">
  <body>
    <p>This is a SVG button:</p>
    <object
      width="100"
      height="50"
      type="image/svg+xml"
      data="button.svg"></object>
  </body>
</html>
```

button.svg:

```xml
<?xml version="1.1" encoding="UTF-8"?>
<svg xmlns="http://www.w3.org/2000/svg">
  <a href="page2.html" target="_top">
    <g>
      <!-- button graphical elements here -->
    </g>
  </a>
</svg>
```

Đặc tả nói rằng trình duyệt phải điều hướng tới tài liệu HTML page2.html khi nhấp vào phần đồ họa của nút. Tuy nhiên, `target` không hoạt động với phần tử SVG `<a>` trong cách triển khai của Mozilla trên Firefox 1.5. (Vấn đề này sẽ được sửa trong Firefox 2.0.)

Dù sao thì hành vi thu được trong Moz SVG là page2.html sẽ được tải vào khung nơi nút SVG đang nằm (tức là lúc này bạn sẽ có page2.html được nhúng bên trong một khung 100x50 pixel trong page1.html).

Để khắc phục, cần một chút "hack" JavaScript khá xấu:

button.svg:

```xml
<?xml version="1.1" encoding="UTF-8"?>
<svg xmlns="http://www.w3.org/2000/svg">
  <g onclick="top.document.href='page2.html'" cursor="pointer">
    <!-- button graphical elements here -->
  </g>
</svg>
```

## Ví dụ

Để xem ví dụ của giải pháp này đang hoạt động, hãy xem [www.codedread.com](https://www.codedread.com/).
