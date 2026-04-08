---
title: Using the :target pseudo-class in selectors
short-title: Using :target
slug: Web/CSS/Guides/Selectors/Using_:target
page-type: guide
sidebar: cssref
---

Khi một URL trỏ đến một phần cụ thể của tài liệu thông qua [URL fragment identifier](/en-US/docs/Web/URI/Reference/Fragment#fragment), người dùng có thể khó nhận ra phần đó. Hướng dẫn này thảo luận về việc sử dụng CSS để thu hút sự chú ý đến phần tử đích của URL nhằm cải thiện trải nghiệm người dùng.

## Chọn phần tử đích

[Pseudo-class](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) {{cssxref(":target")}} được dùng để tạo kiểu cho phần tử đích của tài liệu được xác định bởi fragment identifier của URL. Ví dụ, URL `https://developer.mozilla.org/en-US/docs/Web/CSS#reference` chứa fragment identifier `#reference`. Trong HTML, identifier được tìm thấy dưới dạng giá trị của thuộc tính `id` hoặc `name`, vì cả hai dùng chung một namespace. Do đó, URL ví dụ sẽ trỏ đến phần tử có id là `reference` trong tài liệu đó.

Để tạo kiểu cho bất kỳ phần tử `h2` nào là đích của URL mà không ảnh hưởng đến bất kỳ loại phần tử nào khác, hãy sử dụng pseudo-class `:target` cùng với [type selector](/en-US/docs/Web/CSS/Reference/Selectors/Type_selectors):

```css
h2:target {
  outline: 2px solid;
}
```

Bạn cũng có thể tạo các kiểu dành riêng cho một fragment cụ thể của tài liệu. Điều này được thực hiện bằng cách sử dụng cùng giá trị định danh có trong URI. Do đó, để thêm màu nền cho fragment `#reference`, ta viết:

```css
#reference:target {
  background-color: yellow;
}
```

## Nhắm đến tất cả các phần tử

Nếu mục tiêu là tạo ra một kiểu "bao quát" áp dụng cho tất cả phần tử được nhắm đến, thì universal selector rất hữu ích:

```css
:target {
  color: red;
}
```

## Ví dụ

Trong ví dụ dưới đây, có năm liên kết trỏ đến các phần tử trong cùng tài liệu. Chọn liên kết "First" chẳng hạn sẽ làm cho `<h1 id="one">` trở thành phần tử đích. Lưu ý rằng tài liệu có thể nhảy đến vị trí cuộn mới, vì các phần tử đích được đặt lên đầu cửa sổ trình duyệt nếu có thể.

```html
<h4 id="one">…</h4>
<p id="two">…</p>
<div id="three">…</div>
<a id="four">…</a> <em id="five">…</em>

<a href="#one">First</a>
<a href="#two">Second</a>
<a href="#three">Third</a>
<a href="#four">Fourth</a>
<a href="#five">Fifth</a>
```

## Kết luận

Trong các trường hợp fragment identifier trỏ đến một phần của tài liệu, người đọc có thể bị nhầm lẫn về phần nào họ cần đọc. Bằng cách tạo kiểu cho phần tử đích của URI, sự nhầm lẫn của người đọc có thể được giảm thiểu hoặc loại bỏ.

## Xem thêm

- {{cssxref(":target")}}
