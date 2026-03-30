---
title: Tên khả năng tiếp cận
slug: Glossary/Accessible_name
page-type: glossary-definition
sidebar: glossarysidebar
---

**Tên khả năng tiếp cận** (accessible name) là tên của một phần tử giao diện người dùng; đó là văn bản được liên kết với một phần tử HTML cung cấp nhãn cho phần tử đó đến người dùng công nghệ hỗ trợ.

Tên khả năng tiếp cận truyền đạt mục đích hoặc ý định của phần tử. Điều này giúp người dùng hiểu phần tử dùng để làm gì và cách họ có thể tương tác với nó. Nhìn chung, tên khả năng tiếp cận cho các phần tử nên là duy nhất trên một trang. Điều này giúp người dùng phân biệt một phần tử với các phần tử khác và giúp người dùng xác định phần tử họ muốn tương tác.

Tùy thuộc vào phần tử và markup HTML, giá trị của tên khả năng tiếp cận có thể được lấy từ nội dung hiển thị (ví dụ: văn bản trong {{HTMLElement("figcaption")}}) hoặc nội dung ẩn (ví dụ: thuộc tính `aria-label` được đặt trên một phần tử), hoặc kết hợp cả hai. Cách xác định tên khả năng tiếp cận của phần tử dựa trên [tính toán tên khả năng tiếp cận](https://www.w3.org/WAI/ARIA/apg/practices/names-and-descriptions/#name_calculation), khác nhau đối với các phần tử khác nhau.

Tốt nhất nên sử dụng văn bản hiển thị làm tên khả năng tiếp cận. Nhiều phần tử, bao gồm {{HTMLElement("a")}}, {{HTMLElement("td")}} và {{HTMLElement("button")}}, có thể lấy tên khả năng tiếp cận từ nội dung của chúng. Ví dụ, với `<a href="foo.html">Bar</a>`, tên khả năng tiếp cận của siêu liên kết này là "Bar."

Các phần tử khác lấy tên khả năng tiếp cận từ nội dung của các phần tử liên kết. Ví dụ, khi một phần tử {{HTMLElement("fieldset")}} hoặc {{HTMLElement("table")}} chứa phần tử {{HTMLElement("legend")}} hoặc {{HTMLElement("caption")}} con tương ứng, việc liên kết của phần tử lồng nhau cung cấp tên khả năng tiếp cận cho phần tử cha là tự động. Đối với các phần tử form như {{HTMLElement("textarea")}} và {{HTMLElement("input")}}, tên khả năng tiếp cận đến từ phần tử {{HTMLElement("label")}} liên kết. Sự liên kết cần được xác định rõ ràng bằng cách đặt thuộc tính `for` trong phần tử `<label>` khớp với `id` của phần tử form. Ngoài ra, một liên kết ngầm được tạo khi điều khiển form được lồng trực tiếp trong phần tử `<label>`.

Đối với một số phần tử, tên khả năng tiếp cận đến từ các thuộc tính của phần tử; ví dụ, thuộc tính `alt` trong trường hợp {{HTMLElement("img")}}. Với `<img src="grape.jpg" alt="banana"/>`, tên khả năng tiếp cận của hình ảnh là "banana."

Để tạo liên kết giữa nội dung hiển thị và một phần tử hoặc nhiều nút văn bản và một phần tử, có thể sử dụng thuộc tính [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby). Nếu không có văn bản hiển thị để liên kết với một phần tử giao diện người dùng cần có tên khả năng tiếp cận, có thể sử dụng thuộc tính [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label). Không nên thêm tên vào các phần tử đánh dấu văn bản nội tuyến như {{HTMLElement("code")}}, {{HTMLElement("del")}} và {{HTMLElement("mark")}}.

Nhiều phần tử, chẳng hạn như các phần của nội dung văn bản, không cần tên khả năng tiếp cận. Tất cả các điều khiển nên có tên khả năng tiếp cận. Tất cả các hình ảnh truyền tải thông tin và không thuần túy là trình bày cũng vậy.

Các công nghệ hỗ trợ cung cấp cho người dùng thuộc tính tên khả năng tiếp cận, bao gồm tên khả năng tiếp cận cùng với vai trò của phần tử. Mặc dù nhiều phần tử không cần tên khả năng tiếp cận, nhưng cần cung cấp tên khả năng tiếp cận để ghi đè hoặc bổ sung nội dung của các phần tử với [vai trò](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles) được chỉ định. Ví dụ, [`tabpanel`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tabpanel_role) là phần nội dung xuất hiện sau khi người dùng kích hoạt phần tử liên kết có vai trò [`tab`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role). Vai trò này có thể được đặt trên một phần tử không cần tên, như phần tử {{HTMLElement("div")}}. `tab` là điều khiển và phải có tên khả năng tiếp cận. `tabpanel` là con (phần nội dung) của `tab`. Thêm `aria-labelledby` vào `tabpanel` là thực hành tốt nhất.

## Xem thêm

- [Vai trò ARIA](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles)
- [Thuộc tính ARIA](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes)
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
  - {{Glossary("Accessible description")}}
  - {{Glossary("ARIA")}}
