---
title: CSS selector structure
short-title: Selector structure
slug: Web/CSS/Guides/Selectors/Selector_structure
page-type: guide
spec-urls: https://drafts.csswg.org/selectors/
sidebar: cssref
---

CSS selector đại diện cho một mẫu cụ thể của các phần tử trong cấu trúc cây. Thuật ngữ "selector" có thể chỉ đến [simple selector](#simple_selector), [compound selector](#compound_selector) hoặc [complex selector](#complex_selector). Khi được đưa vào pseudo-class `:has()` dưới dạng tham số, các selector này được gọi là [relative selector](#relative_selector), đại diện cho các phần tử tương đối so với một hoặc nhiều phần tử neo.

Các selector này có thể được kết hợp thành một [selector list](#selector_list) phân cách bằng dấu phẩy. Nếu bất kỳ selector nào trong danh sách [non-forgiving selector](/en-US/docs/Web/CSS/Reference/Selectors/Selector_list#valid_and_invalid_selector_lists) không hợp lệ, toàn bộ selector list sẽ bị vô hiệu hóa.

## Simple selector

**Simple selector** là selector chỉ có một thành phần duy nhất, chẳng hạn như một type selector, attribute selector hoặc pseudo-class đơn lẻ, không được kết hợp với bất kỳ thành phần selector hoặc combinator nào khác. Một phần tử được cho là khớp với simple selector khi simple selector đó mô tả chính xác phần tử đó. Bất kỳ selector nào chỉ chứa một [basic selector](/en-US/docs/Web/CSS/Guides/Selectors/Selectors_and_combinators#basic_selectors), [attribute selector](/en-US/docs/Web/CSS/Reference/Selectors/Attribute_selectors), [pseudo-class](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) hoặc [pseudo-element](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements) đều là simple selector.

```css
#myId {
}

[pattern*="\d"] {
}
```

## Compound selector

**Compound selector** là một chuỗi các [simple selector](#simple_selector) không được phân cách bởi [combinator](/en-US/docs/Web/CSS/Guides/Selectors/Selectors_and_combinators#combinators). Compound selector đại diện cho tập hợp các điều kiện đồng thời trên một phần tử duy nhất. Một phần tử được cho là khớp với compound selector khi phần tử đó khớp với tất cả các simple selector trong compound selector đó.

```css
a#selected {
}

[type="checkbox"]:checked:focus {
}
```

Trong compound selector, [type selector](/en-US/docs/Web/CSS/Reference/Selectors/Type_selectors) hoặc [universal selector](/en-US/docs/Web/CSS/Reference/Selectors/Universal_selectors) phải đứng đầu tiên trong chuỗi selector. Chỉ được phép có một type selector hoặc universal selector trong chuỗi. Vì khoảng trắng đại diện cho [descendant combinator](/en-US/docs/Web/CSS/Reference/Selectors/Descendant_combinator), nên không được có khoảng trắng giữa các simple selector tạo nên compound selector.

## Complex selector

**Complex selector** là một chuỗi gồm một hoặc nhiều simple và/hoặc compound selector được phân cách bởi combinator, bao gồm cả khoảng trắng là [descendant combinator](/en-US/docs/Web/CSS/Reference/Selectors/Descendant_combinator).

Complex selector đại diện cho tập hợp các điều kiện đồng thời trên một tập hợp phần tử.

```css
a#selected > .icon {
}

.box h2 + p {
}
```

Có thể đọc selector từ phải sang trái. Ví dụ, `a#selected > .icon` khớp với tất cả phần tử có class là `icon` và là con trực tiếp của phần tử `<a>` có id là `selected`. Selector `.box h2 + p` khớp với phần tử `<p>` đầu tiên xuất hiện ngay sau bất kỳ phần tử `<h2>` nào là hậu duệ của phần tử có class là `box`.

## Selector list

[**Selector list**](/en-US/docs/Web/CSS/Reference/Selectors/Selector_list) là danh sách phân cách bằng dấu phẩy của các simple, compound và/hoặc complex selector. Một phần tử được cho là khớp với selector list khi phần tử đó khớp với bất kỳ (ít nhất một) selector nào trong danh sách.

```css
#main,
article.heading {
}
```

Nếu bất kỳ selector nào trong danh sách [non-forgiving selector](/en-US/docs/Web/CSS/Reference/Selectors/Selector_list#valid_and_invalid_selector_lists) không hợp lệ, toàn bộ selector list sẽ bị vô hiệu hóa.

```css
#main,
:bad-pseudoclass,
.validClass {
  /* `:bad-pseudoclass` is invalid, invalidating this style block */
}
```

Pseudo-class {{cssxref(":is()")}} và {{cssxref(":where()")}} có thể được dùng để tạo [forgiving selector list](/en-US/docs/Web/CSS/Reference/Selectors/Selector_list#forgiving_selector_list).

## Relative selector

**Relative selector** là selector đại diện cho một phần tử tương đối so với một hoặc nhiều phần tử neo đứng trước combinator. Relative selector không bắt đầu bằng combinator tường minh sẽ có [descendant combinator](/en-US/docs/Web/CSS/Reference/Selectors/Descendant_combinator) ngầm định.

Relative selector không thể dùng trong selector list. Thay vào đó, nó được chấp nhận trong một số ngữ cảnh nhất định, chẳng hạn như pseudo-class {{cssxref(":has()")}}.

```css
:has(+ div#topic > #reference) {
}

:has(> .icon) {
}

dt:has(+ img) ~ dd {
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [CSS selectors and combinators](/en-US/docs/Web/CSS/Guides/Selectors/Selectors_and_combinators)
- [Forgiving selector list](/en-US/docs/Web/CSS/Reference/Selectors/Selector_list#forgiving_selector_list)
- {{DOMXref("Document.querySelector()")}}
- {{DOMXref("Document.querySelectorAll()")}}
- [CSS selectors](/en-US/docs/Web/CSS/Guides/Selectors) module
- [CSS pseudo-elements](/en-US/docs/Web/CSS/Guides/Pseudo-elements) module
