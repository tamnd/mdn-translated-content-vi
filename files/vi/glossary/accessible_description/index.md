---
title: Accessible description
slug: Glossary/Accessible_description
page-type: glossary-definition
sidebar: glossarysidebar
---

**Mô tả có thể tiếp cận** (accessible description) là phần mô tả của một phần tử giao diện người dùng, cung cấp thông tin bổ sung để giúp người dùng công nghệ hỗ trợ hiểu phần tử giao diện và ngữ cảnh của nó. Nó được liên kết với một phần tử HTML hoặc SVG và cung cấp cho người dùng bối cảnh bổ sung về mục đích của phần tử, ngoài những gì được cung cấp bởi {{glossary("accessible name", "tên có thể tiếp cận")}} của phần tử. Điều này đặc biệt quan trọng đối với người dùng sử dụng công nghệ hỗ trợ như {{glossary("Screen_reader", "trình đọc màn hình")}}. Mô tả có thể tiếp cận của một phần tử là một phần của {{glossary("accessibility tree", "cây khả năng tiếp cận")}}.

Ví dụ, tên có thể tiếp cận của một phần tử {{htmlelement("table")}} được cung cấp bởi {{htmlelement("caption")}} đầu tiên của nó. Trong trường hợp bảng dữ liệu phức tạp, một hoặc hai câu mô tả bảng có thể cung cấp một mô tả. Đây có thể là một đoạn văn ngay trước hoặc sau bảng, cả về mặt trực quan và trong thứ tự nguồn. Nếu ở nơi khác theo thứ tự nguồn, hoặc để làm rõ sự liên kết, thuộc tính [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby) có thể được sử dụng để liên kết bảng với mô tả của nó.

Tương tự, khi người dùng được yêu cầu tạo mật khẩu, `<label>` cho phần tử {{htmlelement("input")}} kiểu `password` cung cấp tên có thể tiếp cận của nó. Một mô tả có thể tiếp cận tốt bao gồm các yêu cầu về mật khẩu theo cách hiển thị cho tất cả người dùng. Nó có thể được liên kết rõ ràng với input thông qua thuộc tính `aria-describedby`, điều này thêm nó vào cây khả năng tiếp cận như là phần 'description' cho nút đó.

Mô tả được rút gọn thành chuỗi văn bản. Trong ví dụ mật khẩu của chúng ta, nếu giá trị thuộc tính `aria-describedby` của input là `id` của một phần tử HTML {{htmlelement("ul")}} với danh sách các yêu cầu, thì mô tả là văn bản nối và các tương đương văn bản của tất cả các mục trong danh sách.

Bạn có thể kiểm tra mô tả có thể tiếp cận cho bất kỳ phần tử nào trên trang của mình: hãy xem tab khả năng tiếp cận trong công cụ developer của trình duyệt, cung cấp thông tin khả năng tiếp cận cho phần tử hiện đang được chọn.

## Tính toán mô tả có thể tiếp cận

Đối với các phần tử HTML, nếu một phần tử không có mô tả có thể tiếp cận, mô tả cần được liên kết theo cách lập trình với phần tử liên quan. Mô hình đối tượng khả năng tiếp cận (AOM) tính toán mô tả có thể tiếp cận bằng cách kiểm tra các tính năng này theo thứ tự, cho đến khi được xác định:

1. Thuộc tính [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby).

2. Thuộc tính [`aria-description`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-description).

3. Các tính năng dành riêng cho ngôn ngữ tham gia vào tính toán mô tả nếu tính năng đó chưa được sử dụng để định nghĩa {{glossary("accessible name", "tên có thể tiếp cận")}}. Ví dụ:
   - Một phần tử {{htmlelement("summary")}} được mô tả bởi nội dung của {{htmlelement("details")}} mà nó được lồng trong.
   - Các nút {{htmlelement("input")}} (với thuộc tính type là `button`, `submit` hoặc `reset`) được mô tả bởi giá trị thuộc tính `value` của chúng.
   - Trong SVG, nội dung của phần tử {{svgelement("desc")}}, nếu có, ngược lại là văn bản chứa trong các phần tử chứa văn bản con (tức là {{svgelement("text")}}), nếu chúng chưa được sử dụng cho {{glossary("accessible name", "tên có thể tiếp cận")}}

4. Nếu không có gì ở trên cung cấp mô tả, thuộc tính [`title`](/en-US/docs/Web/HTML/Reference/Global_attributes/title) được sử dụng, nếu `title` không phải là {{glossary("accessible name", "tên có thể tiếp cận")}} cho phần tử đó.

5. Nếu không có gì ở trên định nghĩa mô tả có thể tiếp cận, mô tả có thể tiếp cận sẽ trống.

Các bước để định nghĩa mô tả có thể tiếp cận trong HTML được xác định trong [HTML-AAM Accessible Description](https://w3c.github.io/html-aam/#accdesc-computation/). Mô tả có thể tiếp cận cho các phần tử SVG tuân theo các bước tương tự với một số khác biệt nhỏ được liệt kê tại [SVG-AAM Accessible Description](https://w3c.github.io/svg-aam/#mapping_additional_nd/)).

## Xem thêm

- [Accessible Name and Description Computation 1.2 (accname)](https://w3c.github.io/accname/#mapping_additional_nd_description)
- [Accessibility](/en-US/docs/Web/Accessibility)
- [Học về khả năng tiếp cận](/en-US/docs/Learn_web_development/Core/Accessibility)
- [Khả năng tiếp cận web](https://en.wikipedia.org/wiki/Web_accessibility) trên Wikipedia
- [Web Accessibility In Mind](https://webaim.org/)
- [ARIA](/en-US/docs/Web/Accessibility/ARIA)
- [W3C Web Accessibility Initiative (WAI)](https://www.w3.org/WAI/)
- [Accessible Rich Internet Applications (WAI-ARIA)](https://w3c.github.io/aria/)
- Các thuật ngữ liên quan:
  - {{Glossary("Accessibility")}}
  - {{Glossary("Accessibility tree")}}
  - {{Glossary("Accessible name")}}
  - {{Glossary("ARIA")}}
