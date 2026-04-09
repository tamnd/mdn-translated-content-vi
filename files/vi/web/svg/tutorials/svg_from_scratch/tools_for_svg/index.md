---
title: Công cụ cho SVG
slug: Web/SVG/Tutorials/SVG_from_scratch/Tools_for_SVG
page-type: tutorial-chapter
sidebar: svgref
---

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Image_element", "Web/SVG/Tutorials/SVG_from_scratch/SVG_and_CSS") }}

Giờ khi chúng ta đã đề cập các kiến thức cơ bản về nội bộ của SVG, chúng ta sẽ xem qua một số công cụ để làm việc với các tệp SVG.

## Inkscape

URL: [www.inkscape.org](https://inkscape.org/)

Một trong những công cụ quan trọng nhất cho một định dạng đồ họa là một chương trình vẽ tốt. Inkscape cung cấp khả năng vẽ vector hiện đại, và nó là mã nguồn mở.

Hơn nữa, nó dùng SVG làm định dạng tệp gốc. Để lưu dữ liệu riêng của Inkscape, nó mở rộng tệp SVG bằng các phần tử và thuộc tính trong một namespace tùy chỉnh, nhưng bạn cũng có thể chọn xuất ra SVG thuần.

## Adobe Illustrator

URL: [www.adobe.com/products/illustrator/](https://www.adobe.com/products/illustrator.html)

Trước khi Adobe mua lại Macromedia, đây là nhà quảng bá SVG nổi bật nhất. Từ thời kỳ đó có sự hỗ trợ tốt cho SVG trong Illustrator. Tuy nhiên, SVG được tạo ra thường có một số điểm kỳ quặc, khiến cần hậu xử lý để có thể áp dụng chung.

## Apache Batik

URL: [xmlgraphics.apache.org/batik/](https://xmlgraphics.apache.org/batik/)

Batik là một tập công cụ mã nguồn mở dưới sự quản lý của Apache Software Foundation. Bộ công cụ này được viết bằng Java và hỗ trợ gần như đầy đủ SVG 1.1, cũng như một số tính năng ban đầu được dự kiến cho SVG 1.2.

Batik cung cấp một trình xem (Squiggle), một bộ rasterize để xuất PNG, một trình pretty print SVG để định dạng các tệp SVG, và một bộ chuyển đổi TrueType sang SVG-Font.

Cùng với [Apache FOP](https://xmlgraphics.apache.org/fop/), Batik có thể chuyển đổi SVG sang PDF.

### Các bộ dựng khác

Có nhiều dự án có thể tạo ảnh raster từ nguồn SVG. [ImageMagick](https://imagemagick.org/) là một trong những công cụ xử lý ảnh dòng lệnh nổi tiếng nhất. Thư viện GNOME [rsvg](https://wiki.gnome.org/Projects/LibRsvg) được Wikipedia dùng để raster hóa đồ họa SVG của họ. Việc dùng các trình duyệt headless như SlimerJS và PhantomJS cũng phổ biến cho mục đích này, vì ảnh tạo ra gần với cách SVG sẽ trông như thế nào trong trình duyệt hơn.

## Google Docs

URL: [www.google.com/google-d-s/drawings/](https://docs.google.com/drawings)

Các bản vẽ từ Google Docs có thể được xuất ra dưới dạng SVG.

## Khoa học

Các công cụ vẽ biểu đồ nổi tiếng xfig và gnuplot đều hỗ trợ xuất ra SVG. Để hiển thị biểu đồ trên web, [JSXGraph](https://jsxgraph.uni-bayreuth.de/home/) hỗ trợ VML, SVG và canvas, tự động quyết định dùng công nghệ nào dựa trên khả năng của trình duyệt.

Trong các ứng dụng GIS (Geographic Information System), SVG thường được dùng vừa làm định dạng lưu trữ vừa làm định dạng hiển thị. Xem [carto.net](https://carto.net/) để biết chi tiết.

## Thêm công cụ!

W3C cung cấp một [danh sách chương trình](https://www.w3.org/Graphics/SVG/WG/wiki/Implementations) hỗ trợ SVG.

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Image_element", "Web/SVG/Tutorials/SVG_from_scratch/SVG_and_CSS") }}
