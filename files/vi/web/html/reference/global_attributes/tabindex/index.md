---
title: HTML tabindex global attribute
short-title: tabindex
slug: Web/HTML/Reference/Global_attributes/tabindex
page-type: html-attribute
browser-compat: html.global_attributes.tabindex
sidebar: htmlsidebar
---

Thuộc tính [toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes) **`tabindex`** cho phép các nhà phát triển làm cho các phần tử HTML có thể được focus, cho phép hoặc ngăn chúng được focus theo thứ tự tuần tự (thường là bằng phím <kbd>Tab</kbd>, do đó có tên này) và xác định thứ tự tương đối của chúng trong điều hướng focus tuần tự.

{{InteractiveExample("HTML Demo: tabindex", "tabbed-standard")}}

```html interactive-example
<p>Click anywhere in this pane, then try tabbing through the elements.</p>

<label>First in tab order:<input type="text" /></label>

<div tabindex="0">Tabbable due to tabindex.</div>

<div>Not tabbable: no tabindex.</div>

<label>Third in tab order:<input type="text" /></label>
```

```css interactive-example
p {
  font-style: italic;
  font-weight: bold;
}

div,
label {
  display: block;
  letter-spacing: 0.5px;
  margin-bottom: 1rem;
}

div:focus {
  font-weight: bold;
}
```

Thuộc tính nhận một số nguyên làm giá trị, với các kết quả khác nhau tùy thuộc vào giá trị của số nguyên:

> [!NOTE]
> Nếu một phần tử HTML được render và có thuộc tính `tabindex` với bất kỳ giá trị số nguyên hợp lệ nào, phần tử đó có thể được focus bằng JavaScript (bằng cách gọi phương thức [`focus()`](/en-US/docs/Web/API/HTMLElement/focus)) hoặc trực quan bằng cách nhấp chuột. Giá trị `tabindex` cụ thể kiểm soát xem phần tử có thể được `tabbable` hay không (tức là có thể tiếp cận thông qua điều hướng bàn phím tuần tự, thường là bằng phím <kbd>Tab</kbd>).

- _Giá trị âm_ (giá trị âm cụ thể thực sự không quan trọng, thường là `tabindex="-1"`) có nghĩa là phần tử không thể tiếp cận được thông qua điều hướng bàn phím tuần tự.

  > [!NOTE]
  > `tabindex="-1"` có thể hữu ích cho các phần tử không nên được điều hướng trực tiếp bằng phím <kbd>Tab</kbd>, nhưng cần có focus bàn phím được đặt cho chúng. Ví dụ bao gồm cửa sổ modal ngoài màn hình cần được focus khi xuất hiện, hoặc thông báo lỗi gửi biểu mẫu cần được focus ngay khi biểu mẫu lỗi được gửi.

- `tabindex="0"` có nghĩa là phần tử nên có thể focus trong điều hướng bàn phím tuần tự, sau các giá trị `tabindex` dương. Thứ tự điều hướng focus của các phần tử này được xác định theo thứ tự trong mã nguồn tài liệu.
- _Giá trị dương_ có nghĩa là phần tử nên có thể focus trong điều hướng bàn phím tuần tự, với thứ tự được xác định bởi giá trị của số. Nghĩa là `tabindex="4"` được focus trước `tabindex="5"` và `tabindex="0"`, nhưng sau `tabindex="3"`. Nếu nhiều phần tử có cùng giá trị `tabindex` dương, thứ tự tương đối của chúng theo vị trí trong mã nguồn tài liệu. Giá trị tối đa cho `tabindex` là 32767.
- Nếu thuộc tính `tabindex` được bao gồm mà không có giá trị, thì việc phần tử có thể focus hay không được xác định bởi tác nhân người dùng.

  > [!WARNING]
  > Bạn chỉ nên sử dụng `0` và `-1` làm giá trị `tabindex`. Tránh sử dụng giá trị `tabindex` lớn hơn `0` và các thuộc tính CSS có thể thay đổi thứ tự của các phần tử HTML có thể focus ([Sắp xếp các flex item](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Ordering_items)). Làm như vậy sẽ khó khăn cho những người dùng dựa vào bàn phím để điều hướng hoặc công nghệ hỗ trợ trong việc điều hướng và vận hành nội dung trang. Thay vào đó, hãy viết tài liệu với các phần tử theo thứ tự logic.

Một số phần tử HTML có thể focus có giá trị `tabindex` mặc định là `0` được đặt bởi [tác nhân người dùng](/en-US/docs/Glossary/User_agent). Các phần tử này là {{HTMLElement("a")}} hoặc {{HTMLElement("area")}} với thuộc tính `href`, {{HTMLElement("button")}}, {{HTMLElement("frame")}} {{deprecated_inline}}, {{HTMLElement("iframe")}}, {{HTMLElement("input")}}, {{HTMLElement("object")}}, {{HTMLElement("select")}}, {{HTMLElement("textarea")}}, và phần tử SVG {{SVGElement("a")}}, hoặc phần tử {{HTMLElement("summary")}} cung cấp tóm tắt cho phần tử {{HTMLElement("details")}}. Các nhà phát triển không nên thêm thuộc tính `tabindex` vào các phần tử này trừ khi nó thay đổi hành vi mặc định (ví dụ: bao gồm giá trị âm sẽ xóa phần tử khỏi thứ tự điều hướng focus).

> [!WARNING]
> Thuộc tính tabindex không được sử dụng trên phần tử {{HTMLElement("dialog")}}.

## Vấn đề về khả năng tiếp cận

Tránh sử dụng thuộc tính `tabindex` kết hợp với [nội dung không tương tác](/en-US/docs/Web/HTML/Guides/Content_categories#interactive_content) để làm cho thứ gì đó được thiết kế để tương tác có thể focus bằng bàn phím. Một ví dụ là sử dụng phần tử {{HTMLElement("div")}} để mô tả một nút, thay vì sử dụng phần tử {{HTMLElement("button")}}.

Các thành phần tương tác được tạo bằng các phần tử không tương tác không được liệt kê trong [cây khả năng tiếp cận](/en-US/docs/Learn_web_development/Core/Accessibility/What_is_accessibility#accessibility_apis). Điều này ngăn công nghệ hỗ trợ điều hướng đến và thao tác với các thành phần đó. Nội dung nên được mô tả theo ngữ nghĩa bằng cách sử dụng các phần tử tương tác ({{HTMLElement("a")}}, {{HTMLElement("button")}}, {{HTMLElement("details")}}, {{HTMLElement("input")}}, {{HTMLElement("select")}}, {{HTMLElement("textarea")}}, v.v.) thay thế. Các phần tử này có các vai trò và trạng thái tích hợp sẵn để truyền đạt trạng thái đến khả năng tiếp cận mà nếu không sẽ phải được quản lý bởi [ARIA](/en-US/docs/Web/Accessibility/ARIA).

- [Using the tabindex attribute | Vispero](https://vispero.com/resources/using-the-tabindex-attribute/)

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Tất cả [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes)
- {{domxref("HTMLElement.tabIndex")}} phản ánh thuộc tính này
- Vấn đề khả năng tiếp cận với `tabindex`: xem [Don't Use Tabindex Greater than 0](https://adrianroselli.com/2014/11/dont-use-tabindex-greater-than-0.html) của Adrian Roselli
- {{glossary("Reading order")}}
