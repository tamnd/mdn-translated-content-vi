---
title: "ARIA: thuộc tính aria-roledescription"
short-title: aria-roledescription
slug: Web/Accessibility/ARIA/Reference/Attributes/aria-roledescription
page-type: aria-attribute
spec-urls: https://w3c.github.io/aria/#aria-roledescription
sidebar: accessibilitysidebar
---

Thuộc tính `aria-roledescription` định nghĩa một mô tả thân thiện với con người, được tác giả bản địa hóa, cho vai trò của một phần tử.

## Mô tả

Một số công nghệ hỗ trợ (<abbr>AT</abbr>), chẳng hạn như bộ đọc màn hình, trình bày vai trò của một phần tử như một phần của trải nghiệm người dùng. Thuộc tính `aria-roledescription` cung cấp cách xác định một tên thân thiện với con người khác để AT trình bày như vai trò của phần tử.

> [!NOTE]
> Chỉ dùng aria-roledescription để làm rõ mục đích của các vai trò vùng chứa không tương tác và để cung cấp mô tả cụ thể hơn cho một widget.

Người dùng dựa vào việc trình bày tên vai trò quen thuộc để hiểu mục đích của phần tử và, nếu đó là một widget, cách tương tác với nó. Vì vậy, chỉ nên dùng `aria-roledescription` để làm rõ mục đích của các vai trò vùng chứa không tương tác như `group` hoặc `region`, và để cung cấp mô tả cụ thể hơn cho một widget.

Thuộc tính `aria-roledescription` ghi đè cách AT bản địa hóa và diễn đạt tên của một vai trò. Khi bạn ghi đè một tên vai trò mà người dùng đã hiểu, điều đó có thể làm giảm khả năng của họ trong việc hiểu và tương tác với phần tử.

Hãy tránh dùng thuộc tính `aria-roledescription`. Khi có một trường hợp sử dụng có vẻ đặc biệt và xứng đáng với một roledescription riêng, các tương tác thường có thể được chia nhỏ thành các phần nhỏ hơn có vai trò phù hợp.

Khi không có vai trò widget ngữ nghĩa hoặc ARIA nào khớp với mô hình tương tác của widget của bạn, hãy dùng `role="application"`, cung cấp `aria-roledescription` với tên vai trò tùy chỉnh, thân thiện với con người và được tác giả bản địa hóa, rồi dùng `aria-describedby` để cung cấp hướng dẫn cho người dùng.

AT có thể tùy chỉnh và bản địa hóa tên của các vai trò ARIA. Nếu bạn đang dùng `aria-roledescription` để thay đổi cách tên vai trò được trình bày cho người dùng, hãy nhớ xử lý phần bản địa hóa. Giá trị nên được dịch khi trang được bản địa hóa.

Việc thay đổi cách vai trò được trình bày cho người dùng không ảnh hưởng đến chức năng của phần tử. Ví dụ, nếu một phần tử có vai trò [`region`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/region_role) hoặc [`button`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/button_role), khi AT cung cấp các chức năng để điều hướng đến region hoặc button tiếp theo, nếu bạn đặt `aria-roledescription` thành `continent` và `escape` tương ứng, AT vẫn sẽ cho phép các chức năng đó điều hướng đến region và button.

Một lần nữa, hãy tránh dùng `aria-roledescription`. Trong ví dụ này, `escape` không mang ý nghĩa liên quan nào với người dùng, nhưng `button` với nhãn "escape" thì có.

Khi dùng `aria-roledescription`, hãy bảo đảm phần tử được áp dụng có một [`role`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles) ARIA hợp lệ hoặc có ngữ nghĩa vai trò ngầm định, và bản thân giá trị không rỗng cũng không chỉ chứa khoảng trắng.

`aria-roledescription` là bắt buộc khi dùng `aria-brailleroledescription`. Lưu ý rằng nhìn chung, `aria-brailleroledescription` chỉ nên được dùng trong những trường hợp hiếm khi một `aria-roledescription` quá dài dòng khi hiển thị trên Braille.

## Ví dụ

Ví dụ sau cho thấy cách dùng `aria-roledescription` để chỉ ra rằng một vùng chứa không tương tác là một "slide" trong một ứng dụng thuyết trình web.

```html
<div
  role="article"
  aria-roledescription="slide"
  id="slide"
  aria-labelledby="slideheading">
  <h1 id="slideheading">Quarterly Report</h1>
  <!-- remaining slide contents -->
</div>
```

Trong các ví dụ trước, người dùng bộ đọc màn hình có thể nghe "Quarterly Report, slide" thay vì "Quarterly Report, article" ít chính xác hơn.

## Giá trị

- `<string>`
  - : Một chuỗi không rỗng, thuộc kiểu giá trị không bị ràng buộc, và chứa nhiều hơn chỉ khoảng trắng.

## Giao diện liên quan

- {{domxref("Element.ariaRoleDescription")}}
  - : Thuộc tính [`ariaRoleDescription`](/en-US/docs/Web/API/Element/ariaRoleDescription), thuộc giao diện {{domxref("Element")}}, phản ánh giá trị của thuộc tính `aria-roledescription`.
- {{domxref("ElementInternals.ariaRoleDescription")}}
  - : Thuộc tính [`ariaRoleDescription`](/en-US/docs/Web/API/ElementInternals/ariaRoleDescription), thuộc giao diện {{domxref("ElementInternals")}}, phản ánh giá trị của thuộc tính `aria-roledescription`.

## Vai trò liên quan

Được hỗ trợ bởi tất cả các vai trò và tất cả các phần tử markup cơ sở, ngoại trừ `role="generic"`.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [Vai trò ARIA](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles)
