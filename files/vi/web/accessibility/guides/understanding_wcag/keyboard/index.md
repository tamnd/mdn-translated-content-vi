---
title: Có thể truy cập bằng bàn phím
slug: Web/Accessibility/Guides/Understanding_WCAG/Keyboard
page-type: guide
sidebar: accessibilitysidebar
---

Để thật sự có trợ năng đầy đủ, một trang web phải có thể được vận hành bởi người chỉ dùng bàn phím để truy cập và điều khiển nó. Điều này bao gồm người dùng bộ đọc màn hình, nhưng cũng có thể gồm những người gặp khó khăn khi dùng thiết bị trỏ như chuột hoặc trackball, hoặc khi chuột không hoạt động tại thời điểm đó, hoặc những người thích dùng bàn phím để nhập liệu bất cứ khi nào có thể.

## Phần tử có thể focus nên có ngữ nghĩa tương tác

Nếu một phần tử có thể được focus bằng bàn phím, thì nó nên là phần tử tương tác; tức là người dùng phải có thể làm điều gì đó với nó và tạo ra một thay đổi nào đó (ví dụ, kích hoạt một liên kết hoặc thay đổi một tùy chọn).

> [!NOTE]
> Một ngoại lệ quan trọng đối với quy tắc này là khi phần tử được áp dụng `role="document"` **bên trong** một ngữ cảnh tương tác (như `role="application"`). Trong trường hợp đó, focus vào tài liệu lồng bên trong là cách duy nhất để đưa công nghệ hỗ trợ trở lại trạng thái không tương tác (thường gọi là "browse mode").

Hầu hết các phần tử tương tác đều có thể focus theo mặc định; bạn có thể làm một phần tử có thể focus bằng cách thêm giá trị thuộc tính `tabindex=0` vào nó. Tuy nhiên, bạn chỉ nên thêm `tabindex` nếu bạn cũng đã làm cho phần tử đó trở nên tương tác, chẳng hạn bằng cách định nghĩa các trình xử lý sự kiện bàn phím phù hợp.

### Xem thêm

- Thuộc tính HTML toàn cục [tabindex](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex)
- Element: [keydown event](/en-US/docs/Web/API/Element/keydown_event)
- Element: [keyup event](/en-US/docs/Web/API/Element/keyup_event)

## Tránh dùng thuộc tính `tabindex` lớn hơn 0

Thuộc tính `tabindex` cho biết một phần tử có thể được focus bằng bàn phím. Giá trị bằng 0 cho biết phần tử nằm trong thứ tự focus mặc định, dựa trên thứ tự của các phần tử trong tài liệu HTML. Giá trị dương đưa phần tử lên trước các phần tử trong thứ tự mặc định; các phần tử có giá trị dương sẽ được focus theo thứ tự giá trị `tabindex` của chúng (1, rồi 2, rồi 3, v.v.).

Điều này gây nhầm lẫn cho người chỉ dùng bàn phím khi thứ tự focus khác với thứ tự logic của trang. Cách tốt hơn là tổ chức tài liệu HTML sao cho các phần tử có thể focus nằm trong một thứ tự logic, không cần sắp xếp lại bằng các giá trị `tabindex` dương.

### Xem thêm

- Thuộc tính HTML toàn cục [tabindex](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex)
- [Understanding focus order](https://www.w3.org/WAI/WCAG21/Understanding/focus-order.html)
- [Don't use tabindex greater than 0](https://adrianroselli.com/2014/11/dont-use-tabindex-greater-than-0.html)

## Phần tử có thể nhấp phải có thể focus và nên có ngữ nghĩa tương tác

Nếu một phần tử có thể được nhấp bằng thiết bị trỏ như chuột, thì nó cũng nên có thể focus bằng bàn phím, và người dùng phải có thể làm điều gì đó bằng cách tương tác với nó.

Một phần tử được xem là có thể nhấp nếu nó có trình xử lý sự kiện `onclick` được định nghĩa. Bạn có thể làm nó có thể focus bằng cách thêm giá trị thuộc tính `tabindex=0` vào nó. Bạn có thể làm nó có thể thao tác bằng bàn phím bằng cách định nghĩa trình xử lý sự kiện `onkeydown`; trong hầu hết các trường hợp, hành động do trình xử lý sự kiện thực hiện nên giống nhau cho cả hai kiểu sự kiện.

### Xem thêm

- Thuộc tính HTML toàn cục [tabindex](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex)
- Element: [keydown event](/en-US/docs/Web/API/Element/keydown_event)
- Element: [keyup event](/en-US/docs/Web/API/Element/keyup_event)

## Phần tử tương tác phải có thể kích hoạt bằng bàn phím

Nếu người dùng có thể tương tác với một phần tử bằng chạm hoặc thiết bị trỏ, thì phần tử đó cũng nên hỗ trợ tương tác bằng bàn phím. Nghĩa là nếu bạn đã định nghĩa trình xử lý sự kiện cho các sự kiện touch hoặc click, bạn cũng nên định nghĩa chúng cho các sự kiện bàn phím. Các trình xử lý sự kiện bàn phím nên cho phép thực hiện về cơ bản cùng một tương tác như các trình xử lý touch hoặc click.

### Xem thêm

- Element: [keydown event](/en-US/docs/Web/API/Element/keydown_event)
- Element: [keyup event](/en-US/docs/Web/API/Element/keyup_event)

## Phần tử tương tác phải có thể focus

Nếu người dùng có thể tương tác với một phần tử (ví dụ bằng chạm hoặc thiết bị trỏ), thì nó cũng nên có thể focus bằng bàn phím. Bạn có thể làm nó có thể focus bằng cách thêm giá trị thuộc tính `tabindex=0` vào nó. Điều đó sẽ thêm phần tử vào danh sách các phần tử có thể được focus bằng cách nhấn phím <kbd>Tab</kbd>, theo thứ tự của các phần tử như được định nghĩa trong tài liệu HTML.

### Xem thêm

- Thuộc tính HTML toàn cục [tabindex](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex)

## Phần tử có thể focus phải có kiểu focus

Bất kỳ phần tử nào có thể nhận focus từ bàn phím đều nên có kiểu hiển thị rõ ràng để cho biết khi phần tử được focus. Bạn có thể làm điều này bằng các pseudo-class CSS {{cssxref(":focus")}} và {{cssxref(":focus-visible")}}.

Các phần tử có thể focus tiêu chuẩn như liên kết và trường nhập liệu đã được trình duyệt tạo kiểu đặc biệt theo mặc định, nên bạn có thể không cần chỉ định kiểu focus cho chúng, trừ khi bạn muốn kiểu focus nổi bật hơn.

Nếu bạn tạo các thành phần có thể focus của riêng mình, hãy bảo đảm bạn cũng định nghĩa kiểu focus cho chúng.

### Xem thêm

- [Using CSS to change the presentation of a UI component when it receives focus](https://www.w3.org/WAI/WCAG21/Techniques/css/C15.html)
