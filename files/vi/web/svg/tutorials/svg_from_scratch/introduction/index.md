---
title: Giới thiệu
slug: Web/SVG/Tutorials/SVG_from_scratch/Introduction
page-type: tutorial-chapter
sidebar: svgref
---

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch", "Web/SVG/Tutorials/SVG_from_scratch/Getting_started") }}

[SVG](/en-US/docs/Web/SVG) là một ngôn ngữ [XML](/en-US/docs/Web/XML), tương tự [XHTML](/en-US/docs/Web/Glossary/XHTML), có thể dùng để vẽ đồ họa vector, như hình bên dưới. Nó có thể được dùng để tạo một hình ảnh bằng cách chỉ định tất cả các đường và hình dạng cần thiết, bằng cách sửa đổi các ảnh raster đã có, hoặc bằng cách kết hợp cả hai. Hình ảnh và các thành phần của nó cũng có thể được biến đổi, ghép với nhau, hoặc lọc để thay đổi hoàn toàn diện mạo.

![Logo dino của Mozilla](dino.svg)

SVG xuất hiện vào năm 1999 sau khi một số định dạng cạnh tranh được gửi tới [W3C](https://www.w3.org/) nhưng không được phê chuẩn đầy đủ. SVG được hỗ trợ bởi tất cả các [trình duyệt](https://caniuse.com/#search=svg) lớn. Một nhược điểm là việc tải SVG có thể chậm. SVG có một số lợi ích, bao gồm có [giao diện DOM](/en-US/docs/Web/API) sẵn có, và không yêu cầu tiện ích mở rộng của bên thứ ba. Có nên dùng nó hay không thường phụ thuộc vào trường hợp sử dụng cụ thể của bạn.

## Thành phần cơ bản

[HTML](/en-US/docs/Web/HTML) cung cấp các phần tử để định nghĩa tiêu đề, đoạn văn, bảng, v.v. Tương tự như vậy, SVG cung cấp các phần tử cho hình tròn, hình chữ nhật, và các đường cong đơn giản lẫn phức tạp. Một tài liệu SVG cơ bản không có gì hơn ngoài phần tử gốc {{ SVGElement('svg') }} và một vài hình dạng cơ bản ghép thành đồ họa. Ngoài ra, còn có phần tử {{ SVGElement('g') }}, được dùng để nhóm nhiều hình dạng cơ bản lại với nhau.

Bắt đầu từ cấu trúc cơ bản này, hình ảnh SVG có thể trở nên phức tạp tùy ý. SVG hỗ trợ gradient, xoay, hiệu ứng lọc, hoạt ảnh, tương tác với JavaScript, v.v. Nhưng tất cả các tính năng bổ sung này đều dựa vào tập phần tử tương đối nhỏ này để định nghĩa vùng đồ họa.

## Trước khi bắt đầu

Có rất nhiều ứng dụng vẽ, chẳng hạn [Inkscape](https://inkscape.org/), là phần mềm miễn phí và dùng SVG làm định dạng tệp gốc. Tuy nhiên, bài hướng dẫn này sẽ dựa vào một trình soạn thảo XML hoặc văn bản đáng tin cậy (tùy bạn chọn). Ý tưởng là dạy các cơ chế bên trong của SVG cho những ai muốn hiểu nó, và cách tốt nhất là tự tay viết một ít markup. Tuy nhiên, bạn nên ghi nhớ mục tiêu cuối cùng của mình. Không phải mọi trình xem SVG đều như nhau, nên rất có khả năng thứ được viết cho một ứng dụng sẽ không hiển thị hoàn toàn giống trên ứng dụng khác, vì chúng hỗ trợ các mức khác nhau của đặc tả SVG hoặc một đặc tả khác mà bạn đang dùng cùng SVG (tức là [JavaScript](/en-US/docs/Web/JavaScript) hoặc [CSS](/en-US/docs/Web/CSS)).

SVG được hỗ trợ trong mọi trình duyệt hiện đại và thậm chí một vài phiên bản trước đó trong một số trường hợp. Một bảng hỗ trợ trình duyệt khá đầy đủ có thể tìm thấy trên [Can I use](https://caniuse.com/svg). Firefox đã hỗ trợ một số nội dung SVG từ phiên bản 1.5, và mức hỗ trợ đó đã tăng dần qua từng bản phát hành. Hy vọng rằng, cùng với bài hướng dẫn ở đây, MDN có thể giúp các nhà phát triển theo kịp những khác biệt giữa Gecko và một số triển khai lớn khác.

Trước khi bắt đầu, bạn nên có hiểu biết cơ bản về XML hoặc một ngôn ngữ markup khác như HTML. Nếu bạn chưa quen với XML lắm, đây là một vài lưu ý:

- Các phần tử và thuộc tính SVG phải được nhập đúng chữ hoa chữ thường như ở đây vì XML phân biệt hoa thường (không giống HTML).
- Giá trị thuộc tính trong SVG phải được đặt trong dấu ngoặc kép, ngay cả khi chúng là số.

SVG là một đặc tả rất lớn. Bài hướng dẫn này chỉ cố gắng bao quát phần cơ bản. Khi đã quen, bạn nên có thể dùng [Element Reference](/en-US/docs/Web/SVG/Reference/Element) và [Interface Reference](/en-US/docs/Web/API/Document_Object_Model#svg_dom) để tìm bất cứ điều gì khác bạn cần biết.

## Các biến thể của SVG

Kể từ khi trở thành khuyến nghị vào năm 2003, phiên bản "đầy đủ" gần đây nhất của SVG là 1.1. Nó xây dựng trên SVG 1.0, nhưng thêm nhiều modularization hơn để dễ triển khai. [Ấn bản thứ hai của SVG 1.1](https://www.w3.org/TR/SVG11/) đã trở thành Khuyến nghị vào năm 2011. SVG 1.2 "đầy đủ" được dự định là bản phát hành lớn tiếp theo của SVG. Nó đã bị thay thế bởi đặc tả [SVG 2.0](https://svgwg.org/svg2-draft/), trở thành candidate recommendation vào năm 2018 và hiện là tiêu chuẩn hiện tại. SVG 2.0 theo cách tiếp cận tương tự CSS ở chỗ nó chia các thành phần thành nhiều đặc tả lỏng lẻo, chẳng hạn [SVG strokes](https://svgwg.org/specs/strokes/), [SVG paths](https://svgwg.org/specs/paths/), và [SVG markers](https://svgwg.org/specs/markers/).

Ngoài các khuyến nghị SVG đầy đủ, nhóm làm việc tại W3C còn giới thiệu SVG Tiny và SVG Basic vào năm 2003. Hai profile này chủ yếu nhắm tới thiết bị di động. SVG Tiny nên cho ra các primitive đồ họa cho thiết bị nhỏ có năng lực thấp. SVG Basic cung cấp nhiều tính năng của SVG đầy đủ, nhưng không gồm những tính năng khó triển khai hoặc nặng để kết xuất (như hoạt ảnh). Năm 2008, SVG Tiny 1.2 trở thành một Khuyến nghị của W3C.

Đã từng có kế hoạch cho đặc tả SVG Print, vốn sẽ thêm hỗ trợ cho nhiều trang và quản lý màu nâng cao. Công việc này đã bị dừng lại.

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch", "Web/SVG/Tutorials/SVG_from_scratch/Getting_started") }}
