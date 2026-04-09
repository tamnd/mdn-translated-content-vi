---
title: "ARIA: vai trò math"
short-title: math
slug: Web/Accessibility/ARIA/Reference/Roles/math_role
page-type: aria-role
spec-urls: https://w3c.github.io/aria/#math
sidebar: accessibilitysidebar
---

Vai trò `math` cho biết nội dung biểu diễn một biểu thức toán học.

## Mô tả

Nội dung mang vai trò `math` nên được đánh dấu bằng một định dạng có thể truy cập được như [MathML](/en-US/docs/Web/MathML), hoặc bằng một dạng biểu diễn văn bản khác, để trình duyệt hoặc một thư viện polyfill có thể chuyển đổi sang định dạng có thể truy cập được.

Rất tiếc là hỗ trợ của trình duyệt đối với MathML không đồng đều. Mặc dù việc dùng hình ảnh của một biểu thức toán học không phải là tối ưu, nếu bạn vẫn dùng ảnh thì hãy dùng vai trò `math`.
Đảm bảo mọi hình ảnh toán học đều được gắn nhãn bởi thuộc tính `alt` mô tả biểu thức toán học như cách nó sẽ được đọc thành tiếng.

Nếu phần tử toán chỉ có các phần tử con mang tính trình bày và tên truy cập được dùng để truyền đạt biểu thức toán học, hãy dùng [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) để cung cấp chuỗi biểu diễn biểu thức đó. Nếu phần tử toán chứa nội dung có thể điều hướng và có nhãn hiển thị cho biểu thức, hãy dùng [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby). Nếu không, dùng `aria-label` để đặt tên cho biểu thức, ví dụ `aria-label="Định lý Pythagoras"`.

## Ví dụ

Nếu bạn dùng ảnh hoặc HTML không ngữ nghĩa để tạo phương trình, hãy dùng vai trò `math`.

<div role="math" aria-label="a^{2} + b^{2} = c^{2}">
   a<sup>2</sup> + b<sup>2</sup> = c<sup>2</sup>
</div>

Định lý Pythagoras ở trên được viết theo cách có thể truy cập như sau:

```html
<div role="math" aria-label="a^{2} + b^{2} = c^{2}">
  a<sup>2</sup> + b<sup>2</sup> = c<sup>2</sup>
</div>
```

Nếu dùng hình ảnh, thuộc tính `alt` sẽ được dùng cùng với vai trò `math`:

```html
<img src="pythagorean_theorem.gif" alt="a^{2} + b^{2} = c^{2}" role="math" />
```

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [MathML trên MDN](/en-US/docs/Web/MathML) và phần tử [`<math>`](/en-US/docs/Web/MathML/Reference/Element/math) (không phải HTML)
- [Đặc tả MathML](https://w3c.github.io/mathml/spec.html)
