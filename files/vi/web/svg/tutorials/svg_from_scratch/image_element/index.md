---
title: Phần tử image của SVG
slug: Web/SVG/Tutorials/SVG_from_scratch/Image_element
page-type: tutorial-chapter
sidebar: svgref
---

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Using_fonts", "Web/SVG/Tutorials/SVG_from_scratch/Tools_for_SVG") }}

Phần tử SVG {{ SVGElement("image") }} cho phép hiển thị các ảnh raster bên trong một đối tượng SVG.

Trong ví dụ cơ bản này, một ảnh .jpg được tham chiếu bởi một thuộc tính {{ SVGAttr("href") }} sẽ được hiển thị bên trong một đối tượng SVG:

```xml
<?xml version="1.0" standalone="no"?>
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN"
  "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
<svg width="5cm" height="4cm" version="1.1"
     xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
  <image href="firefox.jpg" x="0" y="0" height="50px" width="50px"/>
</svg>
```

Có một vài điều quan trọng cần lưu ý:

- Nếu bạn không đặt các thuộc tính `x` hoặc `y`, chúng sẽ được đặt thành `0`.
- Nếu bạn không đặt các thuộc tính `height` hoặc `width`, chúng sẽ được đặt thành `0`.
- Việc có thuộc tính `height` hoặc `width` bằng `0` sẽ vô hiệu hóa việc hiển thị ảnh.

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Using_fonts", "Web/SVG/Tutorials/SVG_from_scratch/Tools_for_SVG") }}
