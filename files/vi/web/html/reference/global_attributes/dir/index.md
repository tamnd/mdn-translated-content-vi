---
title: Thuộc tính toàn cục HTML dir
short-title: dir
slug: Web/HTML/Reference/Global_attributes/dir
page-type: html-attribute
browser-compat: html.global_attributes.dir
sidebar: htmlsidebar
---

Thuộc tính toàn cục **`dir`** [global attribute](/en-US/docs/Web/HTML/Reference/Global_attributes) là thuộc tính [enumerated](/en-US/docs/Glossary/Enumerated) cho biết hướng của văn bản trong phần tử.

{{InteractiveExample("HTML Demo: dir", "tabbed-standard")}}

```html interactive-example
<p dir="rtl">
  This paragraph is in English but incorrectly goes right to left.
</p>
<p dir="ltr">This paragraph is in English and correctly goes left to right.</p>

<hr />

<p>هذه الفقرة باللغة العربية ولكن بشكل خاطئ من اليسار إلى اليمين.</p>
<p dir="auto">
  هذه الفقرة باللغة العربية ، لذا يجب الانتقال من اليمين إلى اليسار.
</p>
```

Nó có thể có các giá trị sau:

- `ltr`, có nghĩa là _từ trái sang phải_ và được dùng cho các ngôn ngữ được viết từ trái sang phải (như tiếng Anh);
- `rtl`, có nghĩa là _từ phải sang trái_ và được dùng cho các ngôn ngữ được viết từ phải sang trái (như tiếng Ả Rập);
- `auto`, để user agent tự quyết định. Nó dùng thuật toán cơ bản khi phân tích cú pháp các ký tự bên trong phần tử cho đến khi tìm thấy ký tự có hướng mạnh, sau đó áp dụng hướng đó cho toàn bộ phần tử.

> [!NOTE]
> Giá trị `auto` nên được dùng cho dữ liệu có hướng không xác định, như dữ liệu đến từ đầu vào người dùng hoặc dữ liệu bên ngoài.

Nếu không được chỉ định, giá trị được [kế thừa](#inheritance) từ phần tử cha.

Thuộc tính này có thể bị ghi đè bởi các thuộc tính CSS {{ cssxref("direction") }} và {{ cssxref("unicode-bidi") }}, nếu một trang CSS đang hoạt động và phần tử hỗ trợ các thuộc tính này.

Vì hướng của văn bản có liên quan ngữ nghĩa với nội dung của nó chứ không phải với cách trình bày của nó, khuyến nghị các nhà phát triển web dùng thuộc tính này thay vì các thuộc tính CSS liên quan khi có thể. Theo cách đó, văn bản sẽ hiển thị chính xác ngay cả trên trình duyệt không hỗ trợ CSS hoặc có CSS bị tắt.

## Kế thừa

Nếu một phần tử không có thuộc tính `dir`, nó sẽ kế thừa giá trị `dir` được đặt trên [node cha](/en-US/docs/Glossary/Node/DOM) của nó, mà lần lượt có thể kế thừa từ cha của nó, v.v.

## Ghi chú sử dụng

Một hình ảnh có thể có thuộc tính `dir` được đặt thành `"rtl"` trong đó các thuộc tính HTML `title` và `alt` sẽ được định dạng và xác định là `"rtl"`.

Khi bảng có `dir` được đặt thành `"rtl"`, thứ tự cột được sắp xếp từ phải sang trái.

Thuộc tính này là bắt buộc đối với phần tử {{ HTMLElement("bdo") }} nơi nó có ý nghĩa ngữ nghĩa khác.

Thuộc tính này _không_ được kế thừa bởi phần tử {{ HTMLElement("bdi") }}. Nếu không được đặt, giá trị của nó là `auto`.

Các trình duyệt có thể cho phép người dùng thay đổi hướng của các phần tử {{ HTMLElement("input") }} và {{ HTMLElement("textarea") }} để hỗ trợ việc tạo nội dung.
Chrome và Safari cung cấp tùy chọn hướng trong menu ngữ cảnh của các trường input.
Firefox dùng <kbd>Ctrl</kbd> (Windows)/<kbd>Cmd</kbd> (macOS) + <kbd>Shift</kbd> + <kbd>X</kbd> bên trong `<textarea>` để chuyển đổi hướng văn bản.
Các tính năng này chuyển đổi giá trị thuộc tính `dir` giữa `ltr` và `rtl`.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Tất cả [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).
- {{domxref("HTMLElement.dir")}} phản ánh thuộc tính này.
- [Handling different text directions](/en-US/docs/Learn_web_development/Core/Styling_basics/Handling_different_text_directions)
