---
title: "SVG: Đồ họa vector có thể mở rộng"
short-title: SVG
slug: Web/SVG
page-type: landing-page
sidebar: svgref
---

**Scalable Vector Graphics (SVG)** là một ngôn ngữ đánh dấu dựa trên [XML](/en-US/docs/Web/XML) để mô tả [đồ họa vector](https://en.wikipedia.org/wiki/Vector_graphics) hai chiều.

Như vậy, đây là một chuẩn web mở, dựa trên văn bản, dùng để mô tả hình ảnh có thể được hiển thị sắc nét ở mọi kích thước và được thiết kế đặc biệt để hoạt động tốt với các chuẩn web khác bao gồm [CSS](/en-US/docs/Web/CSS), [DOM](/en-US/docs/Web/API/Document_Object_Model), [JavaScript](/en-US/docs/Web/JavaScript), và [SMIL](/en-US/docs/Web/SVG/Guides/SVG_animation_with_SMIL). Về cơ bản, SVG đối với đồ họa cũng giống như [HTML](/en-US/docs/Web/HTML) đối với văn bản.

Hình ảnh SVG và các hành vi liên quan của chúng được định nghĩa trong các tệp văn bản [XML](/en-US/docs/Web/XML), nghĩa là chúng có thể được tìm kiếm, lập chỉ mục, viết script, và nén. Ngoài ra, điều đó cũng có nghĩa là chúng có thể được tạo và chỉnh sửa bằng bất kỳ trình soạn thảo văn bản nào hoặc bằng phần mềm vẽ.

So với các định dạng ảnh bitmap cổ điển như {{Glossary("JPEG")}} hoặc {{Glossary("PNG")}}, ảnh vector định dạng SVG có thể được hiển thị ở bất kỳ kích thước nào mà không mất chất lượng và có thể được bản địa hóa dễ dàng bằng cách cập nhật phần văn bản bên trong chúng, mà không cần trình chỉnh sửa đồ họa. Với các thư viện phù hợp, tệp SVG thậm chí có thể được bản địa hóa ngay trong lúc chạy.

SVG đã được [World Wide Web Consortium (W3C)](https://www.w3.org/) phát triển từ năm 1999.

## Hướng dẫn thực hành

[Các hướng dẫn SVG](/en-US/docs/Web/SVG/Tutorials) được thiết kế để dẫn bạn đi qua các chủ đề, giả định rằng bạn chưa có kinh nghiệm trước đó, bắt đầu từ những điều cơ bản và tiến dần tới các kỹ thuật nâng cao hơn.

- [Giới thiệu SVG từ đầu](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch)
  - : Hướng dẫn này nhằm giải thích nội bộ của SVG và chứa nhiều chi tiết kỹ thuật. Nếu bạn chỉ muốn vẽ những hình ảnh đẹp, bạn có thể thấy hữu ích hơn khi xem trang tài liệu của [Inkscape](https://inkscape.org/learn/). Một phần giới thiệu SVG tốt khác được W3C cung cấp trong [SVG Primer](https://www.w3.org/Graphics/SVG/IG/resources/svgprimer.html). Bạn cũng có thể xem thử [SVG Tutorial](https://svg-tutorial.com/) theo chủ đề lịch mùa vọng, hướng dẫn bạn viết mã cho 25 SVG lễ hội.

## Hướng dẫn

[Các hướng dẫn SVG](/en-US/docs/Web/SVG/Guides) giúp bạn làm việc với SVG trên web, bao quát các chủ đề như nhúng, kiểu MIME (media), xử lý script, hoạt ảnh, bộ lọc, và nhiều hơn nữa.

- [Áp dụng hiệu ứng SVG lên nội dung HTML](/en-US/docs/Web/SVG/Guides/Applying_SVG_effects_to_HTML_content)
  - : Trình duyệt hiện đại hỗ trợ dùng SVG trong các kiểu CSS để áp dụng hiệu ứng đồ họa lên nội dung HTML.
- [Kiểu nội dung](/en-US/docs/Web/SVG/Guides/Content_type)
  - : SVG sử dụng nhiều kiểu dữ liệu. Bài viết này liệt kê các kiểu đó cùng cú pháp và mô tả về mục đích sử dụng.
- [Nhập môn namespace](/en-US/docs/Web/SVG/Guides/Namespaces_crash_course)
  - : Namespace là yếu tố thiết yếu đối với user agent hỗ trợ nhiều phương ngữ XML.
    Trình duyệt phải rất chặt chẽ; dành thời gian hiểu namespace ngay bây giờ sẽ giúp bạn tránh đau đầu về sau.
- [Viết script](/en-US/docs/Web/SVG/Guides/Scripting)
  - : Có nhiều cách để tạo và thao tác SVG bằng JavaScript.
    Tài liệu này mô tả xử lý sự kiện, tính tương tác và làm việc với nội dung SVG được nhúng.
- [Hoạt ảnh SVG với SMIL](/en-US/docs/Web/SVG/Guides/SVG_animation_with_SMIL)
  - : SMIL là một ngôn ngữ dựa trên XML để viết trình bày đa phương tiện tương tác.
    Tác giả có thể dùng cú pháp SMIL trong SVG để định nghĩa thời gian và bố cục của các phần tử cho hoạt ảnh.
- [SVG như một hình ảnh](/en-US/docs/Web/SVG/Guides/SVG_as_an_image)
  - : SVG có thể được dùng như một định dạng ảnh trong HTML, CSS, một số phần tử SVG, và qua Canvas API.
    Trang này liệt kê các tính năng nơi bạn có thể cung cấp SVG làm nguồn ảnh.
- [Bộ lọc SVG](/en-US/docs/Web/SVG/Guides/SVG_filters)
  - : SVG hỗ trợ bộ lọc để tác giả có thể áp dụng các hiệu ứng như bóng đổ hoặc làm mờ, hoặc thậm chí gộp kết quả của các bộ lọc khác nhau.
- [Giới thiệu SVG trong HTML](/en-US/docs/Web/SVG/Guides/SVG_in_HTML)
  - : Bài viết này cho thấy cách dùng SVG nội tuyến và bao gồm các ví dụ minh họa.

## Tham khảo

[Tài liệu tham khảo SVG](/en-US/docs/Web/SVG/Reference) của chúng tôi chứa thông tin đầy đủ về các phần tử, thuộc tính, và giao diện DOM, đồng thời liệt kê các tài liệu thông số kỹ thuật và chuẩn liên quan.

- [Các phần tử SVG](/en-US/docs/Web/SVG/Reference/Element)
  - : Các phần tử SVG dùng để cấu trúc, vẽ, và bố trí đồ họa vector.
- [Các thuộc tính SVG](/en-US/docs/Web/SVG/Reference/Attribute)
  - : Các thuộc tính SVG có thể dùng để chỉ định cách một phần tử được xử lý hoặc hiển thị.
- [Giao diện SVG DOM](/en-US/docs/Web/API/Document_Object_Model#svg_dom)
  - : SVG DOM API để tương tác với SVG bằng JavaScript.

## Tài nguyên

- [Bộ kiểm thử SVG](https://github.com/w3c/svgwg/wiki/Testing)
- [Trình kiểm tra đánh dấu](https://validator.w3.org/#validate_by_input)
- [Hướng dẫn tác giả SVG](https://jwatt.org/svg/authoring/)
- [SVG tutorial](https://svg-tutorial.com/)
- [Thư viện trực quan hóa dữ liệu D3](https://d3js.org/)
