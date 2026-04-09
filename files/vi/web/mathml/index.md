---
title: MathML
slug: Web/MathML
page-type: landing-page
browser-compat: mathml.elements.math
spec-urls: https://w3c.github.io/mathml/
sidebar: mathmlref
---

**Mathematical Markup Language (MathML)** là ngôn ngữ dựa trên [XML](/en-US/docs/Web/XML) dùng để mô tả ký hiệu toán học.

[MathML](https://w3c.github.io/mathml/) ban đầu được thiết kế như một đặc tả đa dụng cho trình duyệt, bộ ứng dụng văn phòng, [hệ đại số máy tính](https://en.wikipedia.org/wiki/Computer_algebra_system), trình đọc [EPUB](https://www.w3.org/publishing/epub33/) và các công cụ sinh nội dung dựa trên [LaTeX](https://en.wikipedia.org/wiki/LaTeX). Tuy nhiên, cách tiếp cận này không thực sự phù hợp với Web: [tập con tập trung vào ngữ nghĩa](https://w3c.github.io/mathml/#contm) chưa bao giờ được triển khai trong trình duyệt, trong khi [tập con tập trung vào bố cục toán học](https://w3c.github.io/mathml/#presm) lại dẫn đến các cách triển khai không đầy đủ và thiếu nhất quán giữa các trình duyệt.

[MathML Core](https://w3c.github.io/mathml-core/) là một tập con có nhiều chi tiết triển khai hơn, dựa trên các quy tắc từ [LaTeX](https://en.wikipedia.org/wiki/LaTeX) và [Open Font Format](https://learn.microsoft.com/en-us/typography/opentype/spec/math). Nó được điều chỉnh cho trình duyệt và được thiết kế riêng để hoạt động tốt cùng các tiêu chuẩn web khác như [HTML](/en-US/docs/Web/HTML), [CSS](/en-US/docs/Web/CSS), [DOM](/en-US/docs/Web/API/Document_Object_Model) và [JavaScript](/en-US/docs/Web/JavaScript).

Bên dưới là các liên kết đến tài liệu, ví dụ và công cụ để làm việc với MathML. MDN dùng [MathML Core](https://w3c.github.io/mathml-core/) làm đặc tả tham chiếu, nhưng do lịch sử tiêu chuẩn hóa thiếu ổn định, các tính năng MathML cũ vẫn có thể xuất hiện trong những triển khai hiện có và trong nội dung web.

> [!NOTE]
> Nhà phát triển và tác giả nội dung được khuyến nghị mạnh mẽ chuyển sang MathML Core, có thể kết hợp thêm các công nghệ web khác để bao phủ những trường hợp còn thiếu. Math WG đang duy trì một bộ [MathML polyfill](https://github.com/w3c/mathml-polyfills) để hỗ trợ quá trình chuyển đổi đó.

## Hướng dẫn từng bước

[Các hướng dẫn MathML](/en-US/docs/Web/MathML/Tutorials) được thiết kế để dẫn bạn đi qua từng chủ đề với giả định rằng bạn chưa có kinh nghiệm trước đó, bắt đầu từ các khái niệm cơ bản rồi tiến dần đến các kỹ thuật nâng cao hơn.

- [MathML cho người mới bắt đầu](/en-US/docs/Web/MathML/Tutorials/For_beginners)
  - : Hướng dẫn này sẽ dẫn bạn qua quá trình tạo công thức toán học bằng markup có cấu trúc. Nội dung bắt đầu bằng phần giới thiệu về cách thêm MathML vào tài liệu HTML, sau đó đi sâu vào các thành phần quan trọng: phân số và căn thức, các phần tử có chỉ số/ký hiệu đi kèm, cùng các vùng chứa văn bản. Tiếp theo, hướng dẫn đề cập đến bố cục dạng bảng cho ma trận và định dạng toán học nâng cao. Cuối cùng, một bài thử thách sẽ kiểm tra mức độ hiểu của bạn bằng cách yêu cầu dựng lại ba công thức toán học nổi tiếng bằng các khái niệm đã học.

## Hướng dẫn

[Các hướng dẫn MathML](/en-US/docs/Web/MathML/Guides) là những tài nguyên giúp bạn soạn thảo MathML trên trang web của mình, bao gồm hướng dẫn về cách viết, trình biên tập, phông chữ và nhiều nội dung khác.

- [Soạn thảo MathML](/en-US/docs/Web/MathML/Guides/Authoring)
  - : Gợi ý và mẹo để viết MathML, bao gồm các trình biên tập MathML được đề xuất và cách tích hợp đầu ra của chúng vào nội dung Web.
- [Phông chữ cho MathML](/en-US/docs/Web/MathML/Guides/Fonts)
  - : Cách người dùng có thể cài đặt các phông chữ toán học như vậy để hiển thị MathML chính xác trong trình duyệt.

## Tài liệu tham khảo

[Tài liệu tham khảo MathML](/en-US/docs/Web/MathML/Reference) là danh sách đầy đủ các phần tử và thuộc tính MathML được MDN ghi nhận tài liệu.

- [Tài liệu tham khảo phần tử MathML](/en-US/docs/Web/MathML/Reference/Element)
  - : Chi tiết về từng phần tử MathML và thông tin tương thích cho trình duyệt trên máy tính để bàn và thiết bị di động.
- [Tài liệu tham khảo thuộc tính toàn cục của MathML](/en-US/docs/Web/MathML/Reference/Global_attributes)
  - : Thông tin về các thuộc tính MathML toàn cục có thể áp dụng cho mọi phần tử.
- [Tài liệu tham khảo thuộc tính MathML](/en-US/docs/Web/MathML/Reference/Attribute)
  - : Thông tin về các thuộc tính MathML thay đổi giao diện hoặc hành vi của phần tử.
- [Giá trị thuộc tính MathML](/en-US/docs/Web/MathML/Reference/Values)
  - : Thông tin bổ sung về các giá trị thuộc tính MathML.

## Ví dụ

Bên dưới là một số ví dụ bạn có thể xem để hiểu rõ hơn cách dùng MathML.

### Công thức MathML

Các bản minh họa sau hiển thị những khái niệm toán học trên Web với độ phức tạp tăng dần.

- [Chứng minh định lý Pythagoras](/en-US/docs/Web/MathML/Guides/Proving_the_Pythagorean_theorem)
  - : Ví dụ nhỏ minh họa cách chứng minh định lý Pythagoras.
- [Suy ra công thức nghiệm bậc hai](/en-US/docs/Web/MathML/Guides/Deriving_the_quadratic_formula)
  - : Trình bày các bước suy ra công thức nghiệm bậc hai.
- [Mozilla MathML test](https://fred-wang.github.io/MathFonts/mozilla_mathml_test/)
  - : Bài kiểm thử gốc từ dự án Mozilla MathML. Nó chứa các ví dụ từ [TeXbook](https://en.wikipedia.org/wiki/Computers_and_Typesetting) với ảnh tham chiếu được sinh bởi TeX.

### Các công nghệ Web khác

Các bản minh họa sau kết hợp MathML với những công nghệ Web khác để tạo ra nội dung nâng cao.

- [`<la-tex>` custom element](https://fred-wang.github.io/TeXZilla/examples/customElement.html)
  - : Một [custom element](/en-US/docs/Web/API/Web_components/Using_custom_elements) chấp nhận nội dung [LaTeX](https://en.wikipedia.org/wiki/LaTeX).
- [Minh họa từ trường](https://fred-wang.github.io/TeXZilla/examples/toImageWebGL.html)
  - : Biểu diễn 3D của từ trường, sử dụng [SVG](/en-US/docs/Web/SVG) và [WebGL](/en-US/docs/Web/API/WebGL_API).
- [Συνάρτηση ζήτα Ρήμαν (el)](https://fred-wang.github.io/MathFonts/%CE%A3%CF%85%CE%BD%CE%AC%CF%81%CF%84%CE%B7%CF%83%CE%B7_%CE%B6%CE%AE%CF%84%CE%B1_%CE%A1%CE%AE%CE%BC%CE%B1%CE%BD.html)
  - : Một bài viết bằng tiếng Hy Lạp về hàm zeta Riemann, sử dụng [Web fonts](/en-US/docs/Learn_web_development/Core/Text_styling/Web_fonts) từ [Greek Font Society](https://greekfontsociety-gfs.gr/).
- [Phương trình Pell](https://people.igalia.com/fwang/pell-bigint-mathml/)
  - : Chương trình JavaScript giải phương trình Pell bằng [`BigInt`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt).
- [Chương trình của Lovelace cho các số Bernoulli](https://people.igalia.com/fwang/lovelace-jsclass-mathml/)
  - : Trình giả lập chương trình của Ada Lovelace để tính các số Bernoulli, sử dụng [Private elements](/en-US/docs/Web/JavaScript/Reference/Classes/Private_elements).

## Nhận trợ giúp từ cộng đồng

- [W3C Math Home](https://www.w3.org/Math/)
- [Tạo issue trên kho GitHub w3c/mathml](https://github.com/w3c/mathml/issues)
- [Kho lưu trữ thư www-math của w3.org](https://lists.w3.org/Archives/Public/www-math/)

## Công cụ

- [W3C Validator](https://validator.w3.org/)
- [Trang wiki của W3C](https://www.w3.org/wiki/Math_Tools)

## Chủ đề liên quan

- [CSS](/en-US/docs/Web/CSS)
- [HTML](/en-US/docs/Web/HTML)
- [SVG](/en-US/docs/Web/SVG)

## Các đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
